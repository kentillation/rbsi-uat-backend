<?php

namespace App\Http\Controllers;
use App\Models\CivilStatusModel;
use Illuminate\Http\Request;

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
