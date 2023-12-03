<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\BattleLike;
use App\BattleComment;

class BangBattle extends Model
{
    use HasFactory;

    protected $fillable = ['pinned'];

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

    public function battle_comments() {
        return $this->belongsToMany(User::class, 'battle_comments', 'battles_id', 'user_id');
    }

    public static function getCommentCount($battleId){
        $comment_count = BattleComment::where('battles_id', $battleId)->count();
        if ($comment_count){
            return $comment_count;
        }
        return 0;
    }
}
