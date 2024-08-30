<?php

namespace App\Http\Controllers;
use App\Models\TaxCodeModel;

class TaxCodeController extends Controller
{
    public function getTaxCode()
    {
        try {
            $data = TaxCodeModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
