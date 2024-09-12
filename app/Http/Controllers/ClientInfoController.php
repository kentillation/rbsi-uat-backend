<?php

namespace App\Http\Controllers;

use App\Models\ClientInfoModel;
use App\Models\MBWinClientInfoModel;
use App\Models\MBWinAddressModel;
use App\Models\TypesModel;
use App\Models\TitlesModel;
use App\Models\ClientStatusModel;
use App\Models\GendersModel;
use App\Models\CivilStatusModel;
use App\Models\InstitutionModel;
use App\Models\EntityModel;
use App\Models\EmploymentModel;
use App\Models\TaxCodeModel;
use App\Models\AddressTypeModel;
use App\Models\AddressModel;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class ClientInfoController extends Controller
{

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
        $client = ClientInfoModel::select('t_cif.*')
            ->where('cid', $cid)
            ->where('last_name', $last_name)
            ->first();
        if ($client) {
            return response()->json($client);
        } else {
            return response()->json(['error' => 'OMG! Client not found.'], 404);
        }
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
            'type' => 'required|integer',
            'title' => 'required|integer',
            'client_status' => 'required|integer',
            'first_name' => 'required|string',
            'middle_name' => 'required|string',
            'last_name' => 'required|string',
            'initial' => 'nullable|string',
            'display_name' => 'required|string',
            'staff_or_not' => 'required|integer|in:0,1',
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
            'institution' => 'required|integer',
            'entity' => 'required|integer',
            'employment' => 'required|integer',
            'image_file' => 'required|image|mimes:jpg,png,jpeg|max:2048',
            'tax_code' => 'required|integer',
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
        $addresstypeId = $request->input('address_type');
        $institutionId = $request->input('institution');
        $entityId = $request->input('entity');
        $employmentId = $request->input('employment');
        $tax_codeId = $request->input('tax_code');

        $type = TypesModel::where('id', $typeId)->first();
        $title = TitlesModel::where('id', $titleId)->first();
        $client_status = ClientStatusModel::where('id', $client_statusId)->first();
        $gender = GendersModel::where('id', $genderId)->first();
        $civil_status = CivilStatusModel::where('id', $civil_statusId)->first();
        $address_type = AddressTypeModel::where('id', $addresstypeId)->first();
        $institution = InstitutionModel::where('id', $institutionId)->first();
        $entity = EntityModel::where('id', $entityId)->first();
        $employment = EmploymentModel::where('id', $employmentId)->first();
        $tax_code = TaxCodeModel::where('id', $tax_codeId)->first();
        if (!$type) {
            return response()->json(['message' => 'Invalid type value.'], 422);
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
        $newCid1 = MBWinClientInfoModel::max('CID') ? str_pad(intval(MBWinClientInfoModel::max('CID')) + 1, 6, '0', STR_PAD_LEFT) : '000295';

        try {
            // DB::transaction(function () use ($request, $filePath, $newCid, $type, $title, $client_status, $gender, $civil_status, $institution, $entity, $employment, $tax_code, $hash) {
            //     ClientInfoModel::create([
            //         'cid' => $newCid,
            //         'type' => $type->type_code,
            //         'title' => $title->title_code,
            //         'client_status' => $client_status->client_status_code,
            //         'first_name' => $request->input('first_name'),
            //         'middle_name' => $request->input('middle_name'),
            //         'last_name' => $request->input('last_name'),
            //         'initial' => $request->input('initial'),
            //         'display_name' => $request->input('display_name'),
            //         'staff_or_not' => $request->input('staff_or_not'),
            //         'tin' => $request->input('tin'),
            //         'gender' => $gender->gender_code,
            //         'civil_status' => $civil_status->civil_status_code,
            //         'birthdate' => $request->input('birthdate'),
            //         'mobile1' => $request->input('mobile1'),
            //         'mobile2' => $request->input('mobile2'),
            //         'email' => $request->input('email'),
            //         'nationality' => $request->input('nationality'),
            //         'institution' => $institution->institution_id,
            //         'entity' => $entity->entity_id,
            //         'employment' => $employment->employment_id,
            //         'tax_code' => $tax_code->taxx_code,
            //         'image_file' => $filePath,
            //         'branch' => '000000',
            //     ]);
            // });

            // DB::transaction(function () use ($request, $newCid, $address_type) {
            //     AddressModel::create([
            //         'cid' => $newCid,
            //         'address_type' => $address_type->address_code,
            //         'line1' => $request->input('address_line1'),
            //         'line2' => $request->input('address_line2'),
            //         'line3' => $request->input('address_line3'),
            //         'line4' => $request->input('address_line4'),
            //         'postal_code' => $request->input('postal_code'),
            //         'telephone' => $request->input('telephone'),
            //         'fax' => $request->input('fax'),
            //         'hash' => $hash,
            //         'branch' => '000000',
            //     ]);
            // });

            DB::transaction(function () use ($request, $newCid1, $type, $title, $client_status, $gender, $civil_status, $institution, $entity, $employment, $tax_code, $hash) {
                MBWinClientInfoModel::create([
                    'CID' => $newCid1, // 6 chars
                    'AccSerial' => '0000000000', // 10 chars
                    'Type' => $type->type_code, // 3 chars
                    'Nid' => null, // 24 chars
                    'Name1' => $request->input('last_name'), // 24 chars
                    'Name2' => $request->input('first_name'), // 24 chars
                    'Name3' => $request->input('middle_name'), // 24 chars
                    'Name4' => null, // 24 chars
                    'TitleCode' => $title->title_code, // 3 chars
                    'Initials' => $request->input('initial'), // 6 chars
                    'GenderType' => $gender->gender_code, // 3 chars
                    'BirthDate' => $request->input('birthdate') . ' 00:00:00.000',
                    'RegNumber' => null, // 24 chars
                    'ContactPerson' => null, // 24 chars
                    'Mobile1' => $request->input('mobile1'), // 15 chars
                    'Mobile2' => $request->input('mobile2'), // 15 chars
                    'Email1' => $request->input('email'), //  40 chars
                    'Email2' => null, //  40 chars
                    'RegisterDate' => now(), // Date and time
                    'CIFCode1' => $institution->institution_id, // 10 chars
                    'CIFCode2' => $entity->entity_id, // 10 chars
                    'CIFCode3' => $employment->employment_id, // 10 chars
                    'CIFCode4' => null, // 10 chars
                    'CIFCode5' => null, // 10 chars
                    'CIFCode6' => null, // 10 chars
                    'CIFCode7' => null, // 10 chars
                    'CIFCode8' => null, // 10 chars
                    'CIFCode9' => null, // 10 chars
                    'TaxCode' => $tax_code->taxx_code, // 3 chars
                    'LnHist' => '0', // (8, 0)
                    'LnMaxAmt' => null, // (8, 0)
                    'LastChangeDate' => now(), // Date and time
                    'CivilStatusCode' => $civil_status->civil_status_code, // 3 chars
                    'DosriTF' => 'F', // 1 chars
                    'DisplayName' => $request->input('display_name'), // 24 chars
                    'LangType' => '001', // 3 chars
                    'StatusType' => $client_status->client_status_code, // 3 chars
                    'HASH' => $hash, // 10 chars
                    'LocationCode' => $request->input('postal_code'), // 11 chars
                    'NextCmDate' => null, // Date and time
                    'cmFreqType' => null, // 3 chars
                    'BR' => '000000', // 6 chars
                ]);
            });

            DB::transaction(function () use ($request, $newCid1, $address_type, $hash) {
                MBWinAddressModel::create([
                    'Cid' => $newCid1,
                    'AddressType' => $address_type->address_code,
                    'Line1' => $request->input('address_line1'),
                    'Line2' => $request->input('address_line2'),
                    'Line3' => $request->input('address_line3'),
                    'Line4' => $request->input('address_line4'),
                    'PostalCode' => $request->input('postal_code'),
                    'Phone1' => $request->input('telephone'),
                    'Phone2' => null,
                    'Phone3' => null,
                    'Fax1' => $request->input('fax'),
                    'Fax2' => null,
                    'PrimaryTF' => 'T',
                    'MailingTF' => 'F',
                    'TempMailTF' => 'F',
                    'StartDate' => null,
                    'EndDate' => null,
                    'MailCode' => null,
                    'HASH' => $hash,
                    'BR' => '000000'
                ]);
            });

            return response()->json(['message' => 'Client has been saved successfully.'], 200);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Error: ' . $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ], 500);
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
