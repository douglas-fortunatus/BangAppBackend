<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CommentReplies extends Model
{
    use Favorable;

    protected $fillable = [
        'user_id', 'comment_id','body',
    ];
    protected $with = ['comment'];

    public function comment()
    {
        return $this->belongsTo(Comment::class,'comment_id');
    }

}
