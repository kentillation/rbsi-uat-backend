<?php

namespace App\Http\Controllers;
use App\Models\ClientInfoModel;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;
class ClientInfoController extends Controller
{
    public function getClientInfo()
    {
        try {
            $data = ClientInfoModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getClientImage($filename)
    {
        $path = storage_path('app/' . $filename);

        if (!File::exists($path)) {
            return response()->json(['message' => 'Image not found.'], 404);
        }

        $file = File::get($path);
        $type = File::mimeType($path);

        $response = Response::make($file, 200);
        $response->header("Content-Type", $type);

        return $response;
    }
}
