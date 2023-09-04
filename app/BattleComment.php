<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BattleComment extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'battles_id',
        'body',
    ];
    public function user() {
        return $this->belongsTo(User::class);
    }
}
