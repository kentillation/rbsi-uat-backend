<?php

namespace App\Http\Controllers;
use App\Models\EmploymentModel;
use Illuminate\Http\Request;

class EmploymentController extends Controller
{
    public function getEmployment()
    {
        try {
            $data = EmploymentModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
