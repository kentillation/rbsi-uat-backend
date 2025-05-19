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
            if (!base64_decode($request->encryptedKey, true)) {
                return response()->json(['error' => 'Invalid Base64 encoding'], 400);
            }
            $privateKey = openssl_pkey_get_private($this->privateKey->toString('PKCS8'));
            if (!$privateKey) {
                throw new \Exception("Invalid private key: " . openssl_error_string());
            }
            $encryptedData = base64_decode($request->encryptedKey, true);
            $decryptedData = '';
            $success = openssl_private_decrypt(
                $encryptedData,
                $decryptedData,
                $privateKey,
                OPENSSL_PKCS1_PADDING
            );
            $sessionKeyBinary = base64_decode($decryptedData);
            \Log::info("Encrypted data size: " . strlen($encryptedData) . " bytes");
            \Log::info("Private key size: " . $this->privateKey->getLength() . " bits");
            if (!$success || strlen($decryptedData) !== 44) {
                throw new \Exception("Decryption failed. Output size: " . strlen($decryptedData));
            }
            $sessionId = Str::random(40);
            Cache::put(
                'session_key_' . $sessionId, 
                $sessionKeyBinary, 
                now()->addMinutes(30));
            \Log::info("Session key stored for ID: $sessionId", ['key' => $decryptedData]);
            \Log::info("Decrypted session key size: " . strlen($decryptedData) . " bytes");
            \Log::info("Decrypted Base64 key: " . $decryptedData); // Should be 44 chars
            \Log::info("Decoded binary key size: " . strlen($sessionKeyBinary)); // Must be 32 bytes
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
