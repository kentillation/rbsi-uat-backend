<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SqlsrvModel;

class T_CIFcontroller extends Controller
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
}
