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

    // protected $customerTemplate = [
    //     "messageId" => "a765f849e543a7cee882d6b84ab2729b724c4bc1",
    //     "token" => "031a92cb2e1cee8746ec1bedb05d44a93cf0fef8",
    //     "br" => "000000",
    //     "cidType" => "001",
    //     "title" => "000",
    //     "name1" => "Bibor",
    //     "name2" => "Causing",
    //     "name3" => "Engbino",
    //     "name4" => "Jr.",
    //     "initials" => "Borbor",
    //     "mobile1" => "+639453145499",
    //     "email1" => "timmy@gmail.com",
    //     "gender" => "001",
    //     "civilStatus" => "S00",
    //     "dob" => "2020-09-15",
    //     "langType" => "001",
    //     "appType" => "1",
    //     "prType" => "51",
    //     "glCode" => "01",
    //     "ownershipType" => "010",
    //     "cid" => "",
    //     "staff" => "F",
    //     "taxCode" => "001",
    //     "address" => [ 
    //         [
    //             "addressType" => "001",
    //             "line1" => "Prk. Paghidaet",
    //             "primary" => "T",
    //             "mailing" => "T",
    //             "tempMailing" => "F",
    //             "startDate" => "2024-09-17"
    //         ]
    //     ],
    //     "ccCode1" => "000",
    //     "ccCode2" => "000",
    //     "ccCode3" => "070",
    //     "regDate" => "2024-09-20",
    //     "relation" => [ 
    //         [
    //             "cid" => "000281",
    //             "relationType" => "051"
    //         ],
    //         [
    //             "cid" => "000282",
    //             "relationType" => "051"
    //         ]
    //     ]
    // ];

    protected $customerTemplate = [
        "messageId" => "4c74bbc4281a477b81e6e1a7c15341b9a5a5aak",
        "token" => "38191ac6d87d0e050eeb20c9f3c738b8009fb8ba",
        "br" => "000000",
        "cid" => "000001",
        "appType" => "1",
        "prType" => "51",
        "ownershipType" => "010",
        "remark" => "test remark",
        "contractAmt" => 12,
        "maturityDate" => "2099-01-01",
        "glCode" => "L7",
        "mailTF" => "T",
        "accCode1" => "001",
        "accCode2" => "002",
        "accCode3" => "003",
        "signCode" => "001",
        "signRule" => "testsignrule",
        "nextCapDate" => "2099-01-01",
        // "relAccCID" => [ 
        //     [
        //         "cid" => "000001",
        //         "relType" => "010", //SINGLE
        //         "br" => "000000",
        //     ]
        // ]
    ];

    // $customerData = array_merge($this->customerTemplate, [
    //     'name1' => $request->input('last_name', $this->customerTemplate['name1']),
    //     'gender' => $request->input('gender', $this->customerTemplate['gender']),
    //     'civilStatus' => $request->input('civil_status', $this->customerTemplate['civilStatus']),
    //     'dob' => $request->input('birthdate', $this->customerTemplate['dob']),
    //     'address' => $request->input('address', $this->customerTemplate['address']),
    //     'relation' => $request->input('relation', $this->customerTemplate['relation']),
    //     'messageId' => $messageId,
    //     'token' => $token,
    // ]);

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

    // public function generateMessageId()
    // {
    //     $uuid = Str::uuid()->toString();
    //     $messageId = str_replace('-', '', $uuid);
    //     if (strlen($messageId) < 40) {
    //         $randomString = strtolower(Str::random(40 - strlen($messageId)));
    //         $messageId .= $randomString;
    //     }
    //     return substr($messageId, 0, 40);
    // }

    public function createCustomer(Request $request)
    {
        // Log::info('Request Headers:', $request->headers->all());
        // $token = $this->generateAuthToken();
        // $messageId = $this->generateMessageId();
        // $customerData = $request->all();
        // $customerData['messageId'] = $messageId;
        // $customerData['token'] = $token;
        // if (!$token) {
        //     // Log::error('Authentication failed: No token received', [
        //     //     'headers' => $request->headers->all(),
        //     //     'payload' => $request->all(),
        //     // ]);
        //     return response()->json(['message' => 'Authentication failed'], 401);
        // }

        // CUSTOMER DATA
        // $apiUrl = "http://localhost:6500/datasnap/rest/client/createCustomer";

        $apiUrl = "http://localhost:6500/datasnap/rest/client/createAccount";
        $response = Http::withHeaders([
            'Content-Type' => $this->config['contentType'],
            'Authorization' => "Basic aWJjbGllbnQ6MTIzNA=="
        ])->post($apiUrl, $this->customerTemplate);
        // ])->post($apiUrl, $customerData);
        if ($response->successful()) {
            $responseData = $response->json();
            // Log::info('Generated messageId:', ['messageId' => $messageId]);
            // Log::info('Customer created successfully:', ['data' => $responseData]);
            // DB::transaction(function () use ($messageId, $token) {
            //     AuthModel::create([
            //         'generated_message_id' => $messageId,
            //         'generated_token' => $token,
            //     ]);
            // });
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
