<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use App\Like;
use App\Comment;

class Post extends Model
{
    use Favorable;
    protected $appends = ['favoriteCount', 'isFavorited', 'commentCount'];
    protected $casts = ['isFavorited' => 'boolean'];
    protected $with = ['user:id,name,image,device_token', 'category:id,name'];
    protected $guarded = [];

    public function comments() {
        return $this->hasMany(Comment::class)->latest();
    }

    public function user() {
        return $this->belongsTo(User::class,'user_id');
    }

    public function category() {
        return $this->belongsTo(Category::class);
    }

    public function getCommentCountAttribute() {
        return $this->comments()->count();
    }

    public function getCreatedAtAttribute($value) {
        return (new Carbon($value))->diffForHumans();
    }

    public function likes() {
        return $this->belongsToMany(User::class, 'likes', 'post_id', 'user_id');
    }

    public function like() {
        return $this->belongsToMany(Like::class, 'likes', 'post_id', 'user_id');
    }

    public function challenges(){
        return $this->hasMany(Challenge::class, 'post_id');
    }

    public static function getLikeTypeForUser($userId, $postId)
    {
        $like = Like::where('user_id', $userId)
            ->where('post_id', $postId)
            ->first();

        if ($like) {
            return $like->like_type;
        }

        return null;
    }

    public static function getCommentCount($postId)
    {
        $commentCount = Comment::where('post_id',$postId)->count();
        if ($commentCount){
            return $commentCount;
        }
        return 0;
    }

    public static function updateIsSeen($postId)
    {
        $post = Post::find($postId);
        if($post){
            $post->update(['is_seen' => 1]);
            return true;
        }
        return false;
    }

    public function unseenPosts($userId)
    {
        return $this->whereDoesntHave('postViews', function ($query) use ($userId) {
            $query->where('user_id', $userId);
        });
    }

    public function postViews()
    {
        return $this->hasMany(PostView::class);
    }


}
