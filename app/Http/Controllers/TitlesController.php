<?php

namespace App\Http\Controllers;
use App\Models\TitlesModel;

class TitlesController extends Controller
{
    public function getTitles()
    {
        try {
            $data = TitlesModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
