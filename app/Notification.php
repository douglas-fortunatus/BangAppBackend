<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;

    protected $fillable = [
        'is_read',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'reference_id');
    }
}
