<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClientInfoController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\TypesController;
use App\Http\Controllers\TitlesController;
use App\Http\Controllers\ClientStatusController;
use App\Http\Controllers\GendersController;
use App\Http\Controllers\CivilStatusController;
use App\Http\Controllers\UndefController;
use App\Http\Controllers\EntityController;
use App\Http\Controllers\EmploymentController;
use App\Http\Controllers\AddressTypeController;
use App\Http\Controllers\TaxCodeController;
use App\Http\Controllers\WatchListController;

Route::post('admin-register', [AuthController::class, 'register']);
Route::post('admin-login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
Route::middleware('auth:sanctum')->get('users', function (Request $request) {
  return $request->user();
});
// Route::middleware('auth:sanctum')->get('register', [RegisterController::class, 'register']);
Route::middleware('auth:sanctum')->get('mbwin_client_info', [ClientInfoController::class, 'getMBWinClientInfo']);
Route::middleware('auth:sanctum')->get('check_mbwin_client_info', [ClientInfoController::class, 'checkMBWinClientInfo']);
Route::middleware('auth:sanctum')->get('client_info', [ClientInfoController::class, 'getClientInfo']);
Route::middleware('auth:sanctum')->get('show_client_info/{cid}/{last_name}', [ClientInfoController::class, 'showClientInfo']);
Route::middleware('auth:sanctum')->get('check_new_db_client_info', [ClientInfoController::class, 'checkNewDBClientInfo']);
Route::middleware('auth:sanctum')->get('client_image/{filename}', [ClientInfoController::class, 'getClientImage']);
Route::middleware('auth:sanctum')->post('new_client_info', [ClientInfoController::class, 'addNewClient']);
Route::middleware('auth:sanctum')->post('update_client_info/{cid}', [ClientInfoController::class, 'updateClient']);
Route::middleware('auth:sanctum')->get('types', [TypesController::class, 'getTypes']);
Route::middleware('auth:sanctum')->get('titles', [TitlesController::class, 'getTitles']);
Route::middleware('auth:sanctum')->get('client_status', [ClientStatusController::class, 'getClientStatus']);
Route::middleware('auth:sanctum')->get('genders', [GendersController::class, 'getGenders']);
Route::middleware('auth:sanctum')->get('civil_status', [CivilStatusController::class, 'getCivilStatus']);
Route::middleware('auth:sanctum')->get('undef', [UndefController::class, 'getUndef']);
Route::middleware('auth:sanctum')->get('entity', [EntityController::class, 'getEntity']);
Route::middleware('auth:sanctum')->get('employment', [EmploymentController::class, 'getEmployment']);
Route::middleware('auth:sanctum')->get('address_type', [AddressTypeController::class, 'getAddressType']);
Route::middleware('auth:sanctum')->get('tax_code', [TaxCodeController::class, 'getTaxCode']);
Route::middleware('auth:sanctum')->get('watchlist', [WatchListController::class, 'watchList']);