<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ClientInfoModel;

class ClientInfoController extends Controller
{
    public function getClientInfo()
    {
        try {
            $data = ClientInfoModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
