<?php

namespace App\Http\Controllers;
use App\Vehicles;
use Illuminate\Http\Request;

class VehiclesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $Vehicles=Vehicles::all();
        return view('index', ['vehicles'=>$Vehicles]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('vehicles.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'idVehicule'=>'required',
            'immatriculation'=>'required',
            'marque'=>'required',
            'model'=>'required',
            'nbPlace'=>'required',
            'couleur'=>'required',
            'image'=>'required',
            'dateDebutDisponibilite'=>'required',
            'immatriculation'=>'required',
            'utilisateurs_idUtilisateur'=>'required',
            'categories_idCategorie'=>'required'
        ]);

        $Vehicles = new Vehicles([
            $table->bigIncrements('idVehicule'),
            $table->string('immatriculation'),
            $table->string('marque'),
            $table->string('model'),
            $table->integer('nbPlace'),
            $table->string('couleur'),
            $table->string('image'),
            $table->date('dateDebutDisponibilite'),
            $table->date('dateFinDisponibilite'),
            $table->integer('utilisateurs_idUtilisateur'),
            $table->integer('categories_idCategorie')
        ]);
        $Vehicles->save();
        return redirect('/Vehicles')->with('success', 'Vehicles saved!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Display the specified number of resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function showRecent(){
        $vehicles = Vehicles::where('dateDebutDisponibilite', '<=', date('Y-m-d'))
            ->where(function($q) {
                $q->where('dateFinDisponibilite', '>', date('Y-m-d'))
                ->orWhere('dateFinDisponibilite','=', NULL);
            }) 
        ->get();

        return view('index', compact('vehicles'));
    }

    public function showFrom(){
        $Vehicles = Vehicles::where('dateDebutDisponibilite', '<=', $_GET["search"])
            ->where(function($q){
                $q->where('dateFinDisponibilite', '>', $_GET["search"])
                ->orWhere('dateFinDisponibilite','=', NULL);
            })
        ->get();
        //return ['vehicles'=>$Vehicles];
        return view('items', ['vehicles'=>$Vehicles]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
