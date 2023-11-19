<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Like extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 'post_id','like_type',
    ];

    public function user()
	{
    	return $this->belongsTo(User::class);
	}
}
