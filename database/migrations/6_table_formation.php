<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('formations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('formation_formateur');
            $table->foreign('formation_formateur')->references('id')->on('users')->onDelete('cascade');
            $table->string('formation_title'); 
            $table->double('formation_price'); 
            $table->string('formation_category'); 
            $table->string('formation_duree');
            $table->string('formation_picture');
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
        Schema::dropIfExists('students');
    }
};