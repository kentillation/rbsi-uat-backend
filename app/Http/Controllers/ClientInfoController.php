<?php

namespace App\Http\Controllers;

use App\Models\ClientInfoModel;
use App\Models\MBWinClientInfoModel;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class ClientInfoController extends Controller
{

    public function getMBWinClientInfo(Request $request)
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
            'undef' => 'required|integer',
            'entity' => 'required|integer',
            'employment' => 'required|integer',
            'image_file' => 'required|image|mimes:jpg,png,jpeg|max:2048',
            'cus_lang_pref' => 'required|string',
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

        // Check if Client exists in SEQL Server
        $existingSqlsrvClient = MBWinClientInfoModel::where('Name1', $request->input('first_name'))
            ->where('Name2', $request->input('middle_name'))
            ->where('Name3', $request->input('last_name'))
            ->first();

        // Check if Client exists in MySQL
        $existingMysqlClient = ClientInfoModel::where('first_name', $request->input('first_name'))
            ->where('middle_name', $request->input('middle_name'))
            ->where('last_name', $request->input('last_name'))
            ->first();

        if ($existingSqlsrvClient || $existingMysqlClient) {
            return response()->json(['message' => 'Client already exists.'], 409);
        }

        $newCid = ClientInfoModel::max('cid') ? str_pad(intval(ClientInfoModel::max('cid')) + 1, 6, '0', STR_PAD_LEFT) : '000001';
        $newCid1 = MBWinClientInfoModel::max('CID') ? str_pad(intval(MBWinClientInfoModel::max('CID')) + 1, 6, '0', STR_PAD_LEFT) : '000001';

        try {
            DB::transaction(function () use ($request, $filePath, $newCid) {
                ClientInfoModel::create([
                    'cid' => $newCid,
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
                    'undef' => $request->input('undef'),
                    'entity' => $request->input('entity'),
                    'employment' => $request->input('employment'),
                    'image_file' => $filePath,
                    'cus_lang_pref' => $request->input('cus_lang_pref'),
                    'tax_code' => $request->input('tax_code'),
                ]);
            });

            // DB::transaction(function () use ($request, $newCid1) {
            //     $client_status = $request->input('client_status');
            //     if ($client_status == 1) {
            //         $client_status = '000';
            //     }
            //     if ($client_status == 2) {
            //         $client_status = '9RE';
            //     }

            //     $civil_status = $request->input('civil_status');
            //     if ($civil_status == 1) {
            //         $civil_status = 'D00';
            //     }
            //     if ($civil_status == 2) {
            //         $civil_status = 'M00';
            //     }
            //     if ($civil_status == 3) {
            //         $civil_status = 'S00';
            //     }
            //     if ($civil_status == 4) {
            //         $civil_status = 'W00';
            //     }

            //     function generateHash($length = 10) {
            //         $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
            //         $charactersLength = strlen($characters);
            //         $randomString = '';
            //         for ($i = 0; $i < $length; $i++) {
            //             $randomString .= $characters[random_int(0, $charactersLength - 1)];
            //         }
            //         return $randomString;
            //     }

            //     MBWinClientInfoModel::create([
            //         'CID' => $newCid1, // 6 chars
            //         'AccSerial' => '0000000000', // 10 chars
            //         'Type' => '00' . $request->input('type'), // 3 chars
            //         'Nid' => null, // 24 chars
            //         'Name1' => $request->input('last_name'), // 24 chars
            //         'Name2' => $request->input('first_name'), // 24 chars
            //         'Name3' => $request->input('middle_name'), // 24 chars
            //         'Name4' => null, // 24 chars
            //         'TitleCode' => '00' . $request->input('title'), // 3 chars
            //         'Initials' => $request->input('initial'), // 6 chars
            //         'GenderType' => '00' . $request->input('gender'), // 3 chars
            //         'BirthDate' => $request->input('birthdate') . ' 00:00:00.000',
            //         'RegNumber' => null, // 24 chars
            //         'ContactPerson' => null, // 24 chars
            //         'Mobile1' => $request->input('mobile1'), // 15 chars
            //         'Mobile2' => $request->input('mobile2'), // 15 chars
            //         'Email1' => $request->input('email'), //  40 chars
            //         'Email2' => null, //  40 chars
            //         'RegisterDate' => now(), // Date and time
            //         'CIFCode1' => null, // 10 chars
            //         'CIFCode2' => null, // 10 chars
            //         'CIFCode3' => null, // 10 chars
            //         'CIFCode4' => null, // 10 chars
            //         'CIFCode5' => null, // 10 chars
            //         'CIFCode6' => null, // 10 chars
            //         'CIFCode7' => null, // 10 chars
            //         'CIFCode8' => null, // 10 chars
            //         'CIFCode9' => null, // 10 chars
            //         'TaxCode' => '00' . $request->input('tax_code'), // 3 chars
            //         'LnHist' => '0', // (8, 0)
            //         'LnMaxAmt' => null, // (8, 0)
            //         'LastChangeDate' => now(), // Date and time
            //         'CivilStatusCode' => $civil_status, // 3 chars
            //         'DosriTF' => 'F', // 1 chars
            //         'DisplayName' => $request->input('display_name'), // 24 chars
            //         'LangType' => '001', // 3 chars
            //         'StatusType' => $client_status, // 3 chars
            //         'HASH' => generateHash(10), // 10 chars
            //         'LocationCode' => $request->input('postal_code'), // 11 chars
            //         'NextCmDate' => null, // Date and time
            //         'cmFreqType' => null, // 3 chars
            //         'BR' => '000000', // 6 chars
            //     ]);
            // });
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
            'undef' => 'required|integer',
            'entity' => 'required|integer',
            'employment' => 'required|integer',
            'cus_lang_pref' => 'required|string',
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
                'undef' => $request->input('undef'),
                'entity' => $request->input('entity'),
                'employment' => $request->input('employment'),
                'cus_lang_pref' => $request->input('cus_lang_pref'),
                'tax_code' => $request->input('tax_code'),
            ]);
        });
        return response()->json(['message' => 'Client has been updated successfully.'], 200);
    }
}
