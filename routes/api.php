<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ClientInfoController;
use App\Http\Controllers\ClientInfoRelationController;
use App\Http\Controllers\API_TransactionController;

Route::post('admin-register', [AuthController::class, 'register']);
Route::post('admin-login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->get('users', function (Request $request) { return $request->user();});
Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);
Route::middleware('auth:sanctum')->post('update_client_info/{cid}', [ClientInfoController::class, 'updateClient']);

// MBWIN PRE-DEFINED API
Route::middleware('auth:sanctum')->post('generate-token', [API_TransactionController::class, 'generateToken']);
Route::middleware('auth:sanctum')->post('create_account', [API_TransactionController::class, 'createAccount']);
Route::middleware('auth:sanctum')->post('account_list/{cid}', [API_TransactionController::class, 'accountList']);
Route::middleware('auth:sanctum')->post('account_enquiry', [API_TransactionController::class, 'accountEnquiry']);
Route::middleware('auth:sanctum')->post('account_transaction_history', [API_TransactionController::class, 'accountTransactionHistory']);
Route::middleware('auth:sanctum')->post('new_client_info', [API_TransactionController::class, 'addNewClient']);

// MBWIN API
Route::middleware('auth:sanctum')->get('get_mbwin_client_cid', [ClientInfoController::class, 'getClientLastCID_FILTERED_MBWIN']);
Route::middleware('auth:sanctum')->get('get_mbwin_client_account_number', [ClientInfoController::class, 'getClientACC_FILTERED_MBWIN']);
Route::middleware('auth:sanctum')->get('show_mbwin_client_info/{cid}', [ClientInfoController::class, 'getClientInfo_FILTERED_MBWIN']);
Route::middleware('auth:sanctum')->get('get_cid_mbwin/{cid}', [ClientInfoController::class, 'getCID_MBWIN']);
Route::middleware('auth:sanctum')->get('get_acc_mbwin', [ClientInfoController::class, 'getAcc_MBWIN']);
Route::middleware('auth:sanctum')->get('get_acc_chd_mbwin', [ClientInfoController::class, 'getAcc_Chd_MBWIN']);
Route::middleware('auth:sanctum')->get('get_search_cid_mbwin', [ClientInfoController::class, 'getSearch_CID_MBWIN']);
Route::middleware('auth:sanctum')->get('check_mbwin_client_info', [ClientInfoController::class, 'checkClientInfo_MBWIN']);
Route::middleware('auth:sanctum')->get('mbwin_client_info', [ClientInfoController::class, 'getMBWinClientInfo']);
Route::middleware('auth:sanctum')->get('mbwin_client_cid_lastname', [ClientInfoController::class, 'getClientInfo_search_CIDLastname_MBWIN']);


// PHPMYADMIN API
Route::middleware('auth:sanctum')->get('client_info', [ClientInfoController::class, 'getClientInfo_search_PHPMYADMIN']);
Route::middleware('auth:sanctum')->get('show_client_info/{cid}/{last_name}', [ClientInfoController::class, 'getClientInfo_FILTERED_PHPMYADMIN']);
Route::middleware('auth:sanctum')->get('check_new_db_client_info', [ClientInfoController::class, 'checkClientInfo_PHPMYADMIN']);
Route::middleware('auth:sanctum')->get('client_image/{folderName}/{imageFileName}', [ClientInfoController::class, 'getClientImage']);
Route::middleware('auth:sanctum')->get('suffixes', [ClientInfoRelationController::class, 'getSuffixes']);
Route::middleware('auth:sanctum')->get('types', [ClientInfoRelationController::class, 'getTypes']);
Route::middleware('auth:sanctum')->get('titles', [ClientInfoRelationController::class, 'getTitles']);
Route::middleware('auth:sanctum')->get('genders', [ClientInfoRelationController::class, 'getGenders']);
Route::middleware('auth:sanctum')->get('civil_status', [ClientInfoRelationController::class, 'getCivilStatus']);
Route::middleware('auth:sanctum')->get('institution', [ClientInfoRelationController::class, 'getInstitution']);
Route::middleware('auth:sanctum')->get('entity', [ClientInfoRelationController::class, 'getEntity']);
Route::middleware('auth:sanctum')->get('employment', [ClientInfoRelationController::class, 'getEmployment']);
Route::middleware('auth:sanctum')->get('address_type', [ClientInfoRelationController::class, 'getAddressType']);
Route::middleware('auth:sanctum')->get('relationship', [ClientInfoRelationController::class, 'getRelationship']);
Route::middleware('auth:sanctum')->get('app_type', [ClientInfoRelationController::class, 'getAppTypes']);
Route::middleware('auth:sanctum')->get('product_type', [ClientInfoRelationController::class, 'getProductTypes']);
Route::middleware('auth:sanctum')->get('ownership_type', [ClientInfoRelationController::class, 'getOwnershipTypes']);