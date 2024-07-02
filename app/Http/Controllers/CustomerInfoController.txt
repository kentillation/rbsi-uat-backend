<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CustomerInfoModel;

class CustomerInfoController extends Controller
{
    public function getCustomerInfo()
    {
        try {
            $data = CustomerInfoModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
