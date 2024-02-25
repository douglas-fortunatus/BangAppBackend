<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use App\BangUpdateLike;



class BangUpdate extends Model
{
    use HasFactory;
    protected $with = ['user:id,name,image,device_token'];
    protected $appends = ['user_image_url'];

    public function bang_update_likes() {
        return $this->belongsToMany(User::class, 'bang_update_likes', 'post_id', 'user_id');
    }

    public function bang_update_user_likes() {
        return $this->belongsToMany(User::class, 'bang_update_likes', 'post_id', 'user_id');
    }

    public function bang_update_comments() {
        return $this->belongsToMany(User::class, 'bang_update_comments', 'post_id', 'user_id');
    }

     public function bang_update_like_count() {
        return $this->belongsToMany(User::class, 'bang_update_likes', 'post_id', 'user_id');
    }

    public function user() {
        return $this->belongsTo(User::class,'user_id');
    }

    public static function unseenPosts($userId)
    {
        return static::whereDoesntHave('bangUpdateViews', function ($query) use ($userId) {
            $query->where('user_id', $userId);
        });
    }

    public function bangUpdateViews()
    {
        return $this->hasMany(BangUpdateView::class);
    }

    public function getUserImageUrlAttribute()
    {
        $appUrl = "https://bangapp.pro/BangAppBackend/";
        return $appUrl .'storage/app/'.$this->user->image;
    }

    public function getCreatedAtAttribute($value) {
        return (new Carbon($value))->diffForHumans();
    }

    public static function getLikeForUser($userId, $postId)
    {
        return BangUpdateLike::where('user_id', $userId)
            ->where('post_id', $postId)
            ->exists();
    }



}
