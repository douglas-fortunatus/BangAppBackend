<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('azampays', function (Blueprint $table) {
            $table->id();
            $table->text('response')->nullable();
            $table->string('message')->nullable();
            $table->string('user')->nullable();
            $table->string('password')->nullable();
            $table->string('clientId')->nullable();
            $table->string('transactionstatus')->nullable();
            $table->string('operator')->nullable();
            $table->string('reference')->nullable();
            $table->string('externalreference')->nullable();
            $table->string('utilityref')->nullable();
            $table->string('amount')->nullable();
            $table->string('transid')->nullable();
            $table->string('msisdn')->nullable();
            $table->string('mnoreference')->nullable();
            $table->string('submerchantAcc')->nullable();
            $table->foreignId('user_id')->constrained('users');
            $table->foreignId('post_id')->constrained('posts');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('azampays');
    }
};
