<?php

namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Division;
use App\Models\District;
class DivisionsController extends Controller
{
  public function __construct()
  {
      $this->middleware('auth:admin');
  }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $divisions=Division::orderBy('priority','asc')->get();
        return view('backend.pages.divisions.index',compact('divisions'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      return view('backend.pages.divisions.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
         $this->validate($request,[
          'name'=>'required',
          'priority'=>'required',
        ],
        [
          'name.required' => 'Please provides a division name',
          'priority.required' => 'Please provides a division priority',
        ]);

        $division=new Division();
        $division->name= $request->name;
        $division->priority= $request->priority;
        $division->save();

        session()->flash('success','A new Division added Successfully!');
        return redirect()->route('admin.divisions');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Brand $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {

        $division=Division::find($id);
        if(!is_null($division)){
          return view('backend.pages.divisions.edit',compact('division'));
        }
        else{
          return redirect()->route('admin.divisions');

    }
}
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request,[
          'name'=>'required',
          'priority'=>'required',
        ],
        [
          'name.required' => 'Please provides a division name',
          'priority.required' => 'Please provides a division priority',
        ]);

     $division=Division::find($id);
     $division->name= $request->name;
     $division->priority= $request->priority;
     $division->save();
     session()->flash('success','Division has updated Successfully!');
     return redirect()->route('admin.divisions');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
      $division=Division::find($id);
      if (!is_null($division)) {
        //Delete all the districts for this division
        $districts=District::where('division_id',$division->id)->get();
        foreach ($districts as $district) {
           $district->delete();
        }
        $division->delete();
      }
      session()->flash('success','Division has deleted successfully!!');
      return back();
    }
}
