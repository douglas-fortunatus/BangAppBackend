<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Challenge extends Model
{
    use HasFactory;

    protected $fillable = 
    	[
			'id',  
	        'post_id', 
	        'user_id',
	        'challenge_img', 
	        'body',
	        'type',
	        'confirmed',
	        'created_at',
	        'updated_at'
	    ];

    public function post(){
        return $this->belongsTo(Post::class, 'post_id');
    }

    public function user() {
        return $this->belongsTo(User::class,'user_id');
    }


}
