<?php

namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Category;

use Image;
use File;
class CategoriesController extends Controller
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
        $categories=Category::orderBy('id','desc')->get();
        return view('backend.pages.categories.index',compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
      $maincategories=Category::orderBy('name','desc')->where('parent_id',NULL)->get();
      return view('backend.pages.categories.create',compact('maincategories'));
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

        $category=new Category();
        $category->name= $request->name;
        $category->description= $request->description;
        $category->parent_id= $request->parent_id;
        //insert image image also
        if($request->image>0){
      	  $image=$request->file('image');
      		$img=time().'.'.$image->getClientOriginalExtension();
      	 	$location=public_path('images/categories/'.$img);
      	 	Image::make($image)->save($location);
          $category->image=$img;
      		}
        $category->save();

        session()->flash('success','A new Category added Successfully!');
        return redirect()->route('admin.categories');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
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
        $maincategories=Category::orderBy('name','desc')->where('parent_id',NULL)->get();
        $category=Category::find($id);
        if(!is_null($category)){
          return view('backend.pages.categories.edit',compact('category','maincategories'));
        }
        else{
          return redirect()->route('admin.categories');
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

     $category=Category::find($id);
     $category->name= $request->name;
     $category->description= $request->description;
     $category->parent_id= $request->parent_id;
     //inser image image also
     if($request->image>0){
       if(File::exists('images/categories'.$category->image)){
         File::delete('images/categories'.$category->image);
       }
       $image=$request->file('image');
       $img=time().'.'.$image->getClientOriginalExtension();
       $location=public_path('images/categories/'.$img);
       Image::make($image)->save($location);
       $category->image=$img;
       }
     $category->save();

     session()->flash('success','Category has updated Successfully!');
     return redirect()->route('admin.categories');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
      $category=Category::find($id);
      if (!is_null($category)) {
        //if it is a parent category then delete all of its sub category
        if($category->parent_id==NULL){
            $subcategories=Category::orderBy('name','desc')->where('parent_id',$category->id)->get();

            foreach ($subcategories as $sub) {
              if(File::exists('images/categories'.$sub->image)){
                File::delete('images/categories'.$sub->image);
              }
              $sub->delete();
            }
        }
        //delete image of this category
        if(File::exists('images/categories'.$category->image)){
          File::delete('images/categories'.$category->image);
        }
        $category->delete();
      }
      session()->flash('success','Category has deleted successfully!!');
      return back();
    }
}
