<?php

namespace App\Http\Controllers;

use App\Models\MBWinLocationCodeModel;
use App\Models\LocationCodeModel;
use Illuminate\Support\Facades\DB;

class MBWinLocationCodeController extends Controller
{
    public function getMBWinLocationCode()
    {
        try {
            $data = MBWinLocationCodeModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function cloneLocationCode()
    {
        try {
            $data = MBWinLocationCodeModel::all();
            DB::transaction(function () use ($data) {
                foreach ($data as $record) {
                    LocationCodeModel::create([
                        'level_number' => $record->levelNo,
                        'location_code' => $record->LocationCode,
                        'short_desc' => $record->ShortDesc,
                        'full_desc' => $record->FullDesc,
                        'branch' => '000000',
                    ]);
                }
            });
            return response()->json(['message' => 'Data has been cloned successfully.'], 200);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Error: ' . $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ], 500);
        }
    }
}
