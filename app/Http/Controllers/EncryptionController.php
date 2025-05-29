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
        $publicKeyPath = storage_path('app/keys/public.key');
        if (!file_exists($publicKeyPath)) {
            return response()->json([
                'message' => 'Public key not found.'
            ], 500);
        }
        return response()->json([
            'publicKey' => file_get_contents($publicKeyPath)
        ])->header('Cache-Control', 'no-store');
    }

    public function establish(Request $request)
    {
        \Log::info('Establish endpoint hit', ['encryptedKey' => $request->has('encryptedKey')]);

        try {
            if (!$request->has('encryptedKey')) {
                \Log::error('Missing encrypted key');
                return response()->json(['error' => 'Missing encrypted key'], 400);
            }

            $privateKey = openssl_pkey_get_private(file_get_contents(storage_path('app/keys/private.key')));
            if (!$privateKey) {
                \Log::error('Private key error: ' . openssl_error_string());
                throw new \Exception("Invalid private key: " . openssl_error_string());
            }

            $encryptedData = base64_decode($request->encryptedKey);
            if ($encryptedData === false) {
                \Log::error('Base64 decode failed');
                return response()->json(['error' => 'Invalid Base64 encoding'], 400);
            }

            $decrypted = '';
            if (!openssl_private_decrypt($encryptedData, $decrypted, $privateKey, OPENSSL_PKCS1_PADDING)) {
                \Log::error('Decryption failed', ['error' => openssl_error_string()]);
                throw new \Exception("Decryption failed: " . openssl_error_string());
            }

            $sessionKeyBinary = base64_decode($decrypted);
            if ($sessionKeyBinary === false) {
                \Log::error('Session key decode failed');
                throw new \Exception("Invalid session key encoding");
            }

            $sessionId = Str::random(40);
            Cache::put('session_key_' . $sessionId, $sessionKeyBinary, now()->addMinutes(30));

            \Log::info('Session established', [
                'sessionId' => $sessionId,
                'keyLength' => strlen($sessionKeyBinary)
            ]);

            return response()->json([
                'sessionId' => $sessionId,
                'status' => 'success'
            ]);

        } catch (\Exception $e) {
            \Log::error('Establish error: ' . $e->getMessage());
            return response()->json([
                'error' => 'Key establishment failed',
                'message' => $e->getMessage()
            ], 500);
        }
    }
}
