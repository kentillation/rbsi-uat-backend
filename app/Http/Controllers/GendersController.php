<?php

namespace App\Http\Controllers;
use App\Models\GendersModel;
use Illuminate\Http\Request;

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
