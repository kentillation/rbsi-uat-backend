<?php

namespace App\Http\Controllers;

use App\Models\ClientInfoModel;
use App\Models\SqlsrvModel;
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
            $data = SqlsrvModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function checkMBWinClientInfo(Request $request)
    {
        try {
            $exists = SqlsrvModel::where('Name2', $request->input('first_name'))
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

        // Handle file upload securely
        $filePath = null;
        if ($request->hasFile('image_file')) {
            $image = $request->file('image_file');
            $test = '';
            $filename = time() . '.' . $image->getClientOriginalExtension();
            $filePath = $image->storeAs($test, $filename);
        }

        // Check if user exists in SQL Server
        $existingSqlsrvClient = SqlsrvModel::where('Name1', $request->input('first_name'))
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

        // Save new client securely
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

        return response()->json(['message' => 'Client has been saved successfully.'], 200);
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

        // // Check if user exists in SQL Server
        $existingSqlsrvClient = SqlsrvModel::where('Name1', $request->input('first_name'))
            ->where('Name2', $request->input('middle_name'))
            ->where('Name3', $request->input('last_name'))
            ->first();

        // // Check if Client exists in MySQL
        $existingMysqlClient = ClientInfoModel::where('first_name', $request->input('first_name'))
            ->where('middle_name', $request->input('middle_name'))
            ->where('last_name', $request->input('last_name'))
            ->first();

        if ($existingSqlsrvClient || $existingMysqlClient) {
            return response()->json(['message' => 'Client already exists.'], 409);
        }

        // Find existing client
        $client = ClientInfoModel::where('cid', $cid)->first();
        if (!$client) {
            return response()->json(['message' => 'Client not found.'], 404);
        }

        // Handle file upload securely
        $filePath = $client->image_file;
        if ($request->hasFile('image_file')) {
            $image = $request->file('image_file');
            $test = '';
            $filename = time() . '.' . $image->getClientOriginalExtension();
            $filePath = $image->storeAs($test, $filename);
        }

        // Update client details
        DB::transaction(function () use ($request, $filePath, $client) {
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
                'image_file' => $filePath,
                'cus_lang_pref' => $request->input('cus_lang_pref'),
                'tax_code' => $request->input('tax_code'),
            ]);
        });
        return response()->json(['message' => 'Client has been updated successfully.'], 200);
    }
}
