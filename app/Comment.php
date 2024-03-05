<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use Favorable;

    protected $guarded = [];
    protected $appends = ['favoriteCount', 'isFavorited','user_image_url','replies_count'];
    protected $with = ['post',];

    public function post() {
        return $this->belongsTo(Post::class);
    }

    public function user() {
        return $this->belongsTo(User::class,'user_id');
    }

    public function getCreatedAtAttribute($value) {
        return (new Carbon($value))->diffForHumans();
    }

    public function getUserImageUrlAttribute()
    {
        $appUrl = "https://bangapp.pro/BangAppBackend/";
        return $appUrl .'storage/app/'.$this->user->image;
    }

    public function getRepliesCountAttribute()
    {
        return CommentReplies::where('comment_id', $this->id)->count();
    }

}
