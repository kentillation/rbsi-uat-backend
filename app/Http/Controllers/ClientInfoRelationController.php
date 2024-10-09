<?php

namespace App\Http\Controllers;
use App\Models\TypesModel;
use App\Models\TitlesModel;
use App\Models\ClientStatusModel;
use App\Models\GendersModel;
use App\Models\CivilStatusModel;
use App\Models\InstitutionModel;
use App\Models\EntityModel;
use App\Models\EmploymentModel;
use App\Models\AddressTypeModel;
use App\Models\TaxCodeModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class ClientInfoRelationController extends Controller
{
    //
    public function getTypes()
    {
        try {
            $data = DB::table('t_cif_types')
                ->select('t_cif_types.id', 't_cif_types.type_code', 't_cif_types.type')
                ->get();

            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function getTitles()
    {
        try {
            $data = TitlesModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getClientStatus()
    {
        try {
            $data = ClientStatusModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getGenders()
    {
        try {
            $data = GendersModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getCivilStatus()
    {
        try {
            $data = CivilStatusModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getInstitution()
    {
        try {
            $data = InstitutionModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getEntity()
    {
        try {
            $data = EntityModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getEmployment()
    {
        try {
            $data = EmploymentModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getAddressType()
    {
        try {
            $data = AddressTypeModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getTaxCode()
    {
        try {
            $data = TaxCodeModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
