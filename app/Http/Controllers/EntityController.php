<?php

namespace App\Http\Controllers;
use App\Models\EntityModel;
use Illuminate\Http\Request;

class EntityController extends Controller
{
    public function getEntity()
    {
        try {
            $data = EntityModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
