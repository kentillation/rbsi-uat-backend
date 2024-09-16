<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ClientInfoController;
use App\Http\Controllers\ClientInfoRelationController;
use App\Http\Controllers\WatchListController;

Route::middleware('auth:sanctum')->get('users', function (Request $request) {
  return $request->user();
});
Route::post('admin-register', [AuthController::class, 'register']);
Route::post('admin-login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
Route::middleware('auth:sanctum')->post('create_customer', [ClientInfoController::class, 'create']);
// Route::middleware('auth:sanctum')->post('new_client_info', [ClientInfoController::class, 'addNewClient']);
Route::middleware('auth:sanctum')->post('update_client_info/{cid}', [ClientInfoController::class, 'updateClient']);
Route::middleware('auth:sanctum')->get('mbwin_client_info', [ClientInfoController::class, 'getMBWinClientInfo']);
Route::middleware('auth:sanctum')->get('check_mbwin_client_info', [ClientInfoController::class, 'checkMBWinClientInfo']);
Route::middleware('auth:sanctum')->get('client_info', [ClientInfoController::class, 'getClientInfo']);
Route::middleware('auth:sanctum')->get('show_client_info/{cid}/{last_name}', [ClientInfoController::class, 'showClientInfo']);
Route::middleware('auth:sanctum')->get('check_new_db_client_info', [ClientInfoController::class, 'checkNewDBClientInfo']);
Route::middleware('auth:sanctum')->get('client_image/{filename}', [ClientInfoController::class, 'getClientImage']);
Route::middleware('auth:sanctum')->get('types', [ClientInfoRelationController::class, 'getTypes']);
Route::middleware('auth:sanctum')->get('titles', [ClientInfoRelationController::class, 'getTitles']);
Route::middleware('auth:sanctum')->get('client_status', [ClientInfoRelationController::class, 'getClientStatus']);
Route::middleware('auth:sanctum')->get('genders', [ClientInfoRelationController::class, 'getGenders']);
Route::middleware('auth:sanctum')->get('civil_status', [ClientInfoRelationController::class, 'getCivilStatus']);
Route::middleware('auth:sanctum')->get('institution', [ClientInfoRelationController::class, 'getInstitution']);
Route::middleware('auth:sanctum')->get('entity', [ClientInfoRelationController::class, 'getEntity']);
Route::middleware('auth:sanctum')->get('employment', [ClientInfoRelationController::class, 'getEmployment']);
Route::middleware('auth:sanctum')->get('address_type', [ClientInfoRelationController::class, 'getAddressType']);
Route::middleware('auth:sanctum')->get('tax_code', [ClientInfoRelationController::class, 'getTaxCode']);
Route::middleware('auth:sanctum')->get('watchlist', [WatchListController::class, 'watchList']);