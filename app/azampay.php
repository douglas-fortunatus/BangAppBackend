<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class azampay extends Model
{
    use HasFactory;

    protected $fillable = [
	    'response',
	    'message',
	    'user',
	    'password',
	    'clientId',
	    'transactionstatus',
	    'operator',
	    'reference',
	    'externalreference',
	    'utilityref',
	    'amount',
	    'transid',
	    'msisdn',
	    'mnoreference',
	    'submerchantAcc',
	    'user_id',
	    'post_id',
	];
}
