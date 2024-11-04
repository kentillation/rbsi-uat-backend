<?php

namespace App\Http\Controllers;

use App\Models\ClientInfoModel;
use App\Models\MBWinClientInfoModel;
use App\Models\TypesModel;
use App\Models\TitlesModel;
use App\Models\ClientStatusModel;
use App\Models\GendersModel;
use App\Models\CivilStatusModel;
use App\Models\InstitutionModel;
use App\Models\EntityModel;
use App\Models\EmploymentModel;
use App\Models\TaxCodeModel;
use App\Models\AddressModel;
use App\Models\AddressTypeModel;
use App\Models\AuthModel;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;

class ClientInfoController extends Controller
{
    protected $config = [
        'apiHttpType' => 'https',
        'apiServer' => 'localhost',
        'apiPort' => '6501',
        'apiUser' => 'ibclient',
        'apiPass' => '1234',
        'contentType' => 'application/json',
        'authenServer' => 'http://localhost:7000/api/v1/token/generate',
        'authenUser' => 'magnum',
        'authenPass' => 'a3pp3QNQ',
    ];

    // protected function generateAuthToken()
    // {
    //     $response = Http::withOptions([
    //         'verify' => false,
    //     ])->withHeaders([
    //         'Authorization' => 'Basic bWFnbnVtOmEzcHAzUU5R'
    //     ])->post($this->config['authenServer'], [
    //         'message_id' => 'b5efbb98793a4c4cbd363ed6f18b95b4fs5LVuxF'
    //     ]);
    //     Log::info('Token generation response', ['response' => $response->json()]);
    //     if ($response->successful() && isset($response->json()['data']['token'])) {
    //         return $response->json()['data']['token'];
    //     }
    //     Log::error('Token generation failed', [
    //         'response' => $response->json(),
    //         'status' => $response->status(),
    //     ]);
    //     return null;
    // }

    // public function generateMessageId()
    // {
    //     $uuid = Str::uuid()->toString();
    //     $messageId = str_replace('-', '', $uuid);
    //     if (strlen($messageId) < 40) {
    //         $randomString = strtolower(Str::random(40 - strlen($messageId)));
    //         $messageId .= $randomString;
    //     }
    //     return substr($messageId, 0, 40);
    // }

    public function getMBWinClientInfo()
    {
        try {
            $data = MBWinClientInfoModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function checkMBWinClientInfo(Request $request)
    {
        try {
            $exists = MBWinClientInfoModel::where('Name2', $request->input('first_name'))
                ->where('Name3', $request->input('middle_name'))
                ->where('Name1', $request->input('last_name'))
                ->exists();
            return response()->json(['exists' => $exists]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function checkNewDBClientInfo(Request $request)
    {
        try {
            $exists = ClientInfoModel::where('first_name', $request->input('first_name'))
                ->where('middle_name', $request->input('middle_name'))
                ->where('last_name', $request->input('last_name'))
                ->exists();
            return response()->json(['exists' => $exists]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getClientInfo(Request $request)
    {
        try {
            $search = $request->query('search');
            $clients = ClientInfoModel::where('cid', 'LIKE', "%{$search}%")
                ->orWhere('last_name', 'LIKE', "%{$search}%")
                ->orderBy('cid')
                ->get();
            return response()->json($clients);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function showClientInfo($cid, $last_name)
    {
        $client = ClientInfoModel::select(
            't_cif.*',
            't_cif_types.type',
            't_cif_titles.title',
            't_cif_client_status.client_status',
            't_cif_gender.gender',
            't_cif_civil_status.civil_status',
            't_cif_institution.institution',
            't_cif_entity.entity',
            't_cif_employment.employment',
            't_cif_tax_code.tax_code'
        )
            ->leftJoin('t_cif_types', 't_cif.type', '=', 't_cif_types.id')
            ->leftJoin('t_cif_titles', 't_cif.title', '=', 't_cif_titles.id')
            ->leftJoin('t_cif_client_status', 't_cif.client_status', '=', 't_cif_client_status.id')
            ->leftJoin('t_cif_gender', 't_cif.gender', '=', 't_cif_gender.id')
            ->leftJoin('t_cif_civil_status', 't_cif.civil_status', '=', 't_cif_civil_status.id')
            ->leftJoin('t_cif_institution', 't_cif.institution', '=', 't_cif_institution.id')
            ->leftJoin('t_cif_entity', 't_cif.entity', '=', 't_cif_entity.id')
            ->leftJoin('t_cif_employment', 't_cif.employment', '=', 't_cif_employment.id')
            ->leftJoin('t_cif_tax_code', 't_cif.tax_code', '=', 't_cif_tax_code.id')
            ->where('t_cif.cid', $cid)
            ->where('t_cif.last_name', $last_name)
            ->first();

        if ($client) {
            return response()->json($client);
        } else {
            return response()->json(['error' => 'OMG! Client not found.'], 404);
        }
    }

    public function showMBWinClientInfo($cid)
    {
        $clientInfo = MBWinClientInfoModel::with('address', 'relation')->find($cid);
        if (!$clientInfo) {
            return response()->json(['error' => 'Client not found'], 404);
        }
        return response()->json($clientInfo);
    }

    public function getClientImage($filename)
    {
        $path = storage_path('app/' . $filename);
        if (!File::exists($path)) {
            return response()->json(['message' => 'Image not found.'], 404);
        }
        $file = File::get($path);
        $type = File::mimeType($path);
        $response = Response::make($file, 200);
        $response->header("Content-Type", $type);
        return $response;
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
            'initial' => 'nullable|string',
            'display_name' => 'required|string',
            'staff_or_not' => 'required|integer|in:0,1',
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
            'address_line4' => 'required|string',
            'postal_code' => 'required|string',
            'address_type' => 'required|string',
            'telephone' => 'nullable|string',
            'fax' => 'nullable|string',
            'institution' => 'required|string',
            'entity' => 'required|string',
            'employment' => 'required|string',
            'image_file' => 'required|image|mimes:jpg,png,jpeg|max:2048',
            'tax_code' => 'required|string',
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
        $genderId = $request->input('gender');
        $civil_statusId = $request->input('civil_status');
        $address_typeId = $request->input('address_type');
        $institutionId = $request->input('institution');
        $entityId = $request->input('entity');
        $employmentId = $request->input('employment');
        $tax_codeId = $request->input('tax_code');
        $type = TypesModel::where('id', $typeId)->first();
        $title = TitlesModel::where('id', $titleId)->first();
        $client_status = ClientStatusModel::where('id', $client_statusId)->first();
        $gender = GendersModel::where('id', $genderId)->first();
        $civil_status = CivilStatusModel::where('id', $civil_statusId)->first();
        $address_type = AddressTypeModel::where('id', $address_typeId)->first();
        $institution = InstitutionModel::where('id', $institutionId)->first();
        $entity = EntityModel::where('id', $entityId)->first();
        $employment = EmploymentModel::where('id', $employmentId)->first();
        $tax_code = TaxCodeModel::where('id', $tax_codeId)->first();
        if (!$type) {
            return response()->json(['message' => 'Invalid type value.'], 422);
        }
        if (!$title) {
            return response()->json(['message' => 'Invalid title value.'], 422);
        }
        if (!$client_status) {
            return response()->json(['message' => 'Invalid client status value.'], 422);
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
        if (!$tax_code) {
            return response()->json(['message' => 'Invalid tax code value.'], 422);
        }

        $customerData = $request->all();
        $customerData = [
            "messageId" => "af246cf2d14018d2bf81220e24c46ec9f5ede4c1",
            "token" => "677df007a30adb8a263bffd4ca60678e335c3dc4",
            "br" => "000000",
            "cid" => "",
            "cidType" => "001",
            "title" => $title->title_code,
            "name3" => $request->input('first_name'),
            "name2" => $request->input('middle_name'),
            "name1" => $request->input('last_name'),
            "initials" => $request->input('initial'),
            "mobile1" => $request->input('mobile1'),
            "email1" => $request->input('email'),
            "gender" => $gender->gender_code,
            "civilStatus" => $civil_status->civil_status_code,
            "dob" => $request->input('birthdate'),
            "langType" => "001",
            "appType" => "1",
            "prType" => "51",
            "glCode" => "01",
            "ownershipType" => "010",
            "staff" => "F",
            "taxCode" => $tax_code->taxx_code,
            "address" => [
                [
                    "addressType" => $address_type->address_code,
                    "line1" => $request->input('address_line1'),
                    "primary" => "T",
                    "mailing" => "T",
                    "tempMailing" => "F",
                    "startDate" => "2024-09-17" // ?
                ]
            ],
            "ccCode1" => $institution->institution_id,
            "ccCode2" => $entity->entity_id,
            "ccCode3" => $employment->employment_id,
            "regDate" => "2024-09-20", // ?
            "relation" => [
                [
                    "cid" => "000281", // to add
                    "relationType" => "051" // to add
                ],
                [
                    "cid" => "000282", // to add
                    "relationType" => "051" // to add
                ]
            ]
        ];
        $apiUrl = "http://localhost:6500/datasnap/rest/client/createCustomer";
        $response = Http::withHeaders([
            'Content-Type' => $this->config['contentType'],
            'Authorization' => "Basic aWJjbGllbnQ6MTIzNA=="
        ])->post($apiUrl, $customerData);
        if ($response->successful()) {
            // $responseData = $response->json();
            function generateHash($length = 10)
            {
                $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
                $charactersLength = strlen($characters);
                $randomString = '';
                for ($i = 0; $i < $length; $i++) {
                    $randomString .= $characters[random_int(0, $charactersLength - 1)];
                }
                return $randomString;
            }

            $hash = generateHash(10);
            $newCid = ClientInfoModel::max('cid') ? str_pad(intval(ClientInfoModel::max('cid')) + 1, 6, '0', STR_PAD_LEFT) : '000295';
            $newAddr_recid = AddressModel::max('addr_recid') ? intval(AddressModel::max('addr_recid')) + 1 : '295';
            try {
                DB::transaction(function () use ($request, $filePath, $newCid, $type, $title, $client_status, $gender, $civil_status, $institution, $entity, $employment, $tax_code, $hash) {
                    ClientInfoModel::create([
                        'cid' => $newCid,
                        'type' => $type->type_code,
                        'title' => $title->title_code,
                        'client_status' => $client_status->client_status_code,
                        'first_name' => $request->input('first_name'),
                        'middle_name' => $request->input('middle_name'),
                        'last_name' => $request->input('last_name'),
                        'initial' => $request->input('initial'),
                        'display_name' => $request->input('display_name'),
                        'staff_or_not' => $request->input('staff_or_not'),
                        'tin' => $request->input('tin'),
                        'gender' => $gender->gender_code,
                        'civil_status' => $civil_status->civil_status_code,
                        'birthdate' => $request->input('birthdate'),
                        'mobile1' => $request->input('mobile1'),
                        'mobile2' => $request->input('mobile2'),
                        'email' => $request->input('email'),
                        'nationality' => $request->input('nationality'),
                        'institution' => $institution->institution_id,
                        'entity' => $entity->entity_id,
                        'employment' => $employment->employment_id,
                        'tax_code' => $tax_code->taxx_code,
                        'image_file' => $filePath,
                        'branch' => '000000',
                        'hash' => $hash,
                    ]);
                });

                DB::transaction(function () use ($request, $newCid, $address_type, $hash, $newAddr_recid) {
                    AddressModel::create([
                        'cid' => $newCid,
                        'address_type' => $address_type->address_code,
                        'line1' => $request->input('address_line1'),
                        'line2' => $request->input('address_line2'),
                        'line3' => $request->input('address_line3'),
                        'line4' => $request->input('address_line4'),
                        'postal_code' => $request->input('postal_code'),
                        'telephone' => $request->input('telephone'),
                        'fax' => $request->input('fax'),
                        'hash' => $hash,
                        'branch' => '000000',
                        'addr_recid' => $newAddr_recid,

                    ]);
                });
            } catch (\Exception $e) {
                return response()->json([
                    'message' => 'Error: ' . $e->getMessage(),
                    'trace' => $e->getTraceAsString()
                ], 500);
            }
            // DB::transaction(function () use ($messageId, $token) {
            //     AuthModel::create([
            //         'generated_message_id' => $messageId,
            //         'generated_token' => $token,
            //     ]);
            // });

            return response()->json(['message' => 'Client has been saved successfully.'], 200);
        } else {
            return response()->json(['message' => 'Failed to create customer', 'error' => $response->json()], $response->status());
        }
    }

    public function updateClient(Request $request, $cid)
    {
        $validator = Validator::make($request->all(), [
            'type' => 'required|integer',
            'title' => 'required|integer',
            'client_status' => 'required|integer',
            'first_name' => 'required|string',
            'middle_name' => 'required|string',
            'last_name' => 'required|string',
            'initial' => 'nullable|string',
            'display_name' => 'required|string',
            'staff_or_not' => 'required|integer',
            'tin' => 'nullable|string',
            'gender' => 'required|integer',
            'civil_status' => 'required|integer',
            'birthdate' => 'required|string',
            'mobile1' => 'required|string',
            'mobile2' => 'nullable|string',
            'email' => 'required|string|email',
            'nationality' => 'required|string',
            'address_line1' => 'required|string',
            'address_line2' => 'required|string',
            'address_line3' => 'required|string',
            'address_line4' => 'required|string',
            'postal_code' => 'required|string',
            'address_type' => 'required|integer',
            'telephone' => 'nullable|string',
            'fax' => 'nullable|string',
            'institution' => 'required|string',
            'entity' => 'required|string',
            'employment' => 'required|string',
            'tax_code' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 422);
        }

        // // Check if user exists in SQL Server
        $existingSqlsrvClient = MBWinClientInfoModel::where('Name1', $request->input('first_name'))
            ->where('Name2', $request->input('middle_name'))
            ->where('Name3', $request->input('last_name'))
            ->first();

        // // Check if Client exists in MySQL
        $existingMysqlClient = ClientInfoModel::where('first_name', $request->input('first_name'))
            ->where('middle_name', $request->input('middle_name'))
            ->where('last_name', $request->input('last_name'))
            ->where('gender', $request->input('gender'))
            ->where('birthdate', $request->input('birthdate'))
            ->where('staff_or_not', $request->input('staff_or_not'))
            ->first();

        if ($existingSqlsrvClient || $existingMysqlClient) {
            return response()->json(['message' => 'Client already exists.'], 409);
        }

        // Find existing client
        $client = ClientInfoModel::where('cid', $cid)->first();
        if (!$client) {
            return response()->json(['message' => 'Client not found.'], 404);
        }

        // Update client details
        DB::transaction(function () use ($request, $client) {
            $client->update([
                'type' => $request->input('type'),
                'title' => $request->input('title'),
                'client_status' => $request->input('client_status'),
                'first_name' => $request->input('first_name'),
                'middle_name' => $request->input('middle_name'),
                'last_name' => $request->input('last_name'),
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
                'address_line1' => $request->input('address_line1'),
                'address_line2' => $request->input('address_line2'),
                'address_line3' => $request->input('address_line3'),
                'address_line4' => $request->input('address_line4'),
                'postal_code' => $request->input('postal_code'),
                'address_type' => $request->input('address_type'),
                'telephone' => $request->input('telephone'),
                'fax' => $request->input('fax'),
                'institution' => $request->input('institution'),
                'entity' => $request->input('entity'),
                'employment' => $request->input('employment'),
                'tax_code' => $request->input('tax_code'),
            ]);
        });
        return response()->json(['message' => 'Client has been updated successfully.'], 200);
    }
}
