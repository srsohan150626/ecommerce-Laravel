@extends('backend.layouts.master')

@section('content')
  <div class="main-panel">
    <div class="content-wrapper">

      <div class="card">
        <div class="card-header">
          Edit brand
        </div>
        <div class="card-body">
          <form action="{{ route('admin.brand.update',$brand->id) }}" method="post" enctype="multipart/form-data">
            {{ csrf_field() }}
            @include('backend.partials.messages')
            <div class="form-group">
              <label for="name">Name</label>
              <input type="text" class="form-control" name="name" id="name" value="{{ $brand->name }}">
            </div>
            <div class="form-group">
              <label for="description">Description(Optional)</label>
              <textarea name="description" rows="8" cols="80" class="form-control">
                  {!! $brand->description !!}
              </textarea>
            </div>
       
            <div class="form-group">
              <label for="oldimage">Old brand Image</label><br>
                <img src="{!!asset('images/brands/'.$brand->image)!!}" width="100"><br>
              <label for="image">brand new Image(Optional)</label>
                  <input type="file" class="form-control" name="image" id="image">
            </div>
            <button type="submit" class="btn btn-success"> Update</button>
          </form>
        </div>
      </div>

    </div>
  </div>
  <!-- main-panel ends -->
@endsection