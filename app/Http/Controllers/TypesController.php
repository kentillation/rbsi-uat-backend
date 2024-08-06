<?php

namespace App\Http\Controllers;
use App\Models\TypesModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class TypesController extends Controller
{
    public function getTypes(Request $request)
    {
        try {
            Log::info('getTypes called'); // Debug: Log that the method is called
            Log::info('Authenticated User:', ['user' => $request->user()]);
            $data = TypesModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
