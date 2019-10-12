@extends('layouts.app')
@php
  /**
   * Author: Tom Ryser
   * Date: 22.05.2018
   * Version : 1.0
   * Title : index
   * Description : contain 6 most recent available vehicles.
   */
@endphp
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
    @foreach ($vehicles as $key => $vehicle)
      @if ($key==0)
        <div class="row">
          @endif
          @if ($key%3==0)
        </div>
        <div class="row">
          @endif
          <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="card h-100">
              <a href="item.php?vehicleId={{$vehicle['idVehicule']}}&date={{date("Y-m-d")}}"><img
                {{--used a symlink to access image from the storage/app/public folder--}}
                class="card-img-top" src="{{ asset('storage/'.$vehicle['image']) }}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a
                    href="item.php?vehicleId={{$vehicle['idVehicule']}}">{{$vehicle['marque']}} {{$vehicle['model']}}</a>
                </h4>
                <p class="card-text">
                  places: {{$vehicle['nbPlace']}}
                </p>
                <p class="card-text">
                  couleur: {{$vehicle['couleur']}}
                </p>
                <p class="card-text">
                  catégorie: {{$vehicle['categorie']}}
                </p>
              </div>
            </div>
          </div>
          @if ($key == 5)
            @break
          @endif
          @endforeach
        </div>
  </div>
</section>

</body>

</html>
@endsection


