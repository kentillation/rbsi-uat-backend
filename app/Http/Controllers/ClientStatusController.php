<?php

namespace App\Http\Controllers;
use App\Models\ClientStatusModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class ClientStatusController extends Controller
{
    public function getClientStatus(Request $request)
    {
        Log::info('Authenticated User:', ['user' => $request->user()]);
        try {
            $data = ClientStatusModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
