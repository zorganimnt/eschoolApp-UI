<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\StudentController;
use App\Http\Controllers\API\ParentController;
use App\Http\Controllers\API\NoteController;
use App\Http\Controllers\API\ProfController;


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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

/** ---------Register and Login ----------- */
Route::controller(AuthController::class)->group(function () {
    Route::post('register', 'register');
    Route::post('login', 'login');
    Route::post('users', 'login')->name('index');

});

/** -----------Users --------------------- */
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/users', [AuthController::class, 'index'])->name('index');
});

Route::middleware('auth:sanctum')->controller(AuthController::class)->group(function () {
    Route::get('/users', 'index')->name('index');
});



// Student routes
Route::controller(StudentController::class)->group(function () {
    Route::post('getStudents', 'getStudents');
    Route::post('getStudentByCIN', 'getStudentByCIN');


});
// parent routes

Route::controller(ParentController::class)->group(function () {
    Route::post('getParents', 'getParents');
    Route::get('getParentByCIN', 'getParentByCIN');
    Route::post('addChildByCIN', 'addChildByCIN');
    Route::post('deleteChildByCIN', 'deleteChildByCIN');
    Route::post('getChildren', 'getChildren');
    Route::post('getChildByCIN', 'getChildByCIN');


});


// user routes

Route::controller(StudentController::class)->group(function () {
    Route::post('getUsers', 'getUsers');


});


// note routes

Route::controller(NoteController::class)->group(function () {
    Route::get('getNote', 'getNote');
    Route::post('addNote', 'addNote');



});

//prof routes
Route::controller(ProfController::class)->group(function () {
    Route::get('getProf', 'getProf');
    Route::post('addProf', 'addProf');



});

