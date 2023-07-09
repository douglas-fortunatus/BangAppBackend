<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Image;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Post; 
use App\User;
use FFMpeg\FFMpeg;
use getID3\getID3;
use FFMpeg\Coordinate\Dimension;
use App\BangUpdate;
use App\bangInspiration;
use App\Comment;



global $appUrl;
$appUrl = "http://192.168.0.229/social-backend-laravel/";


Route::get('/bang-updates', function () {
    $appUrl = "http://192.168.52.229/social-backend-laravel/";
    $bangUpdates = BangUpdate::with([
        'bang_update_likes' => function($query) {
            $query->select('post_id', DB::raw('count(*) as like_count'))
                ->groupBy('post_id');
        }])->paginate(10);
    $formattedUpdates = $bangUpdates->map(function ($update) use ($appUrl) {
        $update->filename = $appUrl .'storage/app/bangUpdates/'. $update->filename;
        return $update;
    });

    return response()->json($formattedUpdates);
});

Route::post('imageadd', function(Request $request){
    $image = new Post;
    $image->body = $request->caption;
    $image->user_id = $request->user_id;
        if ($request->hasFile('image')) {
        
        $path = $request->file('image')->store('images');
        $image->image = $path;
       }
    $image->save();
    return response()->json(['url' => asset($image->url)], 201);

});

Route::post('imagechallengadd', function(Request $request){
    $image = new Post;
    $image->body = $request->caption;    
    $image->user_id = $request->user_id;

        if ($request->hasFile('image') && $request->hasFile('image2')) {
        $path = $request->file('image')->store('images');
        $path2 = $request->file('image2')->store('images');
        $image->image = $path;
        $image->challenge_img = $path2;
       }
    $image->save();
    return response()->json(['url' => asset($image->url)], 201);

});

Route::get('/userr', function () {
    $user = auth()->user();
    return response()->json($user);
})->middleware('jwt.auth');


Route::get('/comments', function(Post $post){
    $comments = $post->comments()->with([
        'user' => function($query) {
            $query->select('id', 'name', 'image');
        },
    ])->paginate(10);
    return response(['data' => $comments, 'message' => 'success'], 200);
});


Route::get('/get/bangInspirations',function(){
    $appUrl = "http://192.168.0.229/social-backend-laravel/";
    $bangInspirations = bangInspiration::all();
    $formattedInspirations = $bangInspirations->map(function ($update) use ($appUrl) {
        $update->profile_url = $appUrl . 'storage/app/bangInspiration/' . $update->profile_url;
        $update->video_url = $appUrl .'storage/app/bangInspiration/'. $update->video_url;
        $update->thumbnail = $appUrl . 'storage/app/bangInspiration/'. $update->thumbnail;
        return $update;
    });

    return response()->json($formattedInspirations);
});


Route::get('/getPosts', function() {
    $appUrl = "http://192.168.52.229/social-backend-laravel/";
    $posts = Post::latest()
        ->with([
            'category' => function($query) {
                $query->select('id', 'name');
            },
            'likes' => function($query) {
                $query->select('post_id', DB::raw('count(*) as like_count'))
                    ->groupBy('post_id');
            }
        ])->paginate(10);
    $posts->getCollection()->transform(function($post) use ($appUrl) {
    $post->image  ? $post->image = $appUrl.'storage/app/'.$post->image : $post->image = null;
    $post->challenge_img ? $post->challenge_img = $appUrl.'storage/app/'.$post->challenge_img : $post->challenge_img = null;
    $post->video ? $post->video = $appUrl.'storage/app/'.$post->video : $post->video = null;
    if ($post->type === 'image' && isset($post->media)) {
        list($post->width, $post->height) = getimagesize($post->media);
    }
    else{
        list($post->width, $post->height) = [300,300];
    }
    // Retrieve the like count
    $likeCount = 0;
    if ($post->likes->isNotEmpty()) {
        $likeCount = $post->likes[0]->like_count;
    }
        return $post;
        
    });

    return response(['data' => $posts, 'message' => 'success'], 200);
});

function checkFileType($filePath)
{
    if (Storage::exists($filePath)) {
        // Get the file's MIME type
        $mimeType = Storage::mimeType($filePath);

        // Define the MIME types for images and videos
        $imageMimeTypes = [
            'image/jpeg',
            'image/png',
            'image/gif',
        ];

        $videoMimeTypes = [
            'video/mp4',
            'video/mpeg',
            'video/quicktime',
        ];

        // Check if the file is an image
        if (in_array($mimeType, $imageMimeTypes)) {
            // File is an image
            return 'Image';
        }
        
        // Check if the file is a video
        if (in_array($mimeType, $videoMimeTypes)) {
            // File is a video
            return 'Video';
        }
        
        // File is neither an image nor a video
        return 'Unknown file type';
    }
    // File does not exist
    return 'File not found';
}

function getVideoDimensions($filePath)
{
    // Create a new instance of getID3
    $getID3 = new getID3;

    // Analyze the video file
    $fileInfo = $getID3->analyze($filePath);

    // Retrieve the video dimensions
    $width = $fileInfo['video']['resolution_x'];
    $height = $fileInfo['video']['resolution_y'];

    return [$width, $height];
}

function getVideo($filename)
{
    $filePath = 'path/to/videos/' . $filename;

    if (Storage::exists($filePath)) {
        $fileContents = Storage::get($filePath);

        $response = response($fileContents, 200)
            ->header('Content-Type', 'video/mp4')
            ->header('Content-Disposition', 'inline; filename="' . $filename . '"');

        return $response;
    }

    // Video file not found
    abort(404);
}

Route::post('/likePost', function(Request $request)
{
    $postId = $request->input('post_id');
    $userId = $request->input('user_id');
    $post = Post::find($postId);
    $user = User::find($userId);
    if (!$post || !$user) {
        return response()->json(['message' => 'Post or user not found'], 404);
    }
    // Check if the user has already liked the post
    $isLiked = $post->likes()->where('user_id', $user->id)->exists();
    if ($isLiked) {
        // User has already liked the post, so unlike it
        $post->likes()->detach($user->id);
        $message = 'Post unliked successfully';
    } else {
        // User hasn't liked the post yet, so like it
        $post->likes()->attach($user->id);
        $message = 'Post liked successfully';
    }
    // Get the updated like count
    $likeCount = $post->likes()->count();

    return response()->json(['message' => $message, 'likeCount' => $likeCount]);
});

Route::post('/likeBangUpdate', function(Request $request)
{
    $postId = $request->input('post_id');
    $userId = $request->input('user_id');
    $likeBangUpdate = BangUpdate::find($postId);
    $user = User::find($userId);
    if (!$likeBangUpdate || !$user) {
        return response()->json(['message' => 'Post or user not found'], 404);
    }
    $isLiked = $likeBangUpdate->bang_update_likes()->where('user_id', $user->id)->exists();
    if ($isLiked) {
        // User has already liked the post, so unlike it
        $likeBangUpdate->bang_update_likes()->detach($user->id);
        $message = 'Post unliked successfully';
    } else {
        // User hasn't liked the post yet, so like it
        $likeBangUpdate->bang_update_likes()->attach($user->id);
        $message = 'Post liked successfully';
    }
    // Get the updated like count
    $likeCount = $likeBangUpdate->bang_update_likes()->count();

    return response()->json(['message' => $message, 'likeCount' => $likeCount]);
});


Route::get('/getMyPosts/{id}', function($id) 
    {
        $appUrl = "http://192.168.52.229/social-backend-laravel/";
        $posts = Post::where('user_id', $id)->with([
            'user' => function ($query) {
                $query->select('id', 'name', 'image');
            },
            'likes' => function($query) {
                $query->select('post_id', DB::raw('count(*) as like_count'))
                    ->groupBy('post_id');
            },
        ])->paginate(10);
        $posts->getCollection()->transform(function($post) use ($appUrl) {
            $post->image  ? $post->image = $appUrl.'storage/app/'.$post->image : $post->image = null;
            $post->challenge_img ? $post->challenge_img = $appUrl.'storage/app/'.$post->challenge_img : $post->challenge_img = null;
            $post->video ? $post->video = $appUrl.'storage/app/'.$post->video : $post->video = null;
            if ($post->type === 'image' && isset($post->media)) {
                list($post->width, $post->height) = getimagesize($post->media);
            }
            else{
                list($post->width, $post->height) = [300,300];
            }
            // Retrieve the like count
            $likeCount = 0;
            if ($post->likes->isNotEmpty()) {
                $likeCount = $post->likes[0]->like_count;
            }
            return $post;
        });

        return response(['data' => $posts, 'message' => 'success'], 200);
    });

Route::get('/getComments/{id}', function($id){
    $comments = Comment::where('post_id', $id)->with([
            'user' => function($query) {
                $query->select('id', 'name', 'image');
            },
        ])->get();
    return response()->json(['comments' => $comments]);
});

Route::post('/postComment', function(request $request,Post $post){
    $request->validate([
        'body' => 'string|min:3|max:6000',
    ]);
    $comment = Comment::create([
        'user_id' => $request->user_id,
        'post_id' => $request->post_id,
        'body' => $request->body,
    ]);
    $comment = Comment::with([
        'user' => function($query) {
            $query->select('id', 'name', 'image');
        },
    ])->findOrFail($comment->id);
    // $post->user->notify(new CommentedOnYourPost($post, auth()->user()));
    return response(['data' => $comment, 'message' => 'success'], 200);
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
