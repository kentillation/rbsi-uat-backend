<?php

namespace App\Http\Controllers;

use App\Models\SqlsrvModel;
use App\Models\MysqlModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class NewClientController extends Controller
{
    public function add_new_client(Request $request)
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
            $destinationPath = 'uploads/images';
            $filename = time() . '.' . $image->getClientOriginalExtension();
            $filePath = $image->storeAs($destinationPath, $filename);
        }

        // Check if user exists in SQL Server
        $existingSqlsrvClient = SqlsrvModel::where('Name1', $request->input('first_name'))
            ->where('Name2', $request->input('middle_name'))
            ->where('Name3', $request->input('last_name'))
            ->first();

        // Check if Client exists in MySQL
        $existingMysqlClient = MysqlModel::where('first_name', $request->input('first_name'))
            ->where('middle_name', $request->input('middle_name'))
            ->where('last_name', $request->input('last_name'))
            ->first();

        if ($existingSqlsrvClient || $existingMysqlClient) {
            return response()->json(['message' => 'Client already exists.'], 409);
        }

        $newCid = MysqlModel::max('cid') ? str_pad(intval(MysqlModel::max('cid')) + 1, 6, '0', STR_PAD_LEFT) : '000001';

        // Save new client securely
        DB::transaction(function () use ($request, $filePath, $newCid) {
            MysqlModel::create([
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
}