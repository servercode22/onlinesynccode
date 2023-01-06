<?php

use App\Http\Controllers\OnlineApiSync;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('sync-api', function () {
    return "Hello";
});

Route::post('sync-start-time', 'OnlineApiSync@syncStartTime');
Route::post('sync-end-time', 'OnlineApiSync@syncEndTime');
Route::post('sales-upload', 'OnlineApiSync@salesUpload');


// Get Suppliers
Route::get('get-suppliers', 'OnlineApiSync@get_suppliers');

// GET variation records for sale sync
Route::post('get-vld-records', 'OnlineApiSync@getVldRecords');
Route::post('update-vld-records', 'OnlineApiSync@updateVldRecords');
Route::post('update-purchase-line-vld', 'OnlineApiSync@updatePurchaseLineVLD');
Route::get('get-latest-plines', 'OnlineApiSync@latestPlines');
Route::get('transactions-records-4-pline', 'OnlineApiSync@transactionsRecords4Pline');
Route::post('sale-tables', 'OnlineApiSync@saleTables');
Route::post('sale-stock-tables', 'OnlineApiSync@saleStockTables');
Route::get('delete-sale', 'OnlineApiSync@destroySale');
