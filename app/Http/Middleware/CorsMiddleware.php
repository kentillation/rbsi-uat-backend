<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CorsMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        // Allowed origins
        $allowedOrigins = [
            'http://localhost:8080',
            'http://localhost:8081',
            'http://192.168.1.29:8080', // Frontend URL
        ];

        if (in_array($request->header('Origin'), $allowedOrigins)) {
            $headers = [
                'Access-Control-Allow-Origin' => $request->header('Origin'),
                'Access-Control-Allow-Methods' => 'GET, POST, PUT, PATCH, DELETE, OPTIONS',
                'Access-Control-Allow-Headers' => 'Content-Type, Authorization',
            ];

            if ($request->getMethod() == "OPTIONS") {
                return response()->json('OK', 200, $headers);
            }

            $response = $next($request);
            foreach ($headers as $key => $value) {
                $response->header($key, $value);
            }

            return $response;
        }

        return $next($request);
    }
}
