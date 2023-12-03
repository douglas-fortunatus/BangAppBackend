<?php

use App\Category;
use App\Post;
use Illuminate\Support\Facades\Route;

Auth::routes();

// Route::get('/login', function() {
//     return response(['message' => 'Please login first'], 403);
// })->name('login');
Route::post('/posts', 'Api\PostsController@store')->name('store');
Route::delete('/posts/{post}', 'Api\PostsController@destroy')->name('destroy');
Route::get('/users', 'Api\ProfilesController@index');
Route::get('/users/{user}', 'Api\ProfilesController@edit')->name('users.edit');
Route::put('/users/{user}', 'Api\ProfilesController@update')->name('users.update');

Route::get('/', function () {

    return view('welcome');
})->name('welcome');

Route::post('/post/bang/updates', [App\Http\Controllers\HomeController::class, 'postBangUpdates'])->name('postBangUpdates');

Route::any('/post/bang/inspiration', [App\Http\Controllers\HomeController::class, 'postBangInspiration'])->name('postBangInspiration');

Route::post('/post/bang/battle', [App\Http\Controllers\HomeController::class, 'postBangBattle'])->name('postBangBattle');


Route::post('/post/bang/thumbnail', [App\Http\Controllers\HomeController::class, 'postBangThumbnail'])->name('postBangThumbnail');


Route::get('/bangInspirationWeb', [App\Http\Controllers\HomeController::class, 'bangInspiration'])->name('bangInspirationWeb');


Route::get('/bangBattleWeb', [App\Http\Controllers\HomeController::class, 'bangBattleWeb'])->name('bangBattleWeb');

Route::get('/pinBattle/{id}', [App\Http\Controllers\HomeController::class, 'bangBattlePin'])->name('pin_bang_battle');

Route::get('/delete_bang_battle/{id}', [App\Http\Controllers\HomeController::class, 'deleteBangBattle'])->name('delete_bang_battle');


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
