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
        Schema::table('messages', function (Blueprint $table) {
            $table->string('message_type')->nullable();
            $table->string('attachment')->nullable();
            $table->string('message_status')->default('sent');
            $table->boolean('is_read')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {


        Schema::table('messages', function (Blueprint $table) {
            $table->dropColumn('is_read');
            $table->dropColumn('message_type');
            $table->dropColumn('attachment');
            $table->dropColumn('message_status');
        });
    }
};
