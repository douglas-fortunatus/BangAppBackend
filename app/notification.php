<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;

    public function user() {
        return $this->belongsTo(User::class, 'reference_id');
    }

    public static function updateIsRead($id){
    	$record = static::find($id);
    	if($record){
    		$record->update(['is_read' => 1 ]);
    		return true;
    	}
    	return false;
    }

}
