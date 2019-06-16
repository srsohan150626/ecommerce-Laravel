<?php

namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Slider;
use Image;
use File;
class SlidersController extends Controller
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
        $sliders=Slider::orderBy('priority','asc')->get();
        return view('backend.pages.sliders.index',compact('sliders'));
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
          'title'=>'required',
          'image'=>'required|image',
          'priority'=>'required',
          'button_link'=>'nullable|url',

        ],
        [
          'title.required' => 'Please provide a Slider title',
          'priority.required' => 'Please provide a Slider priority',
          'image.required' => 'Please provide a Slider Image',
          'image.image' => 'Please provide a valid Slider image',
          'button_link.url' => 'Please provide a valid slider button link'
        ]);

        $slider=new Slider();
        $slider->title= $request->title;
        $slider->button_text= $request->button_text;
        $slider->button_link= $request->button_link;
        $slider->priority= $request->priority;
        if($request->image>0){
          $image=$request->file('image');
          $img=time().'.'.$image->getClientOriginalExtension();
          $location=public_path('images/sliders/'.$img);
          Image::make($image)->save($location);
          $slider->image=$img;
          }
        $slider->save();

        session()->flash('success','A new Slider has  added Successfully!');
        return redirect()->route('admin.sliders');
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
       'title'=>'required',
       'image'=>'nullable|image',
       'priority'=>'required',
       'button_link'=>'nullable|url',

     ],
     [
       'title.required' => 'Please provide a Slider title',
       'priority.required' => 'Please provide a Slider priority',
       'image.image' => 'Please provide a valid Slider image',
       'button_link.url' => 'Please provide a valid slider button link'
     ]);

     $slider=Slider::find($id);
     $slider->title= $request->title;
     $slider->button_text= $request->button_text;
     $slider->button_link= $request->button_link;
     $slider->priority= $request->priority;
     if($request->image>0){
       if (File::exists('images/sliders/'.$slider->image)) {
         File::delete('images/sliders/'.$slider->image);
       }
       $image=$request->file('image');
       $img=time().'.'.$image->getClientOriginalExtension();
       $location=public_path('images/sliders/'.$img);
       Image::make($image)->save($location);
       $slider->image=$img;
       }
     $slider->save();

     session()->flash('success','Slider has Updated Successfully!');
     return redirect()->route('admin.sliders');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
      $slider=Slider::find($id);
      if (!is_null($slider)) {
        if (File::exists('images/sliders/'.$slider->image)) {
          File::delete('images/sliders/'.$slider->image);
        }
        $slider->delete();
      }
      session()->flash('success','Slider has deleted successfully!!');
      return back();
    }
}
