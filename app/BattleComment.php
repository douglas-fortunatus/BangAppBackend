<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BattleComment extends Model
{
    use HasFactory;
    
    protected $appends = ['user_image_url'];

    protected $fillable = [
        'user_id',
        'battles_id',
        'body',
    ];
    public function user() {
        return $this->belongsTo(User::class,'user_id');
    }

    public function getUserImageUrlAttribute()
    {
        $appUrl = "https://bangapp.pro/BangAppBackend/";
        return $appUrl .'storage/app/'.$this->user->image;
    }
}
