<?php

namespace App\Http\Controllers;
use App\Models\WatchListModel;
use Illuminate\Http\Request;

class WatchListController extends Controller
{
    public function watchList(Request $request)
    {
        try {
            $exists = WatchListModel::where('first_name', $request->input('first_name'))
                ->where('middle_name', $request->input('middle_name'))
                ->where('last_name', $request->input('last_name'))
                ->exists();
            return response()->json(['exists' => $exists]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
