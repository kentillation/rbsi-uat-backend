<?php

namespace App\Http\Controllers;
use App\Models\TitlesModel;
// use Illuminate\Support\Facades\Log;

use Illuminate\Http\Request;

class TitlesController extends Controller
{
    public function getTitles(Request $request)
    {
        // Log::info('Authenticated User:', ['user' => $request->user()]);
        try {
            $data = TitlesModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
