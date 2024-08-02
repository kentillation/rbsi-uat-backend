<?php

namespace App\Http\Controllers;
use App\Models\CustomerStatusModel;
use Illuminate\Http\Request;
// use Illuminate\Support\Facades\Log;

class CustomerStatusController extends Controller
{
    public function getCustomerStatus(Request $request)
    {
        // Log::info('Authenticated User:', ['user' => $request->user()]);
        try {
            $data = CustomerStatusModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
