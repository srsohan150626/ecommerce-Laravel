<?php

namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\District;
use App\Models\Division;
class DistrictsController extends Controller
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
        $districts=District::orderBy('name','asc')->get();
        return view('backend.pages.districts.index',compact('districts'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      $divisions=Division::orderBy('priority','asc')->get();
      return view('backend.pages.districts.create',compact('divisions'));
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
          'division_id'=>'required',
        ],
        [
          'name.required' => 'Please provides a district name',
          'division_id.required' => 'Please provides a division for the district.',
        ]);

        $district=new District();
        $district->name= $request->name;
        $district->division_id= $request->division_id;
        $district->save();

        session()->flash('success','A new District added Successfully!');
        return redirect()->route('admin.districts');
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
        $divisions=Division::orderBy('priority','asc')->get();
        $district=District::find($id);
        if(!is_null($district)){
          return view('backend.pages.districts.edit',compact('district','divisions'));
        }
        else{
          return redirect()->route('admin.districts');

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
          'division_id'=>'required',
        ],
        [
          'name.required' => 'Please provides a district name',
          'division_id.required' => 'Please provides a division for the district.',
        ]);

     $district=District::find($id);
     $district->name= $request->name;
     $district->division_id= $request->division_id;
     $district->save();
     session()->flash('success','District has updated Successfully!');
     return redirect()->route('admin.districts');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
      $district=District::find($id);
      if (!is_null($district)) {
        $district->delete();
      }
      session()->flash('success','District has deleted successfully!!');
      return back();
    }
}
