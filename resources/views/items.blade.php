@extends('layouts.app')
<?php
/**
 * Author: Tom Ryser
 * Date: 22.05.2018
 * Version : 1.0
 * Title : items
 * Description : Contain all vehicles available from the date that has been choose in the nav.
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

    <title>Liste des véhicules - RedLoca</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
  
  </head>
  <body id="page-top">
   <!-- Navigation -->
    <section id="recentlyAdded" class="bg-light">
      <div class="container">
        <?php
        $i = 0;
        foreach ($vehicles as $key => $value) {
          if($i==0)echo'<div class="row">';
          if($i%3 == 0)echo'</div><div class="row">';
          echo'
              <div class="col-lg-4 col-sm-6 portfolio-item">
                <div class="card h-100">
                  <a href="item.php?vehicleId='.$value['idVehicule'].'&date='.$_GET['search'].'"><img class="card-img-top" src="/img/'.$value['image'].'" alt=""></a>
                  <div class="card-body">
                    <h4 class="card-title">
                      <a href="item.php?vehicleId='.$value['idVehicule'].'&date='.$_GET['search'].'">'.$value['marque'].' '.$value['model'].'</a>
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
          ';$i++;}
        ?>
        </div>
      </div>
      <!-- /.container -->
    </section>
  </body>

</html>
@endsection