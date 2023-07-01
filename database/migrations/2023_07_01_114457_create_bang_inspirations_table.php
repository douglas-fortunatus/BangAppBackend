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
        Schema::create('bang_inspirations', function (Blueprint $table) {
            $table->id();
            $table->string('thumbnail');
            $table->string('tittle');
            $table->string('view_count');
            $table->string('video_url');
            $table->string('creator');
            $table->string('profile_url');
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
        Schema::dropIfExists('bang_inspirations');
    }
};
