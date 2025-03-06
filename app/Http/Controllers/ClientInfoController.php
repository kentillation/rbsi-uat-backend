<?php

namespace App\Http\Controllers;

use App\Models\ClientInfoModel;
use App\Models\MBWinClientInfoModel;
// use App\Models\AppTypesModel;
// use App\Models\TaxCodeModel;
// use App\Models\AuthModel;
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
use App\Models\MBWinClientAccModel;

use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;

class ClientInfoController extends Controller
{
    // DATABASE
    public function checkClientInfo_MBWIN(Request $request)
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
    public function checkClientInfo_PHPMYADMIN(Request $request)
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
    public function getClientInfo_search_PHPMYADMIN(Request $request)
    {
        try {
            $search = $request->query('search');
            $clients = ClientInfoModel::where('cid', 'LIKE', "%{$search}%")
                ->orWhere('last_name', 'LIKE', "%{$search}%")
                ->orderBy('cid')
                ->with('address')
                ->get();
            return response()->json($clients);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getClientInfo_FILTERED_PHPMYADMIN($cid, $last_name)
    {
        $client = ClientInfoModel::select(
            't_cif.*',
            't_cif_suffixes.suffix',
            't_cif_types.type',
            't_cif_titles.title',
            't_cif_client_status.client_status',
            't_cif_gender.gender',
            't_cif_civil_status.civil_status',
            't_cif_address_type.address_type'
        )
            ->leftJoin('t_cif_suffixes', 't_cif.suffix', '=', 't_cif_suffixes.id')
            ->leftJoin('t_cif_types', 't_cif.type', '=', 't_cif_types.id')
            ->leftJoin('t_cif_titles', 't_cif.title', '=', 't_cif_titles.id')
            ->leftJoin('t_cif_client_status', 't_cif.client_status', '=', 't_cif_client_status.id')
            ->leftJoin('t_cif_gender', 't_cif.gender', '=', 't_cif_gender.id')
            ->leftJoin('t_cif_civil_status', 't_cif.civil_status', '=', 't_cif_civil_status.id')
            ->leftJoin('t_cif_address_type', 't_cif.address_type', '=', 't_cif_address_type.id')
            ->where('t_cif.cid', $cid)
            ->where('t_cif.last_name', $last_name)
            ->first();
        if ($client) {
            return response()->json($client);
        } else {
            return response()->json(['error' => 'Client not found.'], 404);
        }
    }
    public function getClientLastCID_FILTERED_MBWIN()
    {
        $CID = MBWinClientInfoModel::max('CID');
        if (!$CID) {
            return response()->json(['error' => 'CID not found'], 404);
        }
        return response()->json($CID);
    }
    public function getClientACC_FILTERED_MBWIN()
    {
        $accountNumber = MBWinClientAccModel::max('ACC');
        $Chd = MBWinClientAccModel::max('Chd');
        if (!$accountNumber) {
            return response()->json(['error' => 'Account number not found'], 404);
        }
        if (!$Chd) {
            return response()->json(['error' => 'Check deposit not found'], 404);
        }
        return response()->json([
            'ACC' => $accountNumber,
            'Chd' => $Chd
        ]);
    }
    public function getClientInfo_FILTERED_MBWIN($cid)
    {
        $clientInfo = MBWinClientInfoModel::with('address', 'relation')->find($cid);
        if (!$clientInfo) {
            return response()->json(['error' => 'Client not found'], 404);
        }
        return response()->json($clientInfo);
    }
    public function getCID_MBWIN($cid)
    {
        try {
            $cid = MBWinClientInfoModel::where('CID', $cid)->first();
            return response()->json($cid);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getAcc_MBWIN(Request $request)
    {
        try {
            $search = $request->query('search');
            $acc = MBWinClientAccModel::where('ACC', $search)->get();
            return response()->json($acc);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getAcc_Chd_MBWIN(Request $request)
    {
        try {
            $acc = $request->query('acc');
            $chd = $request->query('chd');
            $account = MBWinClientAccModel::where('ACC', $acc)
                    ->where('Chd', $chd)
                    ->first();
            if ($account) {
                return response()->json($account);
            } else {
                return response()->json(['message' => 'Account not found!'], 404);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getSearch_CID_MBWIN(Request $request)
    {
        try {
            $search = $request->query('search');
            $cid = MBWinClientInfoModel::where('CID', $search)->get();
            return response()->json($cid);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getClientImage($folderName, $imageFileName)
    {
        $folderPath = 'client_files/' . $folderName . '/' . $imageFileName;
        if (!File::exists($folderPath)) {
            return response()->json(['message' => 'Image not found.'], 404);
        }
        $file = File::get($folderPath);
        $type = File::mimeType($folderPath);
        $response = Response::make($file, 200);
        $response->header("Content-Type", $type);
        return $response;
    }

    // public function updateClient(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'type' => 'required|string',
    //         'title' => 'required|string',
    //         'client_status' => 'required|string',
    //         'first_name' => 'required|string',
    //         'middle_name' => 'required|string',
    //         'last_name' => 'required|string',
    //         'suffix' => 'nullable|string',
    //         'initial' => 'nullable|string',
    //         'display_name' => 'required|string',
    //         'staff_or_not' => 'required|integer|in:0,1',
    //         'tin' => 'nullable|string',
    //         'gender' => 'required|string',
    //         'civil_status' => 'required|string',
    //         'birthdate' => 'required|string',
    //         'mobile1' => 'required|string',
    //         'mobile2' => 'nullable|string',
    //         'email' => 'required|string|email',
    //         'nationality' => 'required|string',
    //         'line1' => 'required|string',
    //         'line2' => 'required|string',
    //         'line3' => 'required|string',
    //         'line4' => 'nullable|string',
    //         'postal_code' => 'required|string',
    //         'address_type' => 'required|string',
    //         'telephone' => 'nullable|string',
    //         'fax' => 'nullable|string',
    //         'institution' => 'required|string',
    //         'entity' => 'required|string',
    //         'employment' => 'required|string',
    //         'image_file' => 'required|image|mimes:jpg,png,jpeg|max:2048',
    //         'tax_code' => 'nullable|string',
    //     ]);
    //     if ($validator->fails()) {
    //         return response()->json(['message' => $validator->errors()->first()], 422);
    //     }
    //     $filePath = null;
    //     if ($request->hasFile('image_file')) {
    //         $image = $request->file('image_file');
    //         $test = '';
    //         $filename = time() . '.' . $image->getClientOriginalExtension();
    //         $filePath = $image->storeAs($test, $filename);
    //     }
    //     $existingSqlsrvClient = MBWinClientInfoModel::where('Name1', $request->input('first_name'))
    //         ->where('Name2', $request->input('middle_name'))
    //         ->where('Name3', $request->input('last_name'))
    //         ->first();
    //     $existingMysqlClient = ClientInfoModel::where('first_name', $request->input('first_name'))
    //         ->where('middle_name', $request->input('middle_name'))
    //         ->where('last_name', $request->input('last_name'))
    //         ->first();
    //     if ($existingSqlsrvClient || $existingMysqlClient) {
    //         return response()->json(['message' => 'Client already exists.'], 409);
    //     }
    //     $typeId = $request->input('type');
    //     $titleId = $request->input('title');
    //     $client_statusId = $request->input('client_status');
    //     $suffixesId = $request->input('suffix');
    //     $genderId = $request->input('gender');
    //     $civil_statusId = $request->input('civil_status');
    //     $address_typeId = $request->input('address_type');
    //     $institutionId = $request->input('institution');
    //     $entityId = $request->input('entity');
    //     $employmentId = $request->input('employment');
    //     $type = TypesModel::where('id', $typeId)->first();
    //     $title = TitlesModel::where('id', $titleId)->first();
    //     $sufFix = SuffixesModel::where('id', $suffixesId)->first();
    //     $client_status = ClientStatusModel::where('id', $client_statusId)->first();
    //     $gender = GendersModel::where('id', $genderId)->first();
    //     $civil_status = CivilStatusModel::where('id', $civil_statusId)->first();
    //     $address_type = AddressTypeModel::where('id', $address_typeId)->first();
    //     $institution = InstitutionModel::where('id', $institutionId)->first();
    //     $entity = EntityModel::where('id', $entityId)->first();
    //     $employment = EmploymentModel::where('id', $employmentId)->first();
    //     $staff_or_not = $request->input('staff_or_not');
    //     if ($staff_or_not == 1) {
    //         $staff = 'T';
    //     }
    //     if ($staff_or_not == 2) {
    //         $staff = 'F';
    //     }
    //     if (!$type) {
    //         return response()->json(['message' => 'Invalid type value.'], 422);
    //     }
    //     if (!$title) {
    //         return response()->json(['message' => 'Invalid title value.'], 422);
    //     }
    //     if (!$client_status) {
    //         return response()->json(['message' => 'Invalid client status value.'], 422);
    //     }
    //     if (!$sufFix) {
    //         return response()->json(['message' => 'Invalid suffix value.'], 422);
    //     }
    //     if (!$gender) {
    //         return response()->json(['message' => 'Invalid gender value.'], 422);
    //     }
    //     if (!$civil_status) {
    //         return response()->json(['message' => 'Invalid civil status value.'], 422);
    //     }
    //     if (!$address_type) {
    //         return response()->json(['message' => 'Invalid address type value.'], 422);
    //     }
    //     if (!$institution) {
    //         return response()->json(['message' => 'Invalid institution value.'], 422);
    //     }
    //     if (!$entity) {
    //         return response()->json(['message' => 'Invalid entity value.'], 422);
    //     }
    //     if (!$employment) {
    //         return response()->json(['message' => 'Invalid employment value.'], 422);
    //     }

    //     date_default_timezone_set('Asia/Manila');
    //     $currentDate = date("Y-m-d");
    //     $customerData = $request->all();
    //     $customerData = [
    //         "messageId" => $request->input('message_id'),
    //         "token" => $request->input('token'),
    //         "br" => "000000",
    //         "cid" => "",
    //         "cidType" => $type->type_code, // Individual, Company, Group
    //         "title" => $title->title_code,
    //         "name1" => $request->input('last_name'),
    //         "name2" => $request->input('first_name'),
    //         "name3" => $request->input('middle_name'),
    //         "name4" => $sufFix->suffix,
    //         "displayName" => $request->input('display_name'),
    //         "initials" => $request->input('initial'),
    //         "mobile1" => $request->input('mobile1'),
    //         "mobile2" => $request->input('mobile2'),
    //         "email1" => $request->input('email'),
    //         "email2" => $request->input('nationality'), //MBWin bug
    //         "gender" => $gender->gender_code,
    //         "civilStatus" => $civil_status->civil_status_code,
    //         "dob" => $request->input('birthdate'),
    //         "langType" => "001",
    //         //"appType" => "1", //Put it to createAccount
    //         //"prType" => "51", //Put it to createAccount
    //         //"glCode" => "01", //Put it to createAccount
    //         //"ownershipType" => "010", //Put it to createAccount
    //         "staff" => $staff, // DosriTF in MBWin Database
    //         "taxCode" => "001",
    //         "address" => [
    //             [
    //                 "addressType" => $address_type->address_code,
    //                 "line1" => "Brgy. " . $request->input('line1'),
    //                 "line2" => $request->input('line2') . " City",
    //                 "line3" => $request->input('line3'),
    //                 "line4" => "Philippines",
    //                 "postalCode" => $request->input('postal_code'),
    //                 "phone1" => $request->input('telephone'),
    //                 "primary" => "T",
    //                 "mailing" => "T",
    //                 "tempMailing" => "F",
    //                 "startDate" => $currentDate // ?
    //             ]
    //         ],
    //         "ccCode1" => $institution->institution_id,
    //         "ccCode2" => $entity->entity_id,
    //         "ccCode3" => $employment->employment_id,
    //         "locationCode" => "OthrR00001",
    //     ];
    //     $apiUrl = "http://localhost:6500/datasnap/rest/client/createCustomer";
    //     $response = Http::withHeaders([
    //         'Content-Type' => $this->config['contentType'],
    //         'Authorization' => "Basic aWJjbGllbnQ6MTIzNA=="
    //     ])->update($apiUrl, $customerData);
    //     if ($response->successful()) {
    //         $responseData = $response->json();
    //         try {
    //             $newCID = $responseData['cid'];
    //             $newAddr_Recid = MBWinAddressModel::max('Addr_Recid');

    //             DB::transaction(function () use ($request, $newCID, $filePath) {
    //                 ClientInfoModel::update([
    //                     'cid' => $newCID,
    //                     'type' => $request->input('type'),
    //                     'title' => $request->input('title'),
    //                     'client_status' => $request->input('client_status'),
    //                     'first_name' => $request->input('first_name'),
    //                     'middle_name' => $request->input('middle_name'),
    //                     'last_name' => $request->input('last_name'),
    //                     'suffix' => $request->input('suffix'),
    //                     'initial' => $request->input('initial'),
    //                     'display_name' => $request->input('display_name'),
    //                     'staff_or_not' => $request->input('staff_or_not'),
    //                     'tin' => $request->input('tin'),
    //                     'gender' => $request->input('gender'),
    //                     'civil_status' => $request->input('civil_status'),
    //                     'birthdate' => $request->input('birthdate'),
    //                     'mobile1' => $request->input('mobile1'),
    //                     'mobile2' => $request->input('mobile2'),
    //                     'email' => $request->input('email'),
    //                     'nationality' => $request->input('nationality'),
    //                     'institution' => $request->input('institution'),
    //                     'entity' => $request->input('entity'),
    //                     'employment' => $request->input('employment'),
    //                     'tax_code' => "001",
    //                     'image_file' => $filePath,
    //                     'branch' => '000000',
    //                     'message_id' => $request->input('message_id'),
    //                     'token' => $request->input('token'),
    //                 ]);
    //             });
    //             DB::transaction(function () use ($request, $newCID, $newAddr_Recid) {
    //                 AddressModel::update([
    //                     'cid' => $newCID,
    //                     'address_type' => $request->input('address_type'),
    //                     'line1' => $request->input('line1'),
    //                     'line2' => $request->input('line2'),
    //                     'line3' => $request->input('line3'),
    //                     'line4' => "Philippines",
    //                     'postal_code' => $request->input('postal_code'),
    //                     'telephone' => $request->input('telephone'),
    //                     'fax' => $request->input('fax'),
    //                     'branch' => '000000',
    //                     'addr_recid' => $newAddr_Recid,
    //                     'message_id' => $request->input('message_id'),
    //                     'token' => $request->input('token'),
    //                 ]);
    //             });
    //             return response()->json([
    //                 'message' => 'Client has been updated successfully.',
    //                 'data' => $responseData
    //             ], 200);
    //         } catch (\Exception $e) {
    //             return response()->json([
    //                 'message' => 'Error: ' . $e->getMessage(),
    //                 'trace' => $e->getTraceAsString()
    //             ], 500);
    //         }
    //     } else {
    //         return response()->json(['message' => 'Failed to create customer', 'error' => $response->json()], $response->status());
    //     }
    // }
    // public function getMBWinClientInfo()
    // {
    //     try {
    //         $data = MBWinClientInfoModel::all();
    //         return response()->json($data);
    //     } catch (\Exception $e) {
    //         return response()->json(['error' => $e->getMessage()], 500);
    //     }
    // }
}
