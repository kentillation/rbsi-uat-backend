<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

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
        $allowedOrigins = [
            'http://localhost:8080',
            'http://localhost:8081',
            'http://192.168.10.246:8080',
            'http://192.168.1.105:8080',
        ];
        $origin = $request->header('Origin');
        \Log::info('CORS Origin:', ['origin' => $origin]);
        $headers = [
            'Access-Control-Allow-Origin' => in_array($origin, $allowedOrigins) ? $origin : '*',
            'Access-Control-Allow-Methods' => 'GET, POST, PUT, PATCH, DELETE, OPTIONS',
            'Access-Control-Allow-Headers' => 'Content-Type, Authorization',
            'Access-Control-Allow-Credentials' => 'true',
            'Access-Control-Expose-Headers' => 'Content-Disposition',
        ];
        if ($request->isMethod('OPTIONS')) {
            return response()->json('OK', 200, $headers);
        }
        $response = $next($request);
        if ($response instanceof BinaryFileResponse) {
            foreach ($headers as $key => $value) {
                $response->headers->set($key, $value);
            }
            return $response;
        }
        foreach ($headers as $key => $value) {
            $response->header($key, $value);
        }
        return $response;
    }
}
