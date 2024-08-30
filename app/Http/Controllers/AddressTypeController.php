<?php

namespace App\Http\Controllers;
use App\Models\AddressTypeModel;

class AddressTypeController extends Controller
{
    public function getAddressType()
    {
        try {
            $data = AddressTypeModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
