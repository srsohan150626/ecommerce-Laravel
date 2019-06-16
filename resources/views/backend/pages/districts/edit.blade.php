@extends('backend.layouts.master')
@section('content')
  <div class="main-panel">
    <div class="content-wrapper">

      <div class="card">
        <div class="card-header">
          Edit district
        </div>
        <div class="card-body">
          <form action="{{ route('admin.district.update',$district->id) }}" method="post" enctype="multipart/form-data">
            {{ csrf_field() }}
            @include('backend.partials.messages')
            <div class="form-group">
              <label for="name">Name</label>
              <input type="text" class="form-control" name="name" id="name" value="{{ $district->name }}">
            </div>
             <div class="form-group">
              <label for="division_id">Select a division for this district</label>
              <select class="form-control" name="division_id"> 
                <option value="">Please select a division for the district</option>
                @foreach($divisions as $division)
                <option value="{{$division->id}}" {{$district->division->id==$division->id ? 'selected' : ''}}>{{$division->name}}</option>
                @endforeach
              </select>
            </div>
            <button type="submit" class="btn btn-success"> Update</button>
          </form>
        </div>
      </div>

    </div>
  </div>
  <!-- main-panel ends -->
@endsection
