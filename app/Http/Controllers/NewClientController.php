<?php

namespace App\Http\Controllers;

use App\Models\SqlsrvModel;
use App\Models\MysqlModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

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
            // 'image_file' => 'nullable|string',
            'cus_lang_pref' => 'required|string',
            'tax_code' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 422);
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

        if ($existingSqlsrvClient) {
            return response()->json(['message' => 'Client already exists.'], 409);
        }

        if ($existingMysqlClient) {
            return response()->json(['message' => 'Client already exists.'], 409);
        }

        $lastCid = MysqlModel::orderBy('cid', 'desc')->value('cid');
        if ($lastCid) {
            $numericPart = intval($lastCid) + 1;
            $newCid = str_pad($numericPart, 6, '0', STR_PAD_LEFT);
        } else {
            $newCid = '000001';
        }

        // Save Client to MySQL
        $newClient = new MysqlModel();
        $newClient->cid = $newCid;
        $newClient->type = $request->input('type');
        $newClient->title = $request->input('title');
        $newClient->client_status = $request->input('client_status');
        $newClient->first_name = $request->input('first_name');
        $newClient->middle_name = $request->input('middle_name');
        $newClient->last_name = $request->input('last_name');
        $newClient->initial = $request->input('initial');
        $newClient->display_name = $request->input('display_name');
        $newClient->staff_or_not = $request->input('staff_or_not');
        $newClient->tin = $request->input('tin');
        $newClient->gender = $request->input('gender');
        $newClient->civil_status = $request->input('civil_status');
        $newClient->birthdate = $request->input('birthdate');
        $newClient->mobile1 = $request->input('mobile1');
        $newClient->mobile2 = $request->input('mobile2');
        $newClient->email = $request->input('email');
        $newClient->nationality = $request->input('nationality');
        $newClient->address_line1 = $request->input('address_line1');
        $newClient->address_line2 = $request->input('address_line2');
        $newClient->address_line3 = $request->input('address_line3');
        $newClient->address_line4 = $request->input('address_line4');
        $newClient->postal_code = $request->input('postal_code');
        $newClient->address_type = $request->input('address_type');
        $newClient->telephone = $request->input('telephone');
        $newClient->fax = $request->input('fax');
        $newClient->undef = $request->input('undef');
        $newClient->entity = $request->input('entity');
        $newClient->employment = $request->input('employment');
        $newClient->image_file = $request->input('image_file');
        $newClient->cus_lang_pref = $request->input('cus_lang_pref');
        $newClient->tax_code = $request->input('tax_code');
        $newClient->save();

        return response()->json(['message' => 'Client has been saved successfully.'], 200);
    }
}
