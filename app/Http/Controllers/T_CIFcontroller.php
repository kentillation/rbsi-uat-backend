<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\T_CIFmodel;

class T_CIFcontroller extends Controller
{
    public function getT_CIF()
    {
        try {
            $data = T_CIFmodel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
