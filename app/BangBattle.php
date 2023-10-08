<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\BattleLike;

class BangBattle extends Model
{
    use HasFactory;

    public function likes()
    {
        return $this->hasMany(BattleLike::class, 'battle_id');
    }

    public static function getLikeTypeForUser($userId, $battleId)
    {
        $like = BattleLike::where('user_id', $userId)
            ->where('battle_id', $battleId)
            ->first();

        if ($like) {
            return $like->like_type;
        }

        return null;
    }
}
