<?php
namespace App;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;

    protected $fillable = [
        'is_read',
    ];

    protected $appends = ['user_image_url','post_image_url','post_thumbnail_url', 'post_type'];


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function getUserImageUrlAttribute()
    {
        $appUrl = "https://bangapp.pro/BangAppBackend/";
        return $appUrl .'storage/app/'.$this->user->image;
    }

    public function post()
    {
        return $this->belongsTo(Post::class, 'post_id');
    }

    public function getPostImageUrlAttribute()
    {
        $appUrl = "https://bangapp.pro/BangAppBackend/";
        if($this->post)
        {
            return $appUrl .'storage/app/'.$this->post->image;
        }
        return '';
    }

    public function getPostThumbnailUrlAttribute()
    {
        if($this->post)
        {
            return $this->post->thumbnail_url;
        }
    }

    public function getPostTypeAttribute()
    {
        if($this->post)
        {
            return $this->post->type;
        }
    }


}
