<?php

namespace App\Http\Controllers;
use App\Models\ClientStatusModel;

class ClientStatusController extends Controller
{
    public function getClientStatus()
    {
        try {
            $data = ClientStatusModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
