<?php

namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Brand;

use Image;
use File;
class BrandsController extends Controller
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
        $brands=Brand::orderBy('id','desc')->get();
        return view('backend.pages.brands.index',compact('brands'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      return view('backend.pages.brands.create');
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
          'image'=>'nullable|image',
        ]);

        $brand=new Brand();
        $brand->name= $request->name;
        $brand->description= $request->description;

        //inser image image also
        if(count($request->image)>0){
          $image=$request->file('image');
            $img=time().'.'.$image->getClientOriginalExtension();
            $location=public_path('images/brands/'.$img);
            Image::make($image)->save($location);
          $brand->image=$img;
            }
        $brand->save();

        session()->flash('success','A new Brand added Successfully!');
        return redirect()->route('admin.brands');
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

        $brand=Brand::find($id);
        if(!is_null($brand)){
          return view('backend.pages.brands.edit',compact('brand'));
        }
        else{
          return redirect()->route('admin.brands');

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
       'image'=>'nullable|image',
     ]);

     $brand=Brand::find($id);
     $brand->name= $request->name;
     $brand->description= $request->description;

     //inser image image also
     if(count($request->image)>0){
       if(File::exists('images/brands'.$brand->image)){
         File::delete('images/brands'.$brand->image);
       }
       $image=$request->file('image');
       $img=time().'.'.$image->getClientOriginalExtension();
       $location=public_path('images/brands/'.$img);
       Image::make($image)->save($location);
       $brand->image=$img;
       }
       $brand->save();
     session()->flash('success','Brand has updated Successfully!');
     return redirect()->route('admin.brands');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
      $brand=Brand::find($id);
      if (!is_null($brand)) {
        //delete brand of this category
        if(File::exists('images/brands'.$brand->image)){
          File::delete('images/brands'.$brand->image);
        }
        $brand->delete();
      }
      session()->flash('success','Brand has deleted successfully!!');
      return back();
    }
}
