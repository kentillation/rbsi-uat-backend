<?php

namespace App\Http\Controllers;
use App\Models\TypesModel;
// use Illuminate\Support\Facades\Log;

use Illuminate\Http\Request;

class TypesController extends Controller
{
    public function getTypes(Request $request)
    {
        // Log::info('Authenticated User:', ['user' => $request->user()]);
        try {
            $data = TypesModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
