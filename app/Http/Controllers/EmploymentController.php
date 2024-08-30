<?php

namespace App\Http\Controllers;
use App\Models\EmploymentModel;

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
