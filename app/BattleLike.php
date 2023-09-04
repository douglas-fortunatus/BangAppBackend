<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BattleLike extends Model
{
    use HasFactory;
    
    public function battle()
    {
        return $this->belongsTo(BangBattle::class, 'battle_id');
    }
}
