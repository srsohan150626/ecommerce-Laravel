@extends('frontend.pages.users.master')

@section('sub-content')
<div class="container">
  <div class="card-body mb-5">
      <form method="POST" action="{{ route('user.profile.update') }}">
          {{ csrf_field() }}

          <div class="form-group {{ $errors->has('first_name') ? ' has-error' : '' }}"">
              <label for="first_name" class="col-md-4 control-label">First Name</label>

              <div class="col-md-6">
                  <input id="first_name" type="text" class="form-control" name="first_name" value="{{ $user->first_name }}" required autofocus>

                  @if ($errors->has('first_name'))
                      <span class="help-block">
                          <strong>{{ $errors->first('first_name') }}</strong>
                      </span>
                  @endif
              </div>
          </div>
           <div class="form-group {{ $errors->has('last_name') ? ' has-error' : '' }}">
              <label for="last_name" class="col-md-4 control-label">Last Name</label>

              <div class="col-md-6">
                  <input id="last_name" type="text" class="form-control" name="last_name" value="{{  $user->last_name }}" required autofocus>

                  @if ($errors->has('last_name'))
                      <span class="help-block">
                          <strong>{{ $errors->first('last_name') }}</strong>
                      </span>
                  @endif
              </div>
          </div>
           <div class="form-group {{ $errors->has('username') ? ' has-error' : '' }}">
              <label for="username" class="col-md-4 control-label">Username</label>

              <div class="col-md-6">
                  <input id="username" type="text" class="form-control" name="username" value="{{  $user->username }}" required autofocus>

                  @if ($errors->has('username'))
                      <span class="help-block">
                          <strong>{{ $errors->first('username') }}</strong>
                      </span>
                  @endif
              </div>
          </div>
          <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
              <label for="email" class="col-md-4 control-label" >E-Mail Address</label>

              <div class="col-md-6">
                  <input id="email" type="email" class="form-control" name="email" value="{{ $user->email }}" required>

                  @if ($errors->has('email'))
                      <span class="help-block">
                          <strong>{{ $errors->first('email') }}</strong>
                      </span>
                  @endif
              </div>
          </div>
        <div class="form-group{{ $errors->has('phone_no') ? ' has-error' : '' }}">
           <label for="phone_no" class="col-md-4 control-label" >Phone number</label>

                      <div class="col-md-6">
                          <input id="phone_no" type="text" class="form-control" name="phone_no" value="{{  $user->phone_no }}" required>

                          @if ($errors->has('phone_no'))
                              <span class="help-block">
                                  <strong>{{ $errors->first('phone_no') }}</strong>
                              </span>
                          @endif
                      </div>
                  </div>
        <div class="form-group{{ $errors->has('division_id') ? ' has-error' : '' }}">
           <label for="division_id" class="col-md-4 control-label" >Division</label>

        <div class="col-md-6">
        <select class="form-control" name="division_id">
        <option value="">Please Select your Division</option>
        @foreach($divisions as $division)
          <option value="{{$division->id}}" {{$user->division_id==$division->id ?
          'selected' : ''}}>{{$division->name}}</option>
        @endforeach
        </select>
        </div>
        </div>
        <div class="form-group{{ $errors->has('district_id') ? ' has-error' : '' }}">
        <label for="district_id" class="col-md-4 control-label" >District</label>

        <div class="col-md-6">
        <select class="form-control" name="district_id">
        <option value="">Please Select your District</option>
        @foreach($districts as $district)
          <option value="{{$district->id}}" {{$user->district_id==$district->id ?
          'selected' : ''}}>{{$district->name}}</option>
        @endforeach
        </select>
        </div>
        </div>
        <div class="form-group{{ $errors->has('	street_address	') ? ' has-error' : '' }}">
            <label for="	street_address	" class="col-md-4 control-label" >Street Address</label>

            <div class="col-md-6">
                <input id="street_address" class="form-control" rows="4" name="street_address" value="   {{ $user->street_address}}" required>


                @if ($errors->has('street_address'))
                    <span class="help-block">
                        <strong>{{ $errors->first('street_address') }}</strong>
                    </span>
                @endif
            </div>
        </div>
          <div class="form-group{{ $errors->has('	shipping_address	') ? ' has-error' : '' }}">
              <label for="	shipping_address	" class="col-md-4 control-label" >Shipping Address(Optional)</label>

              <div class="col-md-6">
                  <textarea id="shipping_address" class="form-control" rows="4" name="shipping_address">
                     {{ $user->shipping_address}}
                  </textarea>

                  @if ($errors->has('shipping_address'))
                      <span class="help-block">
                          <strong>{{ $errors->first('shipping_address') }}</strong>
                      </span>
                  @endif
              </div>
          </div>
          <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
              <label for="password" class="col-md-4 control-label">New Password(Optional)</label>

              <div class="col-md-6">
                  <input id="password" type="password" class="form-control" name="password">
                  @if ($errors->has('password'))
                      <span class="help-block">
                          <strong>{{ $errors->first('password') }}</strong>
                      </span>
                  @endif
              </div>
          </div>

          <div class="form-group">
              <div class="col-md-6 col-md-offset-4">
                  <button type="submit" class="btn btn-primary">
                      Update Profile
                  </button>
              </div>
          </div>
      </form>
  </div>
</div>
@endsection
