<?php

namespace App\Http\Controllers;

use App\Models\SqlsrvModel;
use App\Models\MysqlModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name1' => 'required|string|max:255',
            'name2' => 'required|string|max:255',
            'name3' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 422);
        }

        // Check if user exists in SQL Server
        $existingSqlsrvUser = SqlsrvModel::where('Name1', $request->input('name1'))
            ->where('Name2', $request->input('name2'))
            ->where('Name3', $request->input('name3'))
            ->first();

        // Check if user exists in MySQL
        $existingMysqlUser = MysqlModel::where('name1', $request->input('name1'))
            ->where('name2', $request->input('name2'))
            ->where('name3', $request->input('name3'))
            ->first();

        if ($existingSqlsrvUser || $existingMysqlUser) {
            return response()->json(['message' => 'User already exists.'], 409);
        }

        // Save user to MySQL
        $newUser = new MysqlModel();
        $newUser->name1 = $request->input('name1');
        $newUser->name2 = $request->input('name2');
        $newUser->name3 = $request->input('name3');
        $newUser->save();

        return response()->json(['message' => 'User has been saved successfully.'], 200);
    }
}
