<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use phpseclib3\Crypt\RSA;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Cache;

class EncryptionController extends Controller
{
    private $privateKey;
    private $sessionKeys = []; // In production, use Redis or database

    public function __construct()
    {
        $this->privateKey = RSA::loadPrivateKey(
            file_get_contents(storage_path('app/keys/private.key'))
        );
    }

    public function init()
    {
        return response()->json([
            'publicKey' => file_get_contents(storage_path('app/keys/public.key'))
        ]);
    }

    public function establish(Request $request)
    {
        try {
            if (!$request->has('encryptedKey') || empty($request->encryptedKey)) {
                return response()->json(['error' => 'Missing encrypted key'], 400);
            }

            // Verify the encrypted key is valid Base64
            if (!base64_decode($request->encryptedKey, true)) {
                return response()->json(['error' => 'Invalid Base64 encoding'], 400);
            }

            // Decrypt the session key
            $decrypted = $this->privateKey->decrypt(
                base64_decode($request->encryptedKey)
            );

            if (!$decrypted) {
                // More detailed error logging
                $keySize = $this->privateKey->getLength();
                $inputSize = strlen(base64_decode($request->encryptedKey));
                \Log::error("Decryption failed. Key size: {$keySize} bits, Input size: {$inputSize} bytes");

                throw new \Exception("Decryption failed - check key sizes and encoding");
            }

            // Verify the decrypted key is valid
            if (strlen($decrypted) !== 44) { // 32 bytes as Base64 is 44 chars
                throw new \Exception("Invalid session key length after decryption");
            }

            // Store session key
            $sessionId = Str::random(40);
            Cache::put('session_key_' . $sessionId, $decrypted, now()->addMinutes(30));

            return response()->json([
                'sessionId' => $sessionId,
                'status' => 'success'
            ]);

        } catch (\Exception $e) {
            \Log::error('Establish error: ' . $e->getMessage() . "\n" . $e->getTraceAsString());
            return response()->json([
                'error' => 'Key establishment failed',
                'message' => $e->getMessage()
            ], 500);
        }
    }
}
