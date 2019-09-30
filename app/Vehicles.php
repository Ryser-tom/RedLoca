<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vehicles extends Model
{
    protected $fillable = [
        'idVehicule',
        'immatriculation',
        'marque',
        'model',
        'nbPlace',
        'couleur',
        'image',
        'dateDebutDisponibilite',
        'dateFinDisponibilite',
        'utilisateurs_idUtilisateur',
        'categories_idCategorie'
    ];
}
