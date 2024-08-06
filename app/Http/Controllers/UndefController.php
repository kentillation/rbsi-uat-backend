<?php

namespace App\Http\Controllers;
use App\Models\UndefModel;
use Illuminate\Http\Request;

class UndefController extends Controller
{
    public function getUndef()
    {
        try {
            $data = UndefModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
