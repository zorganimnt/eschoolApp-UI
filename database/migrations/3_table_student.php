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
        Schema::create('students', function (Blueprint $table) {
            // hedhi relation bin student w user 
            $table->unsignedBigInteger('student_id');
            $table->foreign('student_id')->references('id')->on('users');
            $table->string('student_parent');
            $table->String('student_cin')->unique;
            $table->String('student_name');
            $table->String('student_phone');
            $table->String('student_mail');
            $table->String('student_degree');
            $table->String('student_university');
            $table->String('student_speciality');
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