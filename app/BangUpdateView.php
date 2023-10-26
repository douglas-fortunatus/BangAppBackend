<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BangUpdateView extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id', 'bang_update_id',
    ];
}
