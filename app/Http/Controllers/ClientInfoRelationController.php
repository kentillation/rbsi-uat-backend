<?php

namespace App\Http\Controllers;
use App\Models\SuffixesModel;
use App\Models\AppTypeModel;
use App\Models\TypesModel;
use App\Models\TitlesModel;
use App\Models\GendersModel;
use App\Models\CivilStatusModel;
use App\Models\InstitutionModel;
use App\Models\EntityModel;
use App\Models\EmploymentModel;
use App\Models\AddressTypeModel;
use App\Models\RelationshipModel;
use App\Models\ProductTypeModel;
use App\Models\OwnershipTypeModel;
use phpseclib3\Crypt\AES;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class ClientInfoRelationController extends Controller
{
    private function getSessionKey(string $sessionId)
    {
        $key = Cache::get('session_key_' . $sessionId);
        if (!$key) {
            \Log::warning("Session key not found for ID: $sessionId");
            return null;
        }
        \Log::info("Attempting to retrieve key for session: $sessionId");
        \Log::info("Session key size: " . strlen($key) . " bytes");
        \Log::info("Retrieved session key size: " . strlen($key) . " bytes");
        return $key;
    }

    public function getSuffixes()
    {
        try {
            // $sessionId = $request->header('X-Session-ID');
            // $sessionKey = $this->getSessionKey($sessionId);
            // if (!$sessionKey) {
            //     return response()->json(['message' => 'Invalid session. Refresh the page and try again!'], 401);
            // }
            $data = SuffixesModel::all();
            // $iv = random_bytes(16); // Encrypt the response
            // $aes = new AES('cbc');
            // $aes->setKey($sessionKey);
            // $aes->setIV($iv);
            // $encryptedData = $aes->encrypt(json_encode($data));
            // $encryptedResponse = base64_encode($iv . $encryptedData);
            return response()->json($data);

        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getTypes()
    {
        try {
            // $sessionId = $request->header('X-Session-ID');
            // $sessionKey = $this->getSessionKey($sessionId);
            // if (!$sessionKey) {
            //     return response()->json(['message' => 'Invalid session. Refresh the page and try again!'], 401);
            // }
            $data = TypesModel::all();
            // $iv = random_bytes(16); // Encrypt the response
            // $aes = new AES('cbc');
            // $aes->setKey($sessionKey);
            // $aes->setIV($iv);
            // $encryptedData = $aes->encrypt(json_encode($data));
            // $encryptedResponse = base64_encode($iv . $encryptedData);
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
    public function getRelationship()
    {
        try {
            $data = RelationshipModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getAppTypes()
    {
        try {
            $data = AppTypeModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getProductTypes()
    {
        try {
            $data = ProductTypeModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getOwnershipTypes()
    {
        try {
            $data = OwnershipTypeModel::all();
            return response()->json($data);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
