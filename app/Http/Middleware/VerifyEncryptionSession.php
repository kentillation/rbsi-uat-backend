<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Cache;

class VerifyEncryptionSession
{
    public function handle($request, Closure $next)
    {
        $sessionId = $request->header('X-Session-ID');
        
        if (!$sessionId) {
            \Log::error('Missing session ID header');
            return response()->json(['error' => 'Session ID missing'], 401);
        }

        if (!Cache::has('session_key_' . $sessionId)) {
            \Log::error('Session key not found', ['sessionId' => $sessionId]);
            return response()->json(['error' => 'Session key not established'], 401);
        }

        return $next($request);
    }
}