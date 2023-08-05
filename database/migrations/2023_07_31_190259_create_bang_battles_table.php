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
        Schema::create('bang_battles', function (Blueprint $table) {
            $table->id();
            $table->text('body')->nullable();
            $table->enum('type', ['image', 'video']);
            $table->string('battle1')->nullable();
            $table->string('battle2')->nullable();
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
        Schema::dropIfExists('bang_battles');
    }
};
