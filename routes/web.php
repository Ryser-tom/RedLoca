<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('/', function () {
    return redirect()->to("/home")->send();
});

Route::get('/home', 'VehiclesController@showRecent');

Route::get('/items{date?}','VehiclesController@showFrom');

Route::resource('vehicles', 'VehiclesController');

Auth::routes();


