<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Image;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Post; 
use App\Challenge;
use App\User;
use FFMpeg\FFMpeg;
use getID3\getID3;
use FFMpeg\Coordinate\Dimension;
use App\BangUpdate;
use App\bangInspiration;
use App\Comment;
use App\DeletedPost;
use App\Hobby;
use App\BattleComment;
use App\bangUpdateComment;
use App\BangBattle;
use App\Notification;
use Illuminate\Validation\Rule;
use App\Http\Controllers\PushNotificationService;
use Illuminate\Support\Facades\DB;

global $appUrl;
$appUrl = "https://bangapp.pro/BangAppBackend/";

Route::get('/users/search', 'App\Http\Controllers\UserController@search');

Route::get('/bang-updatesnew', function (\Illuminate\Http\Request $request) {
    $appUrl = "https://bangapp.pro/BangAppBackend/";
    
    $page = $request->query('_page', 1);
    $limit = $request->query('_limit', 4);
    
      $bangUpdates = BangUpdate::all();
    
    $formattedUpdates = $bangUpdates->getCollection()->map(function ($update) use ($appUrl) {
        $update->filename = $appUrl .'storage/app/bangUpdates/'. $update->filename;
        return $update;
    });
    
    $paginatedResponse = [
        'data' => $formattedUpdates,
        'meta' => [
            'currentPage' => $bangUpdates->currentPage(),
            'perPage' => $bangUpdates->perPage(),
            'totalPages' => $bangUpdates->lastPage(),
            'totalItems' => $bangUpdates->total(),
        ],
    ];

    return response()->json($paginatedResponse);
});

Route::get('/bang-updates', function () {

    $appUrl = "https://bangapp.pro/BangAppBackend/";
    $bangUpdates = BangUpdate::orderBy('created_at', 'desc')
        ->with([
            'bang_update_likes' => function($query) {
                $query->select('post_id', DB::raw('count(*) as like_count'))
                    ->groupBy('post_id');
            },
            'bang_update_comments' => function($query) {
                $query->select('post_id', DB::raw('count(*) as comment_count'))
                    ->groupBy('post_id');
            },])->get();
    $formattedUpdates = $bangUpdates->map(function ($update) use ($appUrl) {
        $update->filename = $appUrl .'storage/app/bangUpdates/'. $update->filename;
        return $update;
    });

    return response()->json($formattedUpdates);
});

Route::get('/bang-updates/{userId}', function ($userId) {

    $appUrl = "https://bangapp.pro/BangAppBackend/";
    
    // Get the bang updates and include like information for the given user
    $bangUpdates = BangUpdate::orderBy('created_at', 'desc')
        ->with([
            'bang_update_likes' => function ($query) use ($userId) {
                $query->select('post_id')->where('user_id', $userId); // Filter likes by user ID
            },
            'bang_update_like_count' => function($query) {
                $query->select('post_id', DB::raw('count(*) as like_count'))
                    ->groupBy('post_id');
            },
            'bang_update_comments' => function ($query) {
                $query->select('post_id', DB::raw('count(*) as comment_count'))
                    ->groupBy('post_id');
            },
        ])
        ->get();

    // Format the updates and add the isLiked variable
    $formattedUpdates = $bangUpdates->map(function ($update) use ($appUrl, $userId) {
        $update->filename = $appUrl .'storage/app/bangUpdates/'. $update->filename;
      
        $update->isLiked = $update->bang_update_likes->isNotEmpty(); // Check if there are likes
        
            
        return $update;
    });

    return response()->json($formattedUpdates);
});


Route::get('/getPostnotNull', function(Request $request) {
    $appUrl = "https://bangapp.pro/BangAppBackend/";

    // Get the _page and _limit parameters from the request query
    $pageNumber = $request->query('_page', 1);
    $numberOfPostsPerRequest = $request->query('_limit', 10);

    // Get the user's ID if available (you can adjust how you get the user's ID based on your authentication system)
    $user_id = $request->input('user_id'); 

    $posts = Post::latest()
	->whereNotNull('image')
        ->with([
            'category' => function($query) {
                $query->select('id', 'name');
            },
            'likes' => function($query) {
                $query->select('post_id', 'like_type', DB::raw('count(*) as like_count'))
                    ->groupBy('post_id', 'like_type');
            },
            'challenges' => function($query) {
                $query->select('*')->where('confirmed', 1);
            }
        ])->paginate($numberOfPostsPerRequest, ['*'], '_page', $pageNumber);

    $filteredPosts = $posts->getCollection()->filter(function($post) use ($appUrl, $user_id) {
        $post->image ? $post->image = $appUrl.'storage/app/'.$post->image : $post->image = null;
        $post->challenge_img ? $post->challenge_img = $appUrl.'storage/app/'.$post->challenge_img : $post->challenge_img = null;
        $post->video ? $post->video = $appUrl.'storage/app/'.$post->video : $post->video = null;
        if ($post->type === 'image' && isset($post->media)) {
            list($post->width, $post->height) = getimagesize($post->media);
        } else {
            list($post->width, $post->height) = [300, 300];
        }
        foreach ($post->challenges as $challenge) {
            $challenge->challenge_img ? $challenge->challenge_img = $appUrl . 'storage/app/' . $challenge->challenge_img : $challenge->challenge_img = null;
        }
        
        // Initialize isLikedA and isLikedB as false
        $post->isLikedA = false;
        $post->isLikedB = false;

        // Retrieve the like counts for both A and B challenge images
        if ($post->likes->isNotEmpty()) {
            foreach ($post->likes as $like) {
                if ($like->like_type === 'A') {
                    $post->isLikedA = true;
                } elseif ($like->like_type === 'B') {
                    $post->isLikedB = true;
                }
            }
        }
        
        // Retrieve the like counts for both A and B challenge images
        $likeCountA = 0;
        $likeCountB = 0;
        if ($post->likes->isNotEmpty()) {
            foreach ($post->likes as $like) {
                if ($like->like_type === 'A') {
                    $likeCountA = $like->like_count;
                } elseif ($like->like_type === 'B') {
                    $likeCountB = $like->like_count;
                }
            }
        }
        $post->like_count_A = $likeCountA;
        $post->like_count_B = $likeCountB;
        $post->isLiked = ($likeCountA > 0 || $likeCountB > 0);
        
        // Filter out posts with NULL images
        return !is_null($post->image);
    });

    return response(['data' => $filteredPosts, 'message' => 'success'], 200);
});



Route::post('imageadd', function(Request $request){
    $image = new Post;
    $image->body = $request->body;
    $image->user_id = $request->user_id;
    $image->pinned = $request->pinned;
    if($request->type){
        $image->type = $request->type;
        // $image->video_height = $request->videoHeight;
    }
    if ($request->hasFile('image')) {
        $path = $request->file('image')->store('images');
        $image->image = $path;
    }
    $image->save();
    return response()->json(['url' => asset($image->url)], 201);
});

Route::post('imagechallengadd', function(Request $request){
    $image = new Post;
    $image->body = $request->body;    
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

Route::post('/addChallenge', function(Request $request){
    $image = new Challenge;
    $image->body = $request->body;    
    $image->user_id = $request->user_id;
    $image->post_id = $request->post_id;
    if ($request->hasFile('image')) {
        $path = $request->file('image')->store('challenges');
        $image->challenge_img = $path;
    }
    $image->save();
    return response()->json(['challengeId' => $image->id], 200);

});

Route::get('/getChallenge/{challengeId}', function($challengeId) {
    $appUrl = "https://bangapp.pro/BangAppBackend/";
    // Retrieve the Challenge model instance by its ID
    $challenge = Challenge::where('id',$challengeId)->with([
        'user' => function ($query) {
            $query->select('id', 'name', 'image');
        }
        ])->first();
    if (!$challenge) {
        return response(['message' => 'Challenge not found'], 404);
    }
    // Perform the necessary transformations
    $challenge->challenge_img = $challenge->challenge_img ? $appUrl . 'storage/app/' . $challenge->challenge_img : null;
    if ($challenge->type === 'image' && isset($challenge->challenge_img)) {
        list($challenge->width, $challenge->height) = getimagesize($challenge->challenge_img);
    }
    // // Retrieve the like count (replace 'likes_count' with your actual column name)
    // $challenge->likes_count = $challenge->likes()->count();
    return response(['data' => $challenge, 'message' => 'success'], 200);
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
    $appUrl = "http://192.168.188.229/social-backend-laravel/";
    $bangInspirations = bangInspiration::all();
    $formattedInspirations = $bangInspirations->map(function ($update) use ($appUrl) {
        $update->profile_url = $appUrl . 'storage/app/bangInspiration/' . $update->profile_url;
        $update->video_url = $appUrl .'storage/app/bangInspiration/'. $update->video_url;
        $update->thumbnail = $appUrl . 'storage/app/bangInspiration/'. $update->thumbnail;
        return $update;
    });

    return response()->json($formattedInspirations);
});

Route::get('/editPost', function(Request $request){
    $post = Post::find($request->id);
    $post->body = $request->caption;
    if ($post->save()) {
        return response(['message' => 'Post edited successfully'], 200);
    }
    else {
        return response(['error' => 'Something went Wrong'], 400);
    }
});

Route::get('/getPosts', function(Request $request) {
    $appUrl = "https://bangapp.pro/BangAppBackend/";

    // Get the _page and _limit parameters from the request query
    $pageNumber = $request->query('_page', 1);
    $numberOfPostsPerRequest = $request->query('_limit', 10);

    $posts = Post::latest()
        ->with([
            'category' => function($query) {
                $query->select('id', 'name');
            },
            'likes' => function($query) {
                $query->select('post_id', 'like_type', DB::raw('count(*) as like_count'))
                    ->groupBy('post_id', 'like_type');
            },
            'challenges' => function($query) {
                $query->select('*')->where('confirmed', 1);
            }
        ])->paginate($numberOfPostsPerRequest, ['*'], '_page', $pageNumber);

    $posts->getCollection()->transform(function($post) use ($appUrl) {
        $post->image ? $post->image = $appUrl.'storage/app/'.$post->image : $post->image = null;
        $post->challenge_img ? $post->challenge_img = $appUrl.'storage/app/'.$post->challenge_img : $post->challenge_img = null;
        $post->video ? $post->video = $appUrl.'storage/app/'.$post->video : $post->video = null;
        if ($post->type === 'image' && isset($post->media)) {
            list($post->width, $post->height) = getimagesize($post->media);
        } else {
            list($post->width, $post->height) = [300, 300];
        }
        foreach ($post->challenges as $challenge) {
            $challenge->challenge_img ? $challenge->challenge_img = $appUrl . 'storage/app/' . $challenge->challenge_img : $challenge->challenge_img = null;
        }

        return $post;
    });

    return response(['data' => $posts, 'message' => 'success'], 200);
});

Route::get('/getPost', function(Request $request) {
    $appUrl = "http://192.168.70.229/social-backend-laravel/";

    // Get the _page and _limit parameters from the request query
    $pageNumber = $request->query('_page', 1);
    $numberOfPostsPerRequest = $request->query('_limit', 10);

    // Get the user's ID if available (you can adjust how you get the user's ID based on your authentication system)
    $user_id = $request->input('user_id'); 

    $posts = Post::latest()
        ->with([
            'category' => function($query) {
                $query->select('id', 'name');
            },
            'likes' => function($query) {
                $query->select('post_id', 'like_type', DB::raw('count(*) as like_count'))
                    ->groupBy('post_id', 'like_type');
            },
            'challenges' => function($query) {
                $query->select('*')->where('confirmed', 1);
            }
        ])->paginate($numberOfPostsPerRequest, ['*'], '_page', $pageNumber);

    $posts->getCollection()->transform(function($post) use ($appUrl, $user_id) {
        $post->image ? $post->image = $appUrl.'storage/app/'.$post->image : $post->image = null;
        $post->challenge_img ? $post->challenge_img = $appUrl.'storage/app/'.$post->challenge_img : $post->challenge_img = null;
        $post->video ? $post->video = $appUrl.'storage/app/'.$post->video : $post->video = null;
        if ($post->type === 'image' && isset($post->media)) {
            list($post->width, $post->height) = getimagesize($post->media);
        } else {
            list($post->width, $post->height) = [300, 300];
        }
        foreach ($post->challenges as $challenge) {
            $challenge->challenge_img ? $challenge->challenge_img = $appUrl . 'storage/app/' . $challenge->challenge_img : $challenge->challenge_img = null;
        }

        $post->isLikedA = false;
        $post->isLikedB = false;
        $post->isLiked = true;
       // Check if the user has liked the post and update isLikedA and isLikedB accordingly
        $likeType = Post::getLikeTypeForUser($user_id, $post->id);
        if ($likeType == "A") {
            $post->isLikedA = true;
            $post->isLiked = true;
        } elseif ($likeType == "B") {
            $post->isLikedB = true;
            $post->isLiked = true;
        }
        
        
        // Retrieve the like counts for both A and B challenge images
        $likeCountA = 0;
        $likeCountB = 0;
        if ($post->likes->isNotEmpty()) {
            foreach ($post->likes as $like) {
                if ($like->like_type === 'A') {
                    $likeCountA = $like->like_count;
                } elseif ($like->like_type === 'B' ) {
                    $likeCountB = $like->like_count;
                }
            }
        }
        $post->like_count_A = $likeCountA;
        $post->like_count_B = $likeCountB;
        
        return $post;
    });

    return response(['data' => $posts, 'message' => 'success'], 200);
});



Route::post('imageaddWithResponse', function(Request $request){
    // Save the image as you are currently doing
    $image = new Post;
    $image->body = $request->body;
    $image->user_id = $request->user_id;
    $image->pinned = $request->pinned;
    if($request->type){
        $image->type = $request->type;
        // $image->video_height = $request->videoHeight;
    }
    if ($request->hasFile('image')) {
        $path = $request->file('image')->store('images');
        $image->image = $path;
    }
    $image->save();

    // Transform the post object to match the structure you return in the first API function
    $image->transform(function($post) use ($appUrl, $user_id) {
        $post->image ? $post->image = $appUrl.'storage/app/'.$post->image : $post->image = null;
        $post->challenge_img ? $post->challenge_img = $appUrl.'storage/app/'.$post->challenge_img : $post->challenge_img = null;
        $post->video ? $post->video = $appUrl.'storage/app/'.$post->video : $post->video = null;
        if ($post->type === 'image' && isset($post->media)) {
            list($post->width, $post->height) = getimagesize($post->media);
        } else {
            list($post->width, $post->height) = [300, 300];
        }
        foreach ($post->challenges as $challenge) {
            $challenge->challenge_img ? $challenge->challenge_img = $appUrl . 'storage/app/' . $challenge->challenge_img : $challenge->challenge_img = null;
        }
        
        // Initialize isLikedA and isLikedB as false
        $post->isLikedA = false;
        $post->isLikedB = false;

        // Retrieve the like counts for both A and B challenge images
        if ($post->likes->isNotEmpty()) {
            foreach ($post->likes as $like) {
                if ($like->like_type === 'A') {
                    $post->isLikedA = true;
                } elseif ($like->like_type === 'B') {
                    $post->isLikedB = true;
                }
            }
        }
        
        // Retrieve the like counts for both A and B challenge images
        $likeCountA = 0;
        $likeCountB = 0;
        if ($post->likes->isNotEmpty()) {
            foreach ($post->likes as $like) {
                if ($like->like_type === 'A') {
                    $likeCountA = $like->like_count;
                } elseif ($like->like_type === 'B') {
                    $likeCountB = $like->like_count;
                }
            }
        }
        $post->like_count_A = $likeCountA;
        $post->like_count_B = $likeCountB;
        $post->isLiked = ($likeCountA > 0 || $likeCountB > 0);
        
        return $post;
    });

    // Return the transformed post object as the response
    return response(['data' => $image, 'message' => 'success'], 201);
});




Route::delete('/deletePost/{id}', function ($id) {
    // Find the post by ID
    $post = Post::findOrFail($id);
    $deletedPostData = $post->toArray();
    unset($deletedPostData['id']);
    DeletedPost::create(['user_id'=>$deletedPostData['user_id'],'body'=>$deletedPostData['user_id'],'type'=>$deletedPostData['type'],'image'=>$deletedPostData['image'],'challenge_img'=>$deletedPostData['challenge_img'],'pinned'=>$deletedPostData['pinned']]);
    // Move associated media files to the recycle bin in the storage folder
    $appUrl = "https://bangapp.pro/BangAppBackend/";
    $deletedFolder = 'recycle_bin';
    $deletedPath = storage_path('app/' . $deletedFolder);
    if($post->type == 'image'){
        if($post->image){
            $imagePath = Str::replaceFirst($appUrl . 'storage/app/', '', $post->image);

            $deletedImageName = basename($imagePath);
            $deletedImagePath = $deletedPath . '/' . $deletedImageName;
            File::move(storage_path('app/' . $imagePath), $deletedImagePath);
        }
        if($post->challenge_img){
            $challengeImagePath = Str::replaceFirst($appUrl . 'storage/app/', '', $post->challenge_img);
            $deletedChallengeImageName = basename($challengeImagePath);
            $deletedChallengeImagePath = $deletedPath . '/' . $deletedChallengeImageName;
            File::move(storage_path('app/' . $challengeImagePath), $deletedChallengeImagePath);
        }
    }
    else{
        $videoPath = Str::replaceFirst($appUrl . 'storage/app/', '', $post->video);
        $deletedVideoName = basename($videoPath);
        $deletedVideoPath = $deletedPath . '/' . $deletedVideoName;
        File::move(storage_path('app/' . $videoPath), $deletedVideoPath);
    }
    $post->delete();
    return response(['message' => 'Post deleted successfully'], 200);
});

Route::post('/likePost', function(Request $request)
{
    $postId = $request->input('post_id');
    $userId = $request->input('user_id');
    $likeType = $request->input('like_type'); // Add this line to get the like_type ('A' or 'B') from the request

    $post = Post::find($postId);
    $user = User::find($userId);

    if (!$post || !$user) {
        return response()->json(['message' => 'Post or user not found'], 404);
    }

    // Check if the user has already liked the post with the given like_type
    $isLiked = $post->likes()->where('user_id', $user->id)->where('like_type', $likeType)->exists();

    if ($isLiked) {
        // User has already liked the post with the same like_type, so unlike it
        $post->likes()->where('user_id', $user->id)->where('like_type', $likeType)->detach();
        $message = 'Post unliked successfully';
    } else {
        // User hasn't liked the post yet, so like it
        // Remove the opposite like if it exists
        $oppositeLikeType = ($likeType === 'A') ? 'B' : 'A';
        $post->likes()->where('user_id', $user->id)->where('like_type', $oppositeLikeType)->detach();

        $post->likes()->attach($user->id, ['like_type' => $likeType]);
        $message = 'Post liked successfully';
    }

    // Get the updated like count for the specific like_type
    $likeCount = $post->likes()->where('like_type', $likeType)->count();

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

Route::post('/storeToken', function(Request $request){
    $user = User::Find($request->user_id);
    $user->device_token = $request->device_token;
    if($user->save()){
        return response()->json(['message' => 'Token stored successfully']);
    }
    else{
        return response()->json(['error' => 'Something went wrong']);
    }
});

Route::post('/sendNotification', function(Request $request)
{
    $user = User::findOrFail($request->user_id);
    $deviceToken = $user->device_token;
    $pushNotificationService = new PushNotificationService();
    $pushNotificationService->sendPushNotification($deviceToken, $request->heading, $request->body,$request->challengeId);
    return response(['message' => 'success'], 200);
});

Route::get('/getMyPosts/{id}', function($id) 
{
    $appUrl = "https://bangapp.pro/BangAppBackend/";
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
    ])->orderBy('created_at', 'desc')->get(); // Corrected 'orderBy' here
    return response()->json(['comments' => $comments]);
});

Route::get('/bangUpdateComment/{id}', function($id){
    $comments = bangUpdateComment::where('post_id', $id)->with([
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

Route::post('/postUpdateComment', function(request $request,Post $post){
    $request->validate([
        'body' => 'string|min:3|max:6000',
    ]);
    $comment = bangUpdateComment::create([
        'user_id' => $request->user_id,
        'post_id' => $request->post_id,
        'body' => $request->body,
    ]);
    $comment = bangUpdateComment::with([
        'user' => function($query) {
            $query->select('id', 'name', 'image');
        },
    ])->findOrFail($comment->id);
    // $post->user->notify(new CommentedOnYourPost($post, auth()->user()));
    return response(['data' => $comment, 'message' => 'success'], 200);
});

Route::post('/acceptChallenge', function(request $request){
    $challenge = Challenge::find($request->post_id);
    $challenge->confirmed = 1;
    if($challenge->save()){
        return response(['data' => $challenge, 'message' => 'success'], 200);
    }
    
});

Route::get('/hobbies', function(request $request){
    $hobbies = Hobby::all('id', 'name');

    return response()->json($hobbies);
});

Route::post('/setUserProfile',function(request $request){

    $user = User::findOrFail($request->user_id);
    // Update the user's profile
    if ($request->hasFile('image')) {
        // Save the profile picture and get its path
        $profilePicturePath = $request->file('profile_picture')->store('profile_pictures', 'public');
        $user->image = $profilePicturePath;
    }

    $user->bio = $request->input('bio');
    $user->username = $request->input('username');
    $user->save();
    return response()->json(['message' => 'Profile updated successfully']);
});

Route::post('/posBattleComment', function(Request $request)
{
    // Validate the incoming request data
    $request->validate([
        'user_id' => 'required|numeric',
        'post_id' => 'required|numeric',
        'body' => 'required|string',
    ]);

    // Create a new comment instance and save it to the database
    $comment = new BattleComment();
    $comment->user_id = $request->input('user_id');
    $comment->post_id = $request->input('post_id');
    $comment->body = $request->input('body');
    $comment->save();

    return response()->json(['message' => 'Comment added successfully', 'data' => $comment], 201);
});

Route::post('/postBattleComment', function(request $request,Post $post){
    $request->validate([
        'body' => 'string|min:3|max:6000',
    ]);
    $comment = BattleComment::create([
        'user_id' => $request->user_id,
        'battles_id' => $request->post_id,
        'body' => $request->body,
    ]);
    $comment = BattleComment::with([
        'user' => function($query) {
            $query->select('id', 'name', 'image');
        },
    ])->findOrFail($comment->id);
    // $post->user->notify(new CommentedOnYourPost($post, auth()->user()));
    return response(['data' => $comment, 'message' => 'success'], 200);
});


Route::get('/bangBattleComment/{id}', function($id){
    $comments = BattleComment::where('battles_id', $id)->with([
            'user' => function($query) {
                $query->select('id', 'name', 'image');
            },
        ])->get();
    return response()->json(['comments' => $comments]);
});


Route::get('/getBangBattle', function (Request $request) {
    $appUrl = "https://bangapp.pro/BangAppBackend/";
    $battles = BangBattle::withCount('likes')->get();

    $battles->transform(function ($battle) use ($appUrl) {
        $battle->battle1 ? $battle->battle1 = $appUrl . 'storage/app/' . $battle->battle1 : $battle->battle1 = null;
        $battle->battle2 ? $battle->battle2 = $appUrl . 'storage/app/' . $battle->battle2 : $battle->battle2 = null;
        return $battle;
    });

    return response()->json(['data' => $battles]);
});

Route::get('/getNotifications/{user_id}', function($user_id){
    // Fetch notifications for the user
    $notifications = Notification::where('user_id', $user_id)->orderByDesc('created_at')->get();

    return response()->json(['notifications' => $notifications]);
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
