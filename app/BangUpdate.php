<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BangUpdate extends Model
{
    use HasFactory;

    public function bang_update_likes() {
        return $this->belongsToMany(User::class, 'bang_update_likes', 'post_id', 'user_id');
    }
}
