@php
    $date = date('Y-m-d');
@endphp
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{'Add Vehicle'}}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('vehicles.create') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="immatriculation" class="col-md-4 col-form-label text-md-right">{{ __('immatriculation*') }}</label>

                            <div class="col-md-6">
                                <input id="immatriculation" type="text" class="form-control @error('immatriculation') is-invalid @enderror" name="immatriculation" value="{{ old('immatriculation') }}" required autocomplete="immatriculation" autofocus>

                                @error('immatriculation')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                                <label for="brand" class="col-md-4 col-form-label text-md-right">{{ __('Brand*') }}</label>
    
                                <div class="col-md-6">
                                    <input id="brand" type="text" class="form-control @error('brand') is-invalid @enderror" name="brand" value="{{ old('brand') }}" required autocomplete="brand">
    
                                    @error('brand')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                        </div>

                        <div class="form-group row">
                            <label for="model" class="col-md-4 col-form-label text-md-right">{{ __('model*') }}</label>

                            <div class="col-md-6">
                                <input id="model" type="text" class="form-control @error('model') is-invalid @enderror" name="model" value="{{ old('model') }}" required autocomplete="model">

                                @error('model')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="nbPlace" class="col-md-4 col-form-label text-md-right">{{ __('Number of places*') }}</label>

                            <div class="col-md-6">
                                <input id="nbPlace" type="number" class="form-control @error('nbPlace') is-invalid @enderror" name="nbPlace" value="{{ old('nbPlace') }}" required autocomplete="nbPlace">

                                @error('nbPlace')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="color" class="col-md-4 col-form-label text-md-right">{{ __('Color*') }}</label>

                            <div class="col-md-6">
                                <input id="color" type="text" class="form-control" name="color" value="{{ old('color') }}" required autocomplete="color">
                                @error('color')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                                <label for="image" class="col-md-4 col-form-label text-md-right">{{ __('Image of the vehicle*') }}</label>
    
                                <div class="col-md-6">
                                    <input id="image" type="file" class="form-control" name="image" accept="image/png, image/jpeg" value="{{ old('image') }}" required autocomplete="image">
                                    @error('image')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>

                        <div class="form-group row">
                                <label for="dateStartDisponibility" class="col-md-4 col-form-label text-md-right">{{ __('Date start disponibility*') }}</label>
        
                                <div class="col-md-6">
                                    <input id="dateStartDisponibility" type="date" class="form-control" name="dateStartDisponibility" min="{{$date}}" value="{{$date}}" required autocomplete="dateStartDisponibility">
                                    @error('dateStartDisponibility')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>

                        <div class="form-group row">
                            <label for="dateEndDisponibility" class="col-md-4 col-form-label text-md-right">{{ __('Date end disponibility') }}</label>
            
                            <div class="col-md-6">
                                <input id="dateEndDisponibility" type="date" class="form-control" name="dateEndDisponibility" autocomplete="dateEndDisponibility">
                                @error('dateEndDisponibility')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Add vehicle') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
