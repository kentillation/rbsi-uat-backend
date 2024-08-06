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
            'first_name' => 'required|string|max:255',
            'middle_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'type' => 'required|integer|max:12',
            'display_name' => 'required|string|max:255',
            'initial' => 'required|string|max:255',
            'title' => 'required|integer|max:12',
            'customer_status' => 'required|integer|max:12',
            'gender' => 'required|integer|max:12',
            'civil_status' => 'required|integer|max:12',
            'mobile1' => 'required|string|max:255',
            'mobile2' => 'required|string|max:255',
            'email' => 'required|string|max:255',
            'birthdate' => 'required|date',
            'cus_lang_pref' => 'required|string|max:255',
            'cus_tax_code' => 'required|integer|max:12',
            'image_file' => 'required|string',
            'address_type' => 'required|integer|max:12',
            'staff_or_not' => 'required|integer|max:12',
            'tin' => 'required|string|max:255',
            'nationality' => 'required|string|max:255',
            'un_defined' => 'required|integer|max:12',
            'entity' => 'required|integer|max:12',
            'employment' => 'required|integer|max:12',
            'address_line1' => 'required|string',
            'address_line2' => 'required|string',
            'address_line3' => 'required|string',
            'address_line4' => 'required|string',
            'telephone' => 'required|string|max:255',
            'fax' => 'required|string|max:255',
            'postal_code' => 'required|string|max:255',
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

        // Save Client to MySQL
        $newClient = new MysqlModel();
        $newClient->first_name = $request->input('first_name');
        $newClient->middle_name = $request->input('middle_name');
        $newClient->last_name = $request->input('last_name');
        $newClient->type = $request->input('type');
        $newClient->display_name = $request->input('display_name');
        $newClient->initial = $request->input('initial');
        $newClient->title = $request->input('title');
        $newClient->customer_status = $request->input('customer_status');
        $newClient->gender = $request->input('gender');
        $newClient->civil_status = $request->input('civil_status');
        $newClient->mobile1 = $request->input('mobile1');
        $newClient->mobile2 = $request->input('mobile2');
        $newClient->email = $request->input('email');
        $newClient->birthdate = $request->input('birthdate');
        $newClient->cus_lang_pref = $request->input('cus_lang_pref');
        $newClient->cus_tax_code = $request->input('cus_tax_code');
        $newClient->image_file = $request->input('image_file');
        $newClient->address_type = $request->input('address_type');
        $newClient->staff_or_not = $request->input('staff_or_not');
        $newClient->tin = $request->input('tin');
        $newClient->nationality = $request->input('nationality');
        $newClient->un_defined = $request->input('un_defined');
        $newClient->entity = $request->input('entity');
        $newClient->employment = $request->input('employment');
        $newClient->address_line1 = $request->input('address_line1');
        $newClient->address_line2 = $request->input('address_line2');
        $newClient->address_line3 = $request->input('address_line3');
        $newClient->address_line4 = $request->input('address_line4');
        $newClient->telephone = $request->input('telephone');
        $newClient->fax = $request->input('fax');
        $newClient->postal_code = $request->input('postal_code');
        $newClient->save();

        return response()->json(['message' => 'Client has been saved successfully.'], 200);
    }
}
