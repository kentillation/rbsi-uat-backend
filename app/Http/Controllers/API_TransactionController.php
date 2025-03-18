<?php

namespace App\Http\Controllers;

use App\Models\MBWinClientInfoModel;
use App\Models\ClientInfoModel;
use App\Models\AppTypeModel;
use App\Models\ProductTypeModel;
use App\Models\OwnershipTypeModel;
use App\Models\TypesModel;
use App\Models\TitlesModel;
use App\Models\SuffixesModel;
use App\Models\GendersModel;
use App\Models\CivilStatusModel;
use App\Models\AddressTypeModel;
use App\Models\RelationshipModel;
use App\Models\MBWinAddressModel;
use App\Models\AddressModel;
use App\Models\RelatedCIDModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;

class API_TransactionController extends Controller
{
    protected $partOf = [
        'contentType' => 'application/json',
        'langType' => '001',
        'taxCode' => '001',
        'primary' => 'T',
        'mailing' => 'T',
        'tempMailing' => 'F',
        'locationCode' => 'OthrR00001',
        'line4' => 'Negros Island Region',

    ];

    private function getServiceConfig()
    {
        return [
            'authKey' => config('services.mbwin.auth_key'),
            'authURL' => config('services.mbwin.auth_url'),
            'authPort' => config('services.mbwin.auth_port'),
            'authLastRepo' => config('services.mbwin.auth_last_repo'),
            'branch' => config('services.mbwin.branch'),
            'authData' => config('services.mbwin.auth_data'),
            'apiURL' => config('services.mbwin.api_url'),
        ];
    }

    private function generateToken()
    {
        try {
            $config = $this->getServiceConfig();
            $authURL = $config['authURL'];
            $authLastRepo = $config['authLastRepo'];
            $authPort = $config['authPort'];
            $authKey = $config['authKey'];
            $apiURL = $authURL . ":" . $authPort . $authLastRepo;
            $messageId = str_replace('-', '', Str::uuid()->toString());
            Log::info("Token Generation Request to: " . $apiURL);
            $response = Http::withHeaders([
                'Authorization' => 'Basic ' . $authKey,
                'Content-Type' => 'application/json',
            ])->timeout(30)->post($apiURL, [
                'message_id' => $messageId,
            ]);
            Log::info("Token Response: " . $response->body());
            if ($response->successful()) {
                return [
                    'success' => true,
                    'messageId' => $response->json()['messageId'] ?? null,
                    'token' => $response->json()['token'] ?? null,
                ];
            } else {
                Log::error("Failed to generate token. Status: " . $response->status());
                Log::error("Error Response: " . $response->body());
                return ['success' => false];
            }
        } catch (\Exception $e) {
            Log::error("Exception in generateToken(): " . $e->getMessage());
            Log::error("Exception Trace: " . $e->getTraceAsString());
            return ['success' => false];
        }
    }


    public function addNewClient(Request $request)
    {
        $config = $this->getServiceConfig();
        $branch = $config['branch'];
        $authData = $config['authData'];
        $validator = Validator::make($request->all(), [
            'type' => 'required|string',
            'title' => 'required|string',
            'first_name' => 'required|string',
            'middle_name' => 'required|string',
            'last_name' => 'required|string',
            'suffix' => 'nullable|string',
            'initial' => 'nullable|string',
            'display_name' => 'required|string',
            'staff_or_not' => 'required|in:1,2',
            'gender' => 'required|string',
            'civil_status' => 'required|string',
            'birthdate' => 'required|string',
            'mobile1' => 'required|string',
            'email' => 'required|string|email',
            'nationality' => 'required|string',
            'line1' => 'nullable|string',
            'line2' => 'nullable|string',
            'line3' => 'nullable|string',
            'line4' => 'nullable|string',
            'postal_code' => 'required|string',
            'address_type' => 'nullable|string',
            'telephone' => 'nullable|string',
            'image_file' => 'required|image|mimes:jpg,png,jpeg|max:2048',
            'tax_code' => 'nullable|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 422);
        }
        if ($request->hasFile('image_file')) {
            $image = $request->file('image_file');
            $lastName = $request->input('last_name');
            $firstName = $request->input('first_name');
            $middleName = $request->input('middle_name');
            $folderName = $lastName . ", " . $firstName . " " . $middleName;
            $folderPath = 'client_files/' . $folderName;
            $fileName = time() . '_' . $image->getClientOriginalName();
            if (!File::exists($folderPath)) {
                File::makeDirectory($folderPath, 0777, true, true);
            }
            $image->move($folderPath, $fileName);
        }

        $existingSqlsrvClient = MBWinClientInfoModel::where('Name1', $request->input('first_name'))
            ->where('Name2', $request->input('middle_name'))
            ->where('Name3', $request->input('last_name'))
            ->first();
        $existingMysqlClient = ClientInfoModel::where('first_name', $request->input('first_name'))
            ->where('middle_name', $request->input('middle_name'))
            ->where('last_name', $request->input('last_name'))
            ->first();
        if ($existingSqlsrvClient || $existingMysqlClient) {
            return response()->json(['message' => 'Client already exists.'], 409);
        }
        $typeId = $request->input('type');
        $titleId = $request->input('title');
        $suffixesId = $request->input('suffix');
        $genderId = $request->input('gender');
        $civil_statusId = $request->input('civil_status');
        $staff_or_not = $request->input('staff_or_not');
        $address_typeId = $request->input('address_type');
        $type = TypesModel::where('id', $typeId)->first();
        $title = TitlesModel::where('id', $titleId)->first();
        $sufFix = SuffixesModel::where('id', $suffixesId)->first();
        $gender = GendersModel::where('id', $genderId)->first();
        $civil_status = CivilStatusModel::where('id', $civil_statusId)->first();
        $address_type = AddressTypeModel::where('id', $address_typeId)->first();
        if ($staff_or_not == 1) {
            $staff = 'T';
        }
        if ($staff_or_not == 2) {
            $staff = 'F';
        }
        if (!$type) {
            return response()->json(['message' => 'Invalid type value.'], 422);
        }
        if (!$title) {
            return response()->json(['message' => 'Invalid title value.'], 422);
        }
        if (!$sufFix) {
            return response()->json(['message' => 'Invalid suffix value.'], 422);
        }
        if (!$gender) {
            return response()->json(['message' => 'Invalid gender value.'], 422);
        }
        if (!$civil_status) {
            return response()->json(['message' => 'Invalid civil status value.'], 422);
        }
        if (!$address_type) {
            return response()->json(['message' => 'Invalid address type value.'], 422);
        }
        date_default_timezone_set('Asia/Manila');
        $currentDate = date("Y-m-d");
        $tokenResponse = $this->generateToken();
        if (!$tokenResponse['success']) {
            return response()->json(['message' => 'Failed to generate token'], 500);
        }
        $customerData = $request->all();
        $customerData = [
            "messageId" => $tokenResponse['messageId'], // Correctly access messageId
            "token" => $tokenResponse['token'],
            "br" => $branch,
            "cid" => "",
            "cidType" => $type->type_code,
            "title" => $title->title_code,
            "name1" => $request->input('last_name'),
            "name2" => $request->input('first_name'),
            "name3" => $request->input('middle_name'),
            "name4" => $sufFix->suffix,
            "displayName" => $request->input('display_name'),
            "initials" => $request->input('initial'),
            "mobile1" => $request->input('mobile1'),
            "email1" => $request->input('email'),
            "email2" => $request->input('nationality'), //MBWin bug
            "gender" => $gender->gender_code,
            "civilStatus" => $civil_status->civil_status_code,
            "dob" => $request->input('birthdate'),
            "langType" => $this->partOf['langType'],
            "staff" => $staff,
            "taxCode" => $this->partOf['taxCode'],
            "address" => [
                [
                    "addressType" => $address_type->address_code,
                    "line1" => $request->input('address_line1'),
                    "line2" => $request->input('address_line2'),
                    "line3" => $request->input('address_line3'),
                    "line4" => $this->partOf['line4'],
                    "postalCode" => $request->input('postal_code'),
                    "phone1" => $request->input('telephone'),
                    "primary" => $this->partOf['primary'],
                    "mailing" => $this->partOf['mailing'],
                    "tempMailing" => $this->partOf['tempMailing'],
                    "startDate" => $currentDate
                ]
            ],
            "ccCode1" => "000", // institution_id
            "ccCode2" => "000", // entity_id
            "ccCode3" => "010", // employment_id,
            "locationCode" => $this->partOf['locationCode'],
            "regDate" => $currentDate,
        ];
        $relationshipId = $request->input('relationship');
        if (!empty($relationshipId)) {
            $relationship = RelationshipModel::where('id', $relationshipId)->first();
            if ($relationship) {
                $customerData["relation"] = [
                    [
                        "cid" => $request->input('rel_cid', 0),
                        "relationType" => $relationship->relationship_id,
                    ]
                ];
            }
        }
        $apiURL = $config['apiURL'];
        $apiEndPoint = $apiURL . "/createCustomer";
        $response = Http::withHeaders([
            'Content-Type' => $this->partOf['contentType'],
            'Authorization' => 'Basic ' . $authData,
        ])->post($apiEndPoint, $customerData);
        if ($response->successful()) {
            $responseData = $response->json();
            try {
                $newCID = $responseData['cid'];
                $newCID = "000037";
                $newAddr_Recid = MBWinAddressModel::max('Addr_Recid');
                DB::transaction(function () use ($request, $branch, $newCID, $fileName) {
                    ClientInfoModel::create([
                        'cid' => $newCID,
                        'type' => $request->input('type'),
                        'address_type' => $request->input('address_type'),
                        'title' => $request->input('title'),
                        'client_status' => "1",
                        'first_name' => $request->input('first_name'),
                        'middle_name' => $request->input('middle_name'),
                        'last_name' => $request->input('last_name'),
                        'suffix' => $request->input('suffix'),
                        'initial' => $request->input('initial'),
                        'display_name' => $request->input('display_name'),
                        'staff_or_not' => $request->input('staff_or_not'),
                        'gender' => $request->input('gender'),
                        'civil_status' => $request->input('civil_status'),
                        'birthdate' => $request->input('birthdate'),
                        'mobile1' => $request->input('mobile1'),
                        'email' => $request->input('email'),
                        'nationality' => $request->input('nationality'),
                        'institution' => "1",
                        'entity' => "1",
                        'employment' => "7",
                        'tax_code' => $this->partOf['taxCode'],
                        'image_file' => $fileName,
                        'branch' => $branch
                    ]);
                });
                DB::transaction(function () use ($request, $branch, $newCID, $newAddr_Recid) {
                    AddressModel::create([
                        'cid' => $newCID,
                        'address_type' => $request->input('address_type'),
                        'line1' => $request->input('address_line1'),
                        'line2' => $request->input('address_line2'),
                        'line3' => $request->input('address_line3'),
                        'line4' => $this->partOf['line4'],
                        'postal_code' => $request->input('postal_code'),
                        'telephone' => $request->input('telephone'),
                        'branch' => $branch,
                        'addr_recid' => $newAddr_Recid,
                    ]);
                });
                DB::transaction(function () use ($request, $newCID) {
                    RelatedCIDModel::create([
                        'cid' => $newCID,
                        'rel_cid' => $request->input('rel_cid'),
                        'relationship_id' => $request->input('relationship'),
                    ]);
                });

                return response()->json([
                    'message' => 'New client has been saved successfully.',
                    'data' => $responseData
                ], 200);
            } catch (\Exception $e) {
                return response()->json([
                    'message' => 'Error: ' . $e->getMessage(),
                    'trace' => $e->getTraceAsString()
                ], 500);
            }
        } else {
            return response()->json(['message' => 'Failed to create customer', 'error' => $response->json()], $response->status());
        }
    }

    public function createAccount(Request $request)
    {
        $config = $this->getServiceConfig();
        $branch = $config['branch'];
        $authData = $config['authData'];
        $tokenResponse = $this->generateToken();
        if (!$tokenResponse['success']) {
            return response()->json(['message' => 'Failed to generate token'], 500);
        }
        $date = new \DateTime('now', new \DateTimeZone('Asia/Manila'));
        $date->modify('+2 years');
        $formattedDate = $date->format('Y-m-d');
        $appTypeId = $request->input('app_type');
        $productTypeId = $request->input('product_type');
        $ownershipTypeId = $request->input('ownership_type');
        $appType = AppTypeModel::where('id', $appTypeId)->first();
        $productType = ProductTypeModel::where('id', $productTypeId)->first();
        $ownershipType = OwnershipTypeModel::where('id', $ownershipTypeId)->first();
        if (!$appType) {
            return response()->json(['message' => 'Invalid application type value.'], 422);
        }
        if (!$productType) {
            return response()->json(['message' => 'Invalid product type value.'], 422);
        }
        if (!$ownershipType) {
            return response()->json(['message' => 'Invalid ownership type value.'], 422);
        }
        $basePayload = [
            "messageId" => $tokenResponse['messageId'], // Correctly access messageId
            "token" => $tokenResponse['token'],
            "br" => $branch,
            "cid" => $request->input('cid'),
            "appType" => $appType->app_type_code,
            "prType" => $productType->product_type_code,
            "ownershipType" => $ownershipType->ownership_type_code,
            "maturityDate" => $formattedDate,
            "signCode" => "001",
            "signRule" => "empty"
        ];
        switch ($productType->product_type_code) {
            case 51:
                $basePayload["glCode"] = $request->input('gl_code');
                $basePayload["accCode1"] = "000";
                break;
            case 52:
                $basePayload["glCode"] = $request->input('gl_code');
                $basePayload["accCode1"] = "000";
                break;
            case 25:
                $basePayload["glCode"] = $request->input('gl_code');
                break;
            case 20:
                $basePayload["glCode"] = $productType->product_type_code;
                break;
            default:
                throw new \Exception("Unsupported product type code: " . $productType->product_type_code);
        }

        $payload = $basePayload;
        Log::info(json_encode($payload));
        $apiURL = $config['apiURL'];
        $apiEndPoint = $apiURL . "/createAccount";
        $response = Http::withHeaders([
            'Content-Type' => $this->partOf['contentType'],
            'Authorization' => 'Basic ' . $authData,
        ])->post($apiEndPoint, $payload);
        if ($response->successful()) {
            return response()->json([
                'message' => 'New account has been created successfully!',
                'data' => $response->json()
            ], 200);
        } else {
            return response()->json(['message' => 'Failed creating account', 'error' => $response->json()], $response->status());
        }
    }

    public function accountList($cid)
    {
        $config = $this->getServiceConfig();
        $branch = $config['branch'];
        $apiURL = $config['apiURL'];
        $authData = $config['authData'];
        $tokenResponse = $this->generateToken();
        if (!$tokenResponse['success']) {
            return response()->json(['message' => 'Failed to generate token'], 500);
        }
        $payload = [
            "messageId" => $tokenResponse['messageId'], // Correctly access messageId
            "token" => $tokenResponse['token'],
            "br" => $branch,
            "cid" => $cid,
            "appType" => "*",
            "includeRelatedAccTF"  => "T",
            "includeClosedAccTF"  => "T"
        ];
        $apiEndPoint = $apiURL . "/accountList";
        $response = Http::withHeaders([
            'Content-Type' => $this->partOf['contentType'],
            'Authorization' => 'Basic ' . $authData,
        ])->post($apiEndPoint, $payload);
        if ($response->successful()) {
            return response()->json([
                'message' => 'Fetching account is success!',
                'data' => $response->json()
            ], 200);
        } else {
            return response()->json([
                'message' => 'Failed fetching account',
                'error' => $response->json()
            ], $response->status());
        }
    }

    public function accountEnquiry(Request $request)
    {
        $config = $this->getServiceConfig();
        $branch = $config['branch'];
        $apiURL = $config['apiURL'];
        $authData = $config['authData'];
        $tokenResponse = $this->generateToken();
        if (!$tokenResponse['success']) {
            return response()->json(['message' => 'Failed to generate token'], 500);
        }
        $payload = [
            "messageId" => $tokenResponse['messageId'],
            "token" => $tokenResponse['token'],
            "br" => $branch,
            "acc" => $request->input('acc'),
            "appType" => $request->input('appType')
        ];
        $apiEndPoint = $apiURL . "/accountEnquiry";
        $response = Http::withHeaders([
            'Content-Type' => $this->partOf['contentType'],
            'Authorization' => 'Basic ' . $authData,
        ])->post($apiEndPoint, $payload);
        if ($response->successful()) {
            return response()->json([
                'message' => 'Fetching account success!',
                'data' => $response->json()
            ], 200);
        } else {
            return response()->json([
                'message' => 'Failed fetching account',
                'error' => $response->json()
            ], $response->status());
        }
    }

    public function accountTransactionHistory(Request $request)
    {
        $config = $this->getServiceConfig();
        $branch = $config['branch'];
        $apiURL = $config['apiURL'];
        $authData = $config['authData'];
        $tokenResponse = $this->generateToken();
        if (!$tokenResponse['success']) {
            return response()->json(['message' => 'Failed to generate token'], 500);
        }
        $payload = [
            "messageId" => $tokenResponse['messageId'], // Correctly access messageId
            "token" => $tokenResponse['token'],
            "br" => $branch,
            "acc" => $request->input('acc'),
            "filterType" => "1", // 1=By date, 2=By recid, 3 = By seqRef
            "startDate" => $request->input('startDate'),
            "endDate" => $request->input('endDate'),
        ];
        $apiEndPoint = $apiURL . "/accountTransactionHistory";
        $response = Http::withHeaders([
            'Content-Type' => $this->partOf['contentType'],
            'Authorization' => 'Basic ' . $authData,
        ])->post($apiEndPoint, $payload);
        if ($response->successful()) {
            return response()->json([
                'message' => 'Fetching account history is success!',
                'data' => $response->json()
            ], 200);
        } else {
            return response()->json(['message' => 'Failed fetching account history', 'error' => $response->json()], $response->status());
        }
    }
}
