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

    protected $appends = ['user_image_url'];


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function getUserImageUrlAttribute()
    {
        $appUrl = "https://bangapp.pro/BangAppBackend/";
        return $appUrl .'storage/app/'.$this->user->image;
    }
}
