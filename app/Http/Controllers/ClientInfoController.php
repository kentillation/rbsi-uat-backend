<?php

namespace App\Http\Controllers;

use App\Models\ClientInfoModel;
use App\Models\MBWinClientInfoModel;
use App\Models\MBWinClientAccModel;
use App\Models\TypesModel;
use App\Models\TitlesModel;
use App\Models\SuffixesModel;
use App\Models\ClientStatusModel;
use App\Models\GendersModel;
use App\Models\CivilStatusModel;
use App\Models\AddressTypeModel;
use App\Models\InstitutionModel;
use App\Models\EntityModel;
use App\Models\EmploymentModel;
use App\Models\RelationshipModel;
use App\Models\MBWinAddressModel;
use App\Models\AddressModel;
use App\Models\RelatedCIDModel;

use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Cache;
use phpseclib3\Crypt\AES;
use Illuminate\Support\Str;

class ClientInfoController extends Controller
{
    public function checkClientInfo_MBWIN(Request $request)
    {
        try {
            $exists = MBWinClientInfoModel::where('Name2', $request->input('first_name'))
                ->where('Name3', $request->input('middle_name'))
                ->where('Name1', $request->input('last_name'))
                ->exists();
            return response()->json(['exists' => $exists]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function checkClientInfo_PHPMYADMIN(Request $request)
    {
        try {
            $exists = ClientInfoModel::where('first_name', $request->input('first_name'))
                ->where('middle_name', $request->input('middle_name'))
                ->where('last_name', $request->input('last_name'))
                ->exists();
            return response()->json(['exists' => $exists]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getClientInfo_search_PHPMYADMIN(Request $request)
    {
        try {
            $search = $request->query('search');
            $clients = ClientInfoModel::where('cid', 'LIKE', "%{$search}%")
                ->orWhere('last_name', 'LIKE', "%{$search}%")
                ->with('address')
                ->get();
            return response()->json($clients);
            // return response()->json($clients, 200, ['Content-Type' => 'application/json;charset=UTF-8'], JSON_UNESCAPED_UNICODE);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    private function validateSearchInput($input)
    {
        if (!is_string($input)) {
            throw new \InvalidArgumentException('Invalid search parameter');
        }

        // Limit length and allow only certain characters
        if (strlen($input) > 100 || !preg_match('/^[a-zA-Z0-9\s\-]+$/', $input)) {
            throw new \InvalidArgumentException('Invalid search format');
        }

        return $input;
    }

    public function getClientInfo_search_CIDLastname_MBWIN(Request $request)
    {
        try {
            $sessionId = $request->header('X-Session-ID');
            if (!$sessionId) {
                \Log::warning("Unauthorized access attempt without session ID");
                return response()->json(['error' => 'Session ID missing'], 401);
            }

            $user = $request->user();
            if (!$user) {
                \Log::warning("Unauthorized access attempt without user session");
                return response()->json(['error' => 'Unauthorized'], 401);
            }
            if (!$user->session_key) {
                \Log::warning("Session key not found for user ID: {$user->id}");
                return response()->json(['error' => 'Session key not established'], 403);
            }

            $encryptedData = $request->input('data');
            if (!$encryptedData) {
                return response()->json(['error' => 'Encrypted data required'], 400);
            }
            $user = $request->user();
            $decodedData = base64_decode($encryptedData);
            if (strlen($decodedData) < 16) {
                return response()->json(['error' => 'Invalid encrypted data format'], 400);
            }
            $iv = substr($decodedData, 0, 16);
            $ciphertext = substr($decodedData, 16);
            $aes = new AES('cbc');
            $aes->setKey($user->session_key);
            $aes->setIV($iv);
            $decrypted = $aes->decrypt($ciphertext);
            $decodedJson = json_decode($decrypted, true);
            if (json_last_error() !== JSON_ERROR_NONE) {
                return response()->json(['error' => 'Invalid data format'], 400);
            }
            $search = $this->validateSearchInput($decodedJson['search'] ?? '');
            if (empty($search)) {
                return response()->json(['error' => 'Search parameter required'], 400);
            }
            $query = MBWinClientInfoModel::with('address')
                ->where(function ($q) use ($search) {
                    $q->where('CID', 'LIKE', "%{$search}%")
                        ->orWhere('Name1', 'LIKE', "%{$search}%");
                });
            $processedData = collect();
            $query->chunkById(200, function ($clients) use (&$processedData) {
                $processedData = $processedData->concat($clients->map(function ($client) {
                    $addressData = $client->address->map(function ($address) {
                        return [
                            'Line1' => $address->Line1 ?? null,
                            'Line2' => $address->Line2 ?? null,
                            'Line3' => $address->Line3 ?? null,
                            'AddressType' => $address->AddressType ?? null,
                            'Phone1' => $address->Phone1 ?? null,
                            'PostalCode' => $address->PostalCode ?? null,
                        ];
                    });

                    return [
                        'CID' => $client->CID,
                        'Name1' => $client->Name1,
                        'Name2' => $client->Name2,
                        'Name3' => $client->Name3,
                        'TitleCode' => $client->TitleCode,
                        'DisplayName' => $client->DisplayName,
                        'Initials' => $client->Initials,
                        'DosriTF' => $client->DosriTF,
                        'Type' => $client->Type,
                        'Mobile1' => $client->Mobile1,
                        'Email1' => $client->Email1,
                        'Email2' => $client->Email2,
                        'GenderType' => $client->GenderType,
                        'CivilStatusCode' => $client->CivilStatusCode,
                        'BirthDate' => $client->BirthDate,
                        'LastChangeDate' => $client->LastChangeDate,
                        'address' => $addressData,
                    ];
                }));
            });
            $responseData = $processedData->isEmpty() ? [] : $processedData->toArray();
            $responseIv = random_bytes(16);
            $aes->setIV($responseIv);
            $encryptedResponse = $aes->encrypt(json_encode($responseData));
            return response()->json([
                'data' => base64_encode($responseIv . $encryptedResponse)
            ]);
        } catch (\Exception $e) {
            \Log::error("Client search error - " . $e->getMessage());
            return response()->json([
                'error' => 'Processing failed',
                'message' => $e->getMessage(),
                'line' => $e->getLine(),
                'file' => $e->getFile(),
            ], 500);
        }
    }

    private function sanitizeFilename($filename)
    {
        return preg_replace('/[^a-zA-Z0-9\-_\.]/', '', $filename);
    }

    // public function getClientImage($folderName, $imageFileName)
    // {
    //     $folderPath = 'client_files/' . $folderName . '/' . $imageFileName;
    //     if (!File::exists($folderPath)) {
    //         return response()->json(['message' => 'Image not found.'], 404);
    //     }
    //     return response()->file($folderPath, ['Content-Type' => File::mimeType($folderPath)]);

    // }
    public function getClientImage($folderName, $imageFileName)
    {
        $folderName = $this->sanitizeFilename($folderName);
        $imageFileName = $this->sanitizeFilename($imageFileName);
        $folderPath = storage_path('app/client_files/' . $folderName . '/' . $imageFileName);
        if (!File::exists($folderPath)) {
            abort(404, 'Image not found');
        }
        return response()->file($folderPath, [
            'Content-Type' => File::mimeType($folderPath),
            'Content-Disposition' => 'inline'
        ]);
    }
    public function getClientInfo_FILTERED_PHPMYADMIN($cid, $last_name)
    {
        $client = ClientInfoModel::select(
            't_cif.*',
            't_cif_suffixes.suffix',
            't_cif_types.type',
            't_cif_titles.title',
            't_cif_client_status.client_status',
            't_cif_gender.gender',
            't_cif_civil_status.civil_status',
            't_cif_address_type.address_type'
        )
            ->leftJoin('t_cif_suffixes', 't_cif.suffix', '=', 't_cif_suffixes.id')
            ->leftJoin('t_cif_types', 't_cif.type', '=', 't_cif_types.id')
            ->leftJoin('t_cif_titles', 't_cif.title', '=', 't_cif_titles.id')
            ->leftJoin('t_cif_client_status', 't_cif.client_status', '=', 't_cif_client_status.id')
            ->leftJoin('t_cif_gender', 't_cif.gender', '=', 't_cif_gender.id')
            ->leftJoin('t_cif_civil_status', 't_cif.civil_status', '=', 't_cif_civil_status.id')
            ->leftJoin('t_cif_address_type', 't_cif.address_type', '=', 't_cif_address_type.id')
            ->where('t_cif.cid', $cid)
            ->where('t_cif.last_name', $last_name)
            ->first();
        if ($client) {
            return response()->json($client);
        } else {
            return response()->json(['error' => 'Client not found.'], 404);
        }
    }
    public function getClientLastCID_FILTERED_MBWIN()
    {
        $CID = MBWinClientInfoModel::max('CID');
        if (!$CID) {
            return response()->json(['error' => 'CID not found'], 404);
        }
        return response()->json($CID);
    }
    public function getClientACC_FILTERED_MBWIN()
    {
        $account = MBWinClientAccModel::select('ACC', 'Chd')
            ->orderBy('ACC', 'desc')
            ->first();
        if (!$account || !$account->ACC) {
            return response()->json(['error' => 'Account number not found'], 404);
        }
        return response()->json([
            'ACC' => $account->ACC,
            'Chd' => $account->Chd
        ]);
    }
    public function getClientInfo_FILTERED_MBWIN($cid)
    {
        $clientInfo = MBWinClientInfoModel::with('address', 'relation')->find($cid);
        if (!$clientInfo) {
            return response()->json(['error' => 'Client not found'], 404);
        }
        return response()->json($clientInfo);
    }
    public function getCID_MBWIN($cid)
    {
        try {
            $cid = MBWinClientInfoModel::where('CID', $cid)->first();
            return response()->json($cid);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getAcc_MBWIN(Request $request)
    {
        try {
            $search = $request->query('search');
            $acc = MBWinClientAccModel::where('ACC', $search)->get();
            return response()->json($acc);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getAcc_Chd_MBWIN(Request $request)
    {
        try {
            $acc = $request->query('acc');
            $chd = $request->query('chd');
            $account = MBWinClientAccModel::where('ACC', $acc)
                ->where('Chd', $chd)
                ->first();
            if ($account) {
                return response()->json($account);
            } else {
                return response()->json(['message' => 'Account not found!'], 404);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getSearch_CID_MBWIN(Request $request)
    {
        try {
            $search = $request->query('search');
            $cid = MBWinClientInfoModel::where('CID', $search)->get();
            return response()->json($cid);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function getMBWinClientInfo()
    {
        try {
            $processedData = [];
            MBWinClientInfoModel::with(['address', 'relation'])
                ->chunkById(200, function ($clients) use (&$processedData) {
                    foreach ($clients as $client) {
                        $processedData[] = [
                            'CID' => $client->CID,
                            'Name1' => $client->Name1,
                            'Name2' => $client->Name2,
                            'Name3' => $client->Name3,
                            'TitleCode' => $client->TitleCode,
                            'DisplayName' => $client->DisplayName,
                            'StatusType' => $client->StatusType,
                            'Initials' => $client->Initials,
                            'DosriTF' => $client->DosriTF,
                            'Type' => $client->Type,
                            'Mobile1' => $client->Mobile1,
                            'Email1' => $client->Email1,
                            'Email2' => $client->Email2,
                            'GenderType' => $client->GenderType,
                            'CivilStatusCode' => $client->CivilStatusCode,
                            'BirthDate' => $client->BirthDate,
                            'address' => $client->address,
                            'LastChangeDate' => $client->LastChangeDate,
                        ];
                    }
                });
            $processedData = array_slice($processedData, 0, 1000);
            if (empty($processedData)) {
                return response()->json(['error' => 'No client information found'], 404);
            }
            // return response()->json($processedData);
            return response()->json($processedData, 200, ['Content-Type' => 'application/json;charset=UTF-8'], JSON_UNESCAPED_UNICODE);

        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
