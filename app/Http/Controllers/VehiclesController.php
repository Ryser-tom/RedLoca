<?php

namespace App\Http\Controllers;
use App\Vehicles;
use Illuminate\Http\Request;
use mysql_xdevapi\Exception;
use Symfony\Component\HttpFoundation\ParameterBag;

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
            'immatriculation'=>'required',
            'brand'=>'required',
            'model'=>'required',
            'nbPlace'=>'required',
            'color'=>'required',
            'image'=>'required',
            'dateStartDisponibility'=>'required',
            'users_idUser'=>'required'//,
            //'categories_idCategorie'=>'required'
        ]);

        $path = $request->file('image')->store('image');

        $Vehicle = new Vehicles();
        $Vehicle->immatriculation = request('immatriculation');
        $Vehicle->brand = request('brand');
        $Vehicle->model = request('model');
        $Vehicle->nbPlace = request('nbPlace');
        $Vehicle->color = request('color');
        $Vehicle->image = $path;
        $Vehicle->dateStartDisponibility = request('dateStartDisponibility');
        $Vehicle->dateEndDisponibility = request('dateEndDisponibility');
        $Vehicle->users_idUser = request('users_idUser');

        $Vehicle->save();

        return redirect('/home')->with('success', 'Vehicles saved!');
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
        $vehicles = Vehicles::where('dateStartDisponibility', '<=', date('Y-m-d'))
            ->where(function($q) {
                $q->where('dateEndDisponibility', '>', date('Y-m-d'))
                ->orWhere('dateEndDisponibility','=', NULL);
            })
            /*TODO Relation with categories*/

        ->get();

        return view('index', compact('vehicles'));
    }

    public function showFrom(){
        $Vehicles = Vehicles::where('dateStartDisponibility', '<=', $_GET["search"])
            ->where(function($q){
                $q->where('dateEndDisponibility', '>', $_GET["search"])
                ->orWhere('dateEndDisponibility','=', NULL);
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
