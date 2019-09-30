<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVehiclesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vehicles', function (Blueprint $table) {
            $table->bigIncrements('idVehicule');
            $table->string('immatriculation');
            $table->string('marque');
            $table->string('model');
            $table->integer('nbPlace');
            $table->string('couleur');
            $table->string('image');
            $table->date('dateDebutDisponibilite');
            $table->date('dateFinDisponibilite');
            $table->integer('utilisateurs_idUtilisateur');
            $table->integer('categories_idCategorie');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vehicles');
    }
}
