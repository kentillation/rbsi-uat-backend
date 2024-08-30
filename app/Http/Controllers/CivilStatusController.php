<?php

namespace App\Http\Controllers;
use App\Models\CivilStatusModel;

class CivilStatusController extends Controller
{
    public function getCivilStatus()
    {
        try {
            $data = CivilStatusModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
