<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class bangUpdateComment extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'post_id',
        'body',
    ];
    public function user() {
        return $this->belongsTo(User::class);
    }
}
