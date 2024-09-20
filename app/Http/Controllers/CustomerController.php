<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use App\Models\AuthModel;

class CustomerController extends Controller
{
    protected $config = [
        'apiHttpType' => 'https',
        'apiServer' => 'localhost',
        'apiPort' => '6501',
        'apiUser' => 'ibclient',
        'apiPass' => '1234',
        'contentType' => 'application/json',
        'authenServer' => 'http://localhost:7000/api/v1/token/generate',
        'authenUser' => 'magnum',
        'authenPass' => 'a3pp3QNQ',
    ];

    protected $customerTemplate = [
        "messageId" => "8f96c894d16d6fd4c52b43766ef1ec657bac636b",
        "token" => "a5a3ae8fdd90ef759e56cac491e84034544a99fd",
        "br" => "000000",
        "cidType" => "001",
        "title" => "000",
        "name1" => "Sky",
        "gender" => "002",
        "civilStatus" => "S00",
        "dob" => "2020-09-15",
        "langType" => "001",
        "appType" => "1",
        "prType" => "51",
        "glCode" => "01",
        "ownershipType" => "010",
        "cid" => "",
        "staff" => "F",
        "taxCode" => "001",
        "address" => [
            [
                "addressType" => "001",
                "line1" => "Prk. Mahirup",
                "primary" => "T",
                "mailing" => "T",
                "tempMailing" => "F",
                "startDate" => "2024-09-17"
            ]
        ],
        "ccCode1" => "000",
        "ccCode2" => "000",
        "ccCode3" => "030",
        "regDate" => "2024-09-20",
        "relation" => [
            [
                "cid" => "000281",
                "relationType" => "051"
            ],
            [
                "cid" => "000282",
                "relationType" => "051"
            ]
        ]
    ];

    protected function generateAuthToken()
    {
        $response = Http::withOptions([
            'verify' => false,
        ])->withHeaders([
            'Authorization' => 'Basic bWFnbnVtOmEzcHAzUU5R'
        ])->post($this->config['authenServer'], [
            'message_id' => 'b5efbb98793a4c4cbd363ed6f18b95b4fs5LVuxF'
        ]);
        Log::info('Token generation response', ['response' => $response->json()]);
        if ($response->successful() && isset($response->json()['data']['token'])) {
            return $response->json()['data']['token'];
        }
        Log::error('Token generation failed', [
            'response' => $response->json(),
            'status' => $response->status(),
        ]);
        return null;
    }

    public function generateMessageId()
    {
        $uuid = Str::uuid()->toString();
        $messageId = str_replace('-', '', $uuid);
        if (strlen($messageId) < 40) {
            $randomString = strtolower(Str::random(40 - strlen($messageId)));
            $messageId .= $randomString;
        }
        return substr($messageId, 0, 40);
    }

    public function createCustomer(Request $request)
    {
        Log::info('Request Headers:', $request->headers->all());
        $token = $this->generateAuthToken();
        $messageId = $this->generateMessageId();
        if (!$token) {
            Log::error('Authentication failed: No token received', [
                'headers' => $request->headers->all(),
                'payload' => $request->all(),
            ]);
            return response()->json(['message' => 'Authentication failed'], 401);
        }
        $apiUrl = "http://localhost:6500/datasnap/rest/client/createCustomer";
        $response = Http::withHeaders([
            'Content-Type' => $this->config['contentType'],
            'Authorization' => "Basic aWJjbGllbnQ6MTIzNA=="
        ])->post($apiUrl, $this->customerTemplate);

        if ($response->successful()) {
            $responseData = $response->json();
            if (isset($responseData['messageId'])) {
                $responseData['messageId'] = $messageId;
            } else {
                $responseData['messageId'] = $messageId;
            }
            Log::info('Generated messageId:', ['messageId' => $messageId]);
            Log::info('Customer created successfully:', ['data' => $responseData]);
            
            DB::transaction(function () use ($messageId, $token) {
                AuthModel::create([
                    'generated_message_id' => $messageId,
                    'generated_token' => $token,
                ]);
            });

            return response()->json([
                'message' => 'Customer created successfully',
                'data' => $responseData,
            ]);

        } else {
            Log::error('Failed to create customer:', ['error' => $response->json()]);
            return response()->json(['message' => 'Failed to create customer', 'error' => $response->json()], $response->status());
        }

    }
}
