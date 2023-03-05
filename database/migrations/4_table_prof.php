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
        Schema::create('Prof', function (Blueprint $table) {
            $table->foreign('prof_id');
            $table->String('prof_cin');
            $table->String('prof_name');
            $table->String('prof_phone');
            $table->String('prof_mail');
            $table->String('prof_passwword');
            $table->String('prof_matiere');
            $table->String('prof_classe');
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
        Schema::dropIfExists('Profs');
    }
};