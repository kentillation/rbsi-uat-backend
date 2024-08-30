<?php

namespace App\Http\Controllers;
use App\Models\GendersModel;

class GendersController extends Controller
{
    public function getGenders()
    {
        try {
            $data = GendersModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
