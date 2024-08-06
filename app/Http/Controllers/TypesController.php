<?php

namespace App\Http\Controllers;
use App\Models\TypesModel;

class TypesController extends Controller
{
    public function getTypes()
    {
        try {
            $data = TypesModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
