<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CheckSQLServerConnectionController extends Controller
{
    public function checkConnection()
    {
        try {
            // Attempt to connect and fetch a test query
            DB::connection('sqlsrv')->getPdo();
            
            return response()->json([
                'success' => true,
                'message' => 'Connected successfully to SQL Server'
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Connection failed',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
