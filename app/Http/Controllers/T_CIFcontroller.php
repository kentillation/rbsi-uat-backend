<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\T_CIFmodel;

class T_CIFcontroller extends Controller
{
    public function getT_CIF()
    {
        try {
            $data = T_CIFmodel::select('T_CIF.*', 'T_ADDRESS.Line1', 'T_ADDRESS.Line2', 'T_ADDRESS.Line3')
            ->join('T_ADDRESS', 'T_CIF.Cid', '=', 'T_ADDRESS.Cid')
            ->orderBy('T_CIF.Cid')
            ->get();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
