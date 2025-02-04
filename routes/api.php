<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ClientInfoController;
use App\Http\Controllers\ClientInfoRelationController;
use App\Http\Controllers\WatchListController;
use App\Http\Controllers\CustomerController;

Route::middleware('auth:sanctum')->get('users', function (Request $request) {
  return $request->user();
});
Route::post('admin-register', [AuthController::class, 'register']);
Route::post('admin-login', [AuthController::class, 'login']);
Route::post('generate-token', [ClientInfoController::class, 'generateToken']);
Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
Route::middleware('auth:sanctum')->post('new_client_info', [ClientInfoController::class, 'addNewClient']);
Route::middleware('auth:sanctum')->post('update_client_info/{cid}', [ClientInfoController::class, 'updateClient']);
Route::post('account_enquiry', [ClientInfoController::class, 'accountEnquiry']);
Route::post('account_transaction_history', [ClientInfoController::class, 'accountTransactionHistory']);
// Route::post('create-customer', [CustomerController::class, 'createCustomer']); //testing
// Route::middleware('auth:sanctum')->get('mbwin_client_info', [ClientInfoController::class, 'getMBWinClientInfo']);
Route::middleware('auth:sanctum')->get('show_mbwin_client_info/{cid}', [ClientInfoController::class, 'getClientInfo_FILTERED_MBWIN']);
Route::middleware('auth:sanctum')->get('check_mbwin_client_info', [ClientInfoController::class, 'checkClientInfo_MBWIN']);
Route::middleware('auth:sanctum')->get('client_info', [ClientInfoController::class, 'getClientInfo_search_PHPMYADMIN']);
Route::middleware('auth:sanctum')->get('show_client_info/{cid}/{last_name}', [ClientInfoController::class, 'getClientInfo_FILTERED_PHPMYADMIN']);
Route::middleware('auth:sanctum')->get('check_new_db_client_info', [ClientInfoController::class, 'checkClientInfo_PHPMYADMIN']);
Route::middleware('auth:sanctum')->get('client_image/{filename}', [ClientInfoController::class, 'getClientImage']);
Route::middleware('auth:sanctum')->get('suffixes', [ClientInfoRelationController::class, 'getSuffixes']);
Route::middleware('auth:sanctum')->get('types', [ClientInfoRelationController::class, 'getTypes']);
Route::middleware('auth:sanctum')->get('titles', [ClientInfoRelationController::class, 'getTitles']);
Route::middleware('auth:sanctum')->get('client_status', [ClientInfoRelationController::class, 'getClientStatus']);
Route::middleware('auth:sanctum')->get('genders', [ClientInfoRelationController::class, 'getGenders']);
Route::middleware('auth:sanctum')->get('civil_status', [ClientInfoRelationController::class, 'getCivilStatus']);
Route::middleware('auth:sanctum')->get('institution', [ClientInfoRelationController::class, 'getInstitution']);
Route::middleware('auth:sanctum')->get('entity', [ClientInfoRelationController::class, 'getEntity']);
Route::middleware('auth:sanctum')->get('employment', [ClientInfoRelationController::class, 'getEmployment']);
Route::middleware('auth:sanctum')->get('address_type', [ClientInfoRelationController::class, 'getAddressType']);
Route::middleware('auth:sanctum')->get('relationship', [ClientInfoRelationController::class, 'getRelationship']);
Route::middleware('auth:sanctum')->get('watchlist', [WatchListController::class, 'watchList']);