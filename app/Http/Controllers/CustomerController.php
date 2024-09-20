<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http; // For making HTTP requests

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
        "messageId" => "e2949879a4caf8190435d457ad81bafeadd28502",
        "token" => "fa0b2424c6e8880c5294996183cf077d477f8f46",
        "br" => "000000",
        "cidType" => "001",
        "title" => "000",
        "name1" => "Bukoykoy",
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
                "line1" => "Prk. Paghidaet",
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
            'message_id' => '4c74bbc4281a477b81e6e1a7c15341b9a5a5aak'
        ]);
        Log::info('Token generation response', ['response' => $response->json()]);
        // Ang ma generate nga message_id kag token amo ang gamiton para sa next nga data
        if ($response->successful() && isset($response->json()['data']['token'])) {
            return $response->json()['data']['token']; // Access the token correctly
        }
        Log::error('Token generation failed', [
            'response' => $response->json(),
            'status' => $response->status(),
        ]);
        return null;
    }

    public function createCustomer(Request $request)
    {
        Log::info('Request Headers:', $request->headers->all());
        $token = $this->generateAuthToken();
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
            return response()->json(['message' => 'Customer created successfully', 'data' => $response->json()]);
        } else {
            return response()->json(['message' => 'Failed to create customer', 'error' => $response->json()], $response->status());
        }
    }
}
