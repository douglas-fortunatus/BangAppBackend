<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Image;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;


Route::post('imageadd', function(Request $request){
    $image = new Image;
    $image->caption = $request->caption;
        if ($request->hasFile('image')) {
        
        $path = $request->file('image')->store('images');
        $image->imgurl = $path;
       }
    $image->save();
    return response()->json(['url' => asset($image->url)], 201);

});

Route::post('imagechallengadd', function(Request $request){
    $image = new Image;
    $image->caption = $request->caption;
        if ($request->hasFile('image') && $request->hasFile('image2')) {
        $path = $request->file('image')->store('images');
        $path2 = $request->file('image2')->store('images');
        $image->imgurl = $path;
        $image->challengeImgUrl = $path;
       }
    $image->save();
    return response()->json(['url' => asset($image->url)], 201);

});

Route::get('getAllPosts', function(){

    $baseUrl =env('APP_URL').'storage/app/'; // Your base image URL

    $posts = DB::table('images')->select('id', 'caption', DB::raw("CONCAT('$baseUrl', imgurl) as imgurl"), DB::raw("CONCAT('$baseUrl', challengeImgUrl) as challengeImgUrl"), 'created_at', 'updated_at')->get();
    return response()->json(['posts' => $posts]);
});



Route::group(['prefix' => 'v1'], function () {

    Route::post('/register', 'Api\AuthenticationController@register');
        Route::get('/users/getCurrentUser', 'Api\AuthenticationController@getCurrentUser');

    Route::post('/login', 'Api\AuthenticationController@login')->name('login');
    
    Route::group(['middleware' => ['auth:api']], function () {
        //get user
        Route::get('/users/{user}', 'Api\AuthenticationController@user');
        //profile
        Route::get('/profile', 'Api\ProfilesController@show');
        Route::post('/profile', 'Api\ProfilesController@update');
        //posts
        Route::apiResource('posts', 'Api\PostsController');
        Route::get('/users/{user}/posts', 'Api\PostsController@userPosts');
        Route::post('/posts/{post}/favorite', 'Api\FavoritesController@storePost');
        Route::post('/posts/{post}/un_favorite', 'Api\FavoritesController@destroyPost');
        //comments
        Route::get('/posts/{post}/comments', 'Api\CommentsController@index');
        Route::post('/posts/{post}/comments', 'Api\CommentsController@store');
        Route::put('comments/{comment}', 'Api\CommentsController@update');
        Route::delete('comments/{comment}', 'Api\CommentsController@destroy');
        Route::post('/comments/{comment}/favorite', 'Api\FavoritesController@storeComment');
        Route::post('/comments/{comment}/un_favorite', 'Api\FavoritesController@destroyComment');
        //notifications
        Route::get('/notifications', 'Api\NotificationsController@index');
        Route::post('/notifications/mark_read', 'Api\NotificationsController@markAllAsRead');
        //followers
        Route::post('/follow/{user}', 'Api\FollowersController@follow');
        Route::post('/un_follow/{user}', 'Api\FollowersController@unFollow');
        //categories
        Route::get('categories', 'Api\CategoriesController@index');
    });

    Route::middleware('auth:api')->get('/user', function (Request $request) {
        return $request->user();
    });
});
