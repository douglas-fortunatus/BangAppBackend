<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BangBattle extends Model
{
    use HasFactory;

    public function likes()
    {
        return $this->hasMany(BattleLike::class, 'battle_id');
    }
}
