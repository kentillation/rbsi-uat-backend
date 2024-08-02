<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\T_CIFcontroller;
use App\Http\Controllers\T_ADDRESScontroller;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\TypesController;
use App\Http\Controllers\TitlesController;
use App\Http\Controllers\CustomerStatusController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('admin-register', [AuthController::class, 'register']);
Route::post('admin-login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//   return $request->user();
// });

Route::middleware('auth:sanctum')->get('register', [RegisterController::class, 'register']);
Route::middleware('auth:sanctum')->get('customer-info', [T_CIFcontroller::class, 'getT_CIF']);
Route::middleware('auth:sanctum')->get('customer-address', [T_ADDRESScontroller::class, 'getT_ADDRESS']);
Route::get('types', [TypesController::class, 'getTypes']);
Route::get('titles', [TitlesController::class, 'getTitles']);
Route::get('customer_status', [CustomerStatusController::class, 'getCustomerStatus']);