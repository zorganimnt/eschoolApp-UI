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
        Schema::create('notes', function (Blueprint $table) {
            $table->id();
            $table->String('devoir'); // ds wale examen ....
            $table->String('note');
            $table->String('matiere');
            $table->String('student');
            $table->String('prof'); 
            // foreign key houma li bech yetaawdou mara kahw cplp ken bech naawd nektbhom just chnzid ID_LIST
            // lista fel fac ki tahbet chnouwa yabda fiha? notet w asemy les etudiant ? ahna ma3anech liste keka raw
            // notet (n) , assemi l etudiant (n) o men fouk yabda fama esm matiere (mara kahw), esm l prof (mara kahw), 
            // donc liste_note (#prof, #mat, etudiant, note) oui shyh. kifech nektbouh hedha 
        // bhy ok khaleha haka w ki nzidou lokhryn mbaad taw nhottou relation
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
        Schema::dropIfExists('notes');
    }
};
