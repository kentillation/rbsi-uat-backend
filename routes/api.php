<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\T_CIFcontroller;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\TypesController;
use App\Http\Controllers\TitlesController;
use App\Http\Controllers\ClientStatusController;
use App\Http\Controllers\NewClientController;
use App\Http\Controllers\GendersController;
use App\Http\Controllers\CivilStatusController;

Route::post('admin-register', [AuthController::class, 'register']);
Route::post('admin-login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
Route::middleware('auth:sanctum')->get('/users', function (Request $request) {
  return $request->user();
});
Route::middleware('auth:sanctum')->get('register', [RegisterController::class, 'register']);
Route::middleware('auth:sanctum')->get('client_info', [T_CIFcontroller::class, 'getT_CIF']);

Route::middleware('auth:sanctum')->get('types', [TypesController::class, 'getTypes']);
Route::middleware('auth:sanctum')->get('titles', [TitlesController::class, 'getTitles']);
Route::middleware('auth:sanctum')->get('client_status', [ClientStatusController::class, 'getClientStatus']);
Route::middleware('auth:sanctum')->get('genders', [GendersController::class, 'getGenders']);
Route::middleware('auth:sanctum')->get('civil_status', [CivilStatusController::class, 'getCivilStatus']);

Route::post('new_client_info', [NewClientController::class, 'add_new_client']);