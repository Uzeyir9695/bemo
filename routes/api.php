<?php

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
Route::post('/auth/register', [\App\Http\Controllers\Api\AuthController::class, 'register'])->name('register');
Route::post('/auth/login', [\App\Http\Controllers\Api\AuthController::class, 'login'])->name('login');
Route::post('/auth/logout', [\App\Http\Controllers\Api\AuthController::class, 'logout'])->name('logout');

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    $user =  auth('sanctum')->user();
    return $user;
});
Route::middleware('auth:sanctum')->group(function () {
    Route::get('list-cards', [\App\Http\Controllers\CardController::class, 'filterCard'])->name('list-cards');
});
Route::apiResource('card', \App\Http\Controllers\CardController::class);
Route::apiResource('column', \App\Http\Controllers\ColumnController::class);
Route::patch('drag-card/{id}', [\App\Http\Controllers\CardController::class, 'dragCard'])->name('drag-card');
Route::patch('update-card-position', [\App\Http\Controllers\CardController::class, 'updateCardPosition'])->name('update-card-position');
Route::get('export-sql', [\App\Http\Controllers\ExportSQLController::class, 'exportSQL'])->name('export-sql');
