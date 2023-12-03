<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Challenge extends Model
{
    use HasFactory;

    protected $fillable = 
    	[
			'id'  // replace with appropriate values
	        'post_id', 
	        'user_id',
	        'challenge_img',  // replace with appropriate values
	        'body', // replace with appropriate values
	        'type',
	        'confirmed'
	    ];

    public function post(){
        return $this->belongsTo(Post::class, 'post_id');
    }

    public function user() {
        return $this->belongsTo(User::class,'user_id');
    }


}
