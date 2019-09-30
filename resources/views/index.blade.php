@extends('layouts.app')
<?php
/**
 * Author: Tom Ryser
 * Date: 22.05.2018
 * Version : 1.0
 * Title : index
 * Description : contain 6 most recent available vehicles.
 */
?>
@section('content')
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="RedLoca">
    <meta name="author" content="Tom Ryser">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Accueil - RedLoca</title>
      <!-- Fonts -->
      <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
      <style>
          footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: red;
            color: white;
            text-align: center;
          }
          </style>
  </head>
  <body id="page-top">
  <!-- Navigation -->
  <section id="recentlyAdded" class="bg-light">
    <div class="container">
    <?php
      if(isset($_GET['result'])){
        if($_GET['result'] == "true"){
          echo'<div class="alert alert-success">Votre location as été enregistrée.</div>';
        }else{
          echo'<div class="alert alert-warning">une erreur est survenue.</div>';
        }
      }

      $i = 0;
      foreach ($vehicles as $key => $value) {
        if($i==0)echo'<div class="row">';
        if($i%3 == 0)echo'</div><div class="row">';
        echo'
            <div class="col-lg-4 col-sm-6 portfolio-item">
              <div class="card h-100">
                <a href="item.php?vehicleId='.$value['idVehicule'].'&date='.date("Y-m-d").'"><img class="card-img-top" src="/img/'.$value['image'].'" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="item.php?vehicleId='.$value['idVehicule'].'">'.$value['marque'].' '.$value['model'].'</a>
                  </h4>
                  <p class="card-text">
                    places: '.$value['nbPlace'].'
                  </p>
                  <p class="card-text">
                    couleur: '.$value['couleur'].'
                  </p>
                  <p class="card-text">
                    catégorie: '.$value['categorie'].'
                  </p>
                </div>
              </div>
            </div>
        ';$i++;
        if($i==6)break;
      }
      ?>
      </div>
  </section>
  
  </body>

</html>
@endsection


