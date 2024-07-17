<?php

namespace App\Http\Controllers;
use App\Models\T_ADDRESSmodel;

use Illuminate\Http\Request;

class T_ADDRESScontroller extends Controller
{
    public function getT_ADDRESS()
    {
        try {
            $data = T_ADDRESSmodel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
