<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
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

    public function login(Request $request)
    {
        try {
            $sessionId = $request->header('X-Session-ID');
            $sessionKey = $this->getSessionKey($sessionId);
            $aes = new AES('cbc');
            $aes->setKey($sessionKey);
            $aes->setIV(config('app.encryption_iv')); // Should be constant
            $decrypted = json_decode(
                $aes->decrypt(base64_decode($request->input('data'))),
                true
            );
            // Validate timestamp to prevent replay attacks
            if (time() - $decrypted['timestamp'] > 30) {
                return response()->json(['message' => 'Expired request'], 400);
            }
             $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
            ]);
            $credentials = $request->only('email', 'password');
            if (!Auth::attempt($credentials)) {
                return response()->json(['message' => 'Invalid credentials'], 401);
            }
            if (!in_array($request->ip(), ['192.168.1.13', '127.0.0.1'])) {
                return response()->json(['message' => 'You do not have permission to this action.'], 403);
            }
            /** @var \App\Models\User $user **/
            $user = Auth::user();
            $token = $user->createToken('auth_token')->plainTextToken;
            return response()->json(['access_token' => $token, 'token_type' => 'Bearer']);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Invalid request'], 400);
        }
       
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json(['message' => 'Logged out successfully.']);
    }
}
