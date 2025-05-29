<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Cache;
use phpseclib3\Crypt\AES;

class AuthController extends Controller
{
    public function decryptData(Request $request)
    {
        try {
            $decrypted = Crypt::decryptString($request->input('data'));
            return response()->json(['decrypted' => $decrypted]);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Invalid encrypted data'], 400);
        }
    }
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json(['message' => 'User registered successfully.']);
    }

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

    public function login(Request $request)
    {
        try {
            $sessionId = $request->header('X-Session-ID');
            $sessionKey = $this->getSessionKey($sessionId);
            \Log::info("Session ID: $sessionId");
            \Log::info("Session key (hex): " . ($sessionKey ? bin2hex($sessionKey) : 'null'));
            \Log::info("Session key size: " . ($sessionKey ? strlen($sessionKey) : 0));
            if (!$sessionKey) {
                return response()->json(['message' => 'Invalid session. Refresh the page and try again!'], 401);
            }
            $encryptedDataB64 = $request->input('data');
            $encryptedData = base64_decode($encryptedDataB64);
            \Log::info('Raw encrypted data (base64): ' . $encryptedDataB64);
            \Log::info('Raw encrypted data (hex): ' . ($encryptedData ? bin2hex($encryptedData) : 'null'));
            if ($encryptedData === false || strlen($encryptedData) < 32) {
                return response()->json(['message' => 'Invalid encrypted data'], 400);
            }
            $iv = substr($encryptedData, 0, 16);
            $ciphertext = substr($encryptedData, 16);
            \Log::info('IV (hex): ' . bin2hex($iv));
            \Log::info('IV length: ' . strlen($iv));
            \Log::info('Ciphertext (hex): ' . bin2hex($ciphertext));
            \Log::info('Ciphertext length: ' . strlen($ciphertext));
            if (strlen($iv) !== 16) {
                return response()->json(['message' => 'Invalid IV length'], 400);
            }
            if (strlen($ciphertext) % 16 !== 0) {
                return response()->json(['message' => 'Corrupted ciphertext'], 400);
            }
            if (!in_array(strlen($sessionKey), [16, 24, 32])) {
                return response()->json(['message' => 'Invalid session key length'], 400);
            }
            $aes = new AES('cbc');
            $aes->setKey($sessionKey);
            $aes->setIV($iv);
            $decryptedJson = $aes->decrypt($ciphertext);
            \Log::info('Decrypted JSON: ' . $decryptedJson);
            $decrypted = json_decode($decryptedJson, true);
            if (!$decrypted || !isset($decrypted['timestamp'], $decrypted['email'], $decrypted['password'])) {
                return response()->json(['message' => 'Invalid decrypted data'], 400);
            }
            if (time() - $decrypted['timestamp'] > 30) {
                return response()->json(['message' => 'Expired request'], 400);
            }

            // Validate credentials
            if (
                !Auth::attempt([
                    'email' => $decrypted['email'],
                    'password' => $decrypted['password']
                ])
            ) {
                return response()->json(['message' => 'Invalid credentials'], 401);
            }
            if (!in_array($request->ip(), ['192.168.1.13', '127.0.0.1'])) {
                return response()->json(['message' => 'Forbidden IP'], 403);
            }
            /** @var \App\Models\User $user **/
            $user = Auth::user();
            $token = $user->createToken('auth_token')->plainTextToken;
            $responseData = [
                'access_token' => $token,
                'token_type' => 'Bearer'
            ];
            // $sessionKey = $this->getSessionKey($sessionId);
            if (!$sessionKey) {
                return response()->json(['message' => 'Session expired'], 401);
            }
            $iv = random_bytes(16);
            $aes = new AES('cbc');
            $aes->setKey($sessionKey);
            $aes->setIV($iv);
            $encryptedData = $aes->encrypt(json_encode($responseData));
            $encryptedResponse = base64_encode($iv . $encryptedData);
            return response()->json([
                'data' => $encryptedResponse
            ]);
        } catch (\Exception $e) {
            \Log::error('Login error: ' . $e->getMessage());
            return response()->json(['message' => 'Invalid request'], 400);
        }
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logged out successfully.']);
    }
}
