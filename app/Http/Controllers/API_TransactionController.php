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
use App\Models\ClientStatusModel;
use App\Models\GendersModel;
use App\Models\CivilStatusModel;
use App\Models\AddressTypeModel;
use App\Models\InstitutionModel;
use App\Models\EntityModel;
use App\Models\EmploymentModel;
use App\Models\RelationshipModel;
use App\Models\MBWinAddressModel;
use App\Models\AddressModel;
use App\Models\RelatedCIDModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Log;

class API_TransactionController extends Controller
{
    protected $partOf = [
        'branch' => '000000',
        'contentType' => 'application/json',
        'langType' => '001',
        'taxCode' => '001',
        'primary' => 'T',
        'mailing' => 'T',
        'tempMailing' => 'F',
        'locationCode' => 'OthrR00001',
        'line4' => 'Philippines',
        'apiURL' => 'http://localhost:6500/datasnap/rest/client',
        'auth_data' => 'Basic aWJjbGllbnQ6MTIzNA==',
        
    ];

    public function generateToken()
    {
        try {
            $authkey = config('services.mbwin.auth_key');
            $authURL = config('services.mbwin.auth_url');
            $authPort = config('services.mbwin.auth_port');
            $authLastRepo = config('services.mbwin.auth_last_repo');
            $messageId = str_replace('-', '', Str::uuid()->toString());
            $headers = [
                'Authorization' => 'Basic ' . $authkey,
                'Content-Type'  => $this->partOf['contentType'],
            ];
            $payload = [
                'message_id' => $messageId,
            ];
            $response = Http::withHeaders($headers)->post(
                $authURL . ':' . $authPort . $authLastRepo,
                $payload
            );
            if ($response->successful()) {
                return[
                    'success'    => true,
                    'token'      => $response->json('data.token'),
                    'messageId'  => $messageId,
                ];
            } else {
                throw new \Exception($response->json('message', 'Failed to generate token'));
            }
            
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }
    public function addNewClient(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'type' => 'required|string',
            'title' => 'required|string',
            'client_status' => 'required|string',
            'first_name' => 'required|string',
            'middle_name' => 'required|string',
            'last_name' => 'required|string',
            'suffix' => 'nullable|string',
            'initial' => 'nullable|string',
            'display_name' => 'required|string',
            'staff_or_not' => 'required|in:1,2',
            'tin' => 'nullable|string',
            'gender' => 'required|string',
            'civil_status' => 'required|string',
            'birthdate' => 'required|string',
            'mobile1' => 'required|string',
            'mobile2' => 'nullable|string',
            'email' => 'required|string|email',
            'nationality' => 'required|string',
            'address_line1' => 'required|string',
            'address_line2' => 'required|string',
            'address_line3' => 'required|string',
            'line4' => 'nullable|string',
            'postal_code' => 'required|string',
            'address_type' => 'nullable|string',
            'telephone' => 'nullable|string',
            'fax' => 'nullable|string',
            'institution' => 'required|string',
            'entity' => 'required|string',
            'employment' => 'required|string',
            'image_file' => 'required|image|mimes:jpg,png,jpeg|max:2048',
            'tax_code' => 'nullable|string',
        ]);
        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 422);
        }
        $filePath = null;
        if ($request->hasFile('image_file')) {
            $image = $request->file('image_file');
            $test = '';
            $filename = time() . '.' . $image->getClientOriginalExtension();
            $filePath = $image->storeAs($test, $filename);
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
        $client_statusId = $request->input('client_status');
        $suffixesId = $request->input('suffix');
        $genderId = $request->input('gender');
        $civil_statusId = $request->input('civil_status');
        $staff_or_not = $request->input('staff_or_not');
        $address_typeId = $request->input('address_type');
        $institutionId = $request->input('institution');
        $entityId = $request->input('entity');
        $employmentId = $request->input('employment');
        $type = TypesModel::where('id', $typeId)->first();
        $title = TitlesModel::where('id', $titleId)->first();
        $sufFix = SuffixesModel::where('id', $suffixesId)->first();
        $client_status = ClientStatusModel::where('id', $client_statusId)->first();
        $gender = GendersModel::where('id', $genderId)->first();
        $civil_status = CivilStatusModel::where('id', $civil_statusId)->first();
        $address_type = AddressTypeModel::where('id', $address_typeId)->first();
        $institution = InstitutionModel::where('id', $institutionId)->first();
        $entity = EntityModel::where('id', $entityId)->first();
        $employment = EmploymentModel::where('id', $employmentId)->first();
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
        if (!$client_status) {
            return response()->json(['message' => 'Invalid client status value.'], 422);
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
        if (!$institution) {
            return response()->json(['message' => 'Invalid institution value.'], 422);
        }
        if (!$entity) {
            return response()->json(['message' => 'Invalid entity value.'], 422);
        }
        if (!$employment) {
            return response()->json(['message' => 'Invalid employment value.'], 422);
        }
        date_default_timezone_set('Asia/Manila');
        $currentDate = date("Y-m-d");
        $tokenResponse = $this->generateToken();
        $customerData = $request->all();
        $customerData = [
            "messageId" => $tokenResponse['messageId'],
            "token" => $tokenResponse['token'],
            "br" => $this->partOf['branch'],
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
            "mobile2" => $request->input('mobile2'),
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
                    "line1" => "Brgy. " . $request->input('address_line1'),
                    "line2" => $request->input('address_line2') . " City",
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
            "ccCode1" => $institution->institution_id,
            "ccCode2" => $entity->entity_id,
            "ccCode3" => $employment->employment_id,
            "locationCode" => $this->partOf['locationCode'],
            "regDate" => $currentDate,
        ];
        // Check if a relationship is provided
        $relationshipId = $request->input('relationship');
        if (!empty($relationshipId)) {
            $relationship = RelationshipModel::where('id', $relationshipId)->first();
            if ($relationship) {
                $customerData["relation"] = [
                    [
                        "cid" => $request->input('rel_cid',0),
                        "relationType" => $relationship->relationship_id,
                    ]
                ];
            }
        }
        $apiUrl = $this->partOf['apiURL'] . "/createCustomer";
        $response = Http::withHeaders([
            'Content-Type' => $this->partOf['contentType'],
            'Authorization' => $this->partOf['auth_data'],
        ])->post($apiUrl, $customerData);
        if ($response->successful()) {
            $responseData = $response->json();
            try {
                $newCID = $responseData['cid'];
                $newAddr_Recid = MBWinAddressModel::max('Addr_Recid');
                DB::transaction(function () use ($request, $newCID, $filePath) {
                    ClientInfoModel::create([
                        'cid' => $newCID,
                        'type' => $request->input('type'),
                        'address_type' => $request->input('address_type'),
                        'title' => $request->input('title'),
                        'client_status' => $request->input('client_status'), // Change it, must be automate
                        'first_name' => $request->input('first_name'),
                        'middle_name' => $request->input('middle_name'),
                        'last_name' => $request->input('last_name'),
                        'suffix' => $request->input('suffix'),
                        'initial' => $request->input('initial'),
                        'display_name' => $request->input('display_name'),
                        'staff_or_not' => $request->input('staff_or_not'),
                        'tin' => $request->input('tin'),
                        'gender' => $request->input('gender'),
                        'civil_status' => $request->input('civil_status'),
                        'birthdate' => $request->input('birthdate'),
                        'mobile1' => $request->input('mobile1'),
                        'mobile2' => $request->input('mobile2'),
                        'email' => $request->input('email'),
                        'nationality' => $request->input('nationality'),
                        'institution' => $request->input('institution'), //Must be automate
                        'entity' => $request->input('entity'), //Must be automate
                        'employment' => $request->input('employment'), //Must be automate
                        'tax_code' => $this->partOf['taxCode'],
                        'image_file' => $filePath,
                        'branch' => $this->partOf['branch']
                    ]);
                });
                DB::transaction(function () use ($request, $newCID, $newAddr_Recid) {
                    AddressModel::create([
                        'cid' => $newCID,
                        'address_type' => $request->input('address_type'),
                        'address_line1' => $request->input('address_line1'),
                        'address_line2' => $request->input('address_line2'),
                        'address_line3' => $request->input('address_line3'),
                        'line4' => $this->partOf['line4'],
                        'postal_code' => $request->input('postal_code'),
                        'telephone' => $request->input('telephone'),
                        'fax' => $request->input('fax'),
                        'branch' => '000000',
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
                    'message' => 'Client has been saved successfully.',
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
    public function createAccount (Request $request) {
        $tokenResponse = $this->generateToken();

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
        $payload = [
            "messageId" => $tokenResponse['messageId'],
            "token" => $tokenResponse['token'],
            "br" => $this->partOf['branch'],
            "cid" => $request->input('cid'),
            "appType" => $appType->app_type_code,
            "prType" => $productType->product_type_code,
            "ownershipType" => $ownershipType->ownership_type_code,
            "maturityDate" => $request->input('maturity_date'),
            "glCode" => "51", // 51 & 52 = Savings, 25 = Current
            "accCode1" => "000",
            "signCode" => "001",
            "signRule" => "empty"
        ];
        $apiUrl = $this->partOf['apiURL'] . "/createAccount";
        $response = Http::withHeaders([
            'Content-Type' => $this->partOf['contentType'],
            'Authorization' => $this->partOf['auth_data'],
        ])->post($apiUrl, $payload);
        if ($response->successful()) {
            return response()->json([
                'message' => 'New account has been created successfully!',
                'data' => $response->json()
            ], 200);
        } else {
            return response()->json(['message' => 'Failed creating account', 'error' => $response->json()], $response->status());
        }
    }
    public function accountList($cid) {
        $tokenResponse = $this->generateToken();
        $payload = [
            "messageId" => $tokenResponse['messageId'],
            "token" => $tokenResponse['token'],
            "br" => $this->partOf['branch'],
            "cid" => $cid,
            "appType" => "*",
            "includeRelatedAccTF"  => "T",
            "includeClosedAccTF"  => "T"
        ];
        $apiUrl = $this->partOf['apiURL'] . "/accountList";
        $response = Http::withHeaders([
            'Content-Type' => $this->partOf['contentType'],
            'Authorization' => $this->partOf['auth_data'],
        ])->post($apiUrl, $payload);
        if ($response->successful()) {
            return response()->json([
                'message' => 'Fetching account is success!',
                'data' => $response->json()
            ], 200);
        }
        else {
            return response()->json([
                'message' => 'Failed fetching account',
                'error' => $response->json()
            ], $response->status());
        }
    }    
    public function accountEnquiry (Request $request) {
        $tokenResponse = $this->generateToken();
        $payload = [
            "messageId" => $tokenResponse['messageId'],
            "token" => $tokenResponse['token'],
            "br" => $this->partOf['branch'],
            "acc" => $request->input('acc'),
            "appType" => $request->input('appType')
        ];
        $apiUrl = $this->partOf['apiURL'] . "/accountEnquiry";
        $response = Http::withHeaders([
            'Content-Type' => $this->partOf['contentType'],
            'Authorization' => $this->partOf['auth_data'],
        ])->post($apiUrl, $payload);
        if ($response->successful()) {
            return response()->json([
                'message' => 'Fetching account success!',
                'data' => $response->json()
            ], 200);
        } else {
            return response()->json(['message' => 'Failed fetching account', 'error' => $response->json()], $response->status());
        }
    }
    public function accountTransactionHistory (Request $request) {
        $tokenResponse = $this->generateToken();
        $payload = [
            "messageId" => $tokenResponse['messageId'],
            "token" => $tokenResponse['token'],
            "br" => $this->partOf['branch'],
            "acc" => $request->input('acc'),
            "filterType"=>"1", // 1=By date, 2=By recid, 3 = By seqRef
            "startDate"=> $request->input('startDate'),
            "endDate"=> $request->input('endDate'),
        ];
        $apiUrl = $this->partOf['apiURL'] . "/accountTransactionHistory";
        $response = Http::withHeaders([
            'Content-Type' => $this->partOf['contentType'],
            'Authorization' => $this->partOf['auth_data'],
        ])->post($apiUrl, $payload);
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
