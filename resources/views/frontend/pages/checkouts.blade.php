@extends('frontend.layouts.master')

@section('content')
<div class="container margin-top-20 mb-3">
  <div class="card card-body">
    <h2>Confirm Items</h2>
    <hr>
    <div class="row">
      <div class="col-md-7 border-right">
        @foreach(App\Models\Cart::totalCarts() as $cart)
          <p>{{$cart->product->title}} -
            <strong>{{$cart->product->price}} Taka</strong>
            -{{$cart->product_quantity}} Item
          </p>
        @endforeach
      </div>
      <div class="col-md-5">
        @php
          $total_price=0;
        @endphp
        @foreach(App\Models\Cart::totalCarts() as $cart)
          @php
            $total_price+=$cart->product->price*$cart->product_quantity;
          @endphp
        @endforeach
        <p>Total Price : <strong>{{$total_price}}</strong> Taka</p>
        <p>Total Price with shipping cost : <strong>{{$total_price + App\Models\Setting::first()->shipping_cost}}</strong> Taka</p>
      </div>
    </div>
      <p>
        <a href="{{route('carts')}}">Change Cart Item</a>
      </p>
  <div class="card card-body margin-top-20 mb-4">
     <h2>Shipping Address</h2>
     <br>
    <form method="POST" action="{{route('checkouts.store')}}">
        {{ csrf_field() }}

        <div class="form-group {{ $errors->has('name') ? ' has-error' : '' }}"">
            <label for="name" class="col-md-4 control-label">Reciever Name</label>

            <div class="col-md-6">
                <input id="name" type="text" class="form-control" name="name" value="{{Auth::check() ? Auth::user()->first_name.' '.Auth::user()->last_name  : ''}}" required autofocus>

                @if ($errors->has('name'))
                    <span class="help-block">
                        <strong>{{ $errors->first('name') }}</strong>
                    </span>
                @endif
            </div>
        </div>

        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
            <label for="email" class="col-md-4 control-label" >E-Mail Address</label>

            <div class="col-md-6">
                <input id="email" type="email" class="form-control" name="email" value="{{Auth::check() ? Auth::user()->email:'' }}" required>

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
                        <input id="phone_no" type="text" class="form-control" name="phone_no" value="{{Auth::check() ? Auth::user()->phone_no:'' }}" required>

                        @if ($errors->has('phone_no'))
                            <span class="help-block">
                                <strong>{{ $errors->first('phone_no') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

        <div class="form-group{{ $errors->has('	shipping_address	') ? ' has-error' : '' }}">
            <label for="	shipping_address	" class="col-md-4 control-label" >Shipping Address*</label>

            <div class="col-md-6">
                <textarea id="shipping_address" class="form-control" rows="4" name="shipping_address">
                   {{Auth::check() ? Auth::user()->shipping_address:'' }}
                </textarea>

                @if ($errors->has('shipping_address'))
                    <span class="help-block">
                        <strong>{{ $errors->first('shipping_address') }}</strong>
                    </span>
                @endif
            </div>
        </div>
        <div class="form-group{{ $errors->has('	message	') ? ' has-error' : '' }}">
            <label for="	message	" class="col-md-4 control-label" >Additional Message(Optional)</label>

            <div class="col-md-6">
                <textarea id="message" class="form-control" rows="4" name="message">

                </textarea>

                @if ($errors->has('message'))
                    <span class="help-block">
                        <strong>{{ $errors->first('message') }}</strong>
                    </span>
                @endif
            </div>
        </div>
        <div class="form-group{{ $errors->has('	payment_method	') ? ' has-error' : '' }}">
            <label for="	payment_method	" class="col-md-4 control-label" >Payment Method *</label>

            <div class="col-md-6">
                <select class="form-control" name="payment_method_id" required id="payments">
                  <option value="">Select a Payment method please</option>
                  @foreach($payments as $payment)
                    <option value="{{$payment->short_name}}">{{$payment->name}}</option>
                  @endforeach
                </select>
              @foreach($payments as $payment)

                  @if($payment->short_name=="cash_in")
                  <div id="payment-{{$payment->short_name}}" class="alert alert-success mt-2 text-center hidden">
                      <h3>
                        For Cash in there is nothing necessary.Just click Finish Order.
                        <br>
                        <small>You will get your product in two or three days</small>
                      </h3>
                    </div>
                  @else
                        <div id="payment-{{$payment->short_name}}" class="alert alert-success mt-2 text-center hidden">
                          <h3>{{$payment->name}} Payment</h3>
                          <p>
                            <strong>{{$payment->name}} No: {{$payment->no}}</strong>
                            <br>
                            <strong>Account Type :: {{$payment->type}}</strong>
                          </p>
                          <div class="alert alert-success">
                            please send the above money to this Bkash No and write your transaction code below there.
                          </div>

                        </div>
                  @endif
              @endforeach
              <input type="text" name="transaction_id" id="transaction_id" class="form-control hidden" placeholder="Enter transaction code here">
             </div>
             </div>
             <div class="form-group row-mb-0">
                 <div class="col-md-6 col-md-offset-4">
                     <button type="submit" class="btn btn-primary">
                       Order Now
                     </button>
                     </div>
                 </div>
           </div>

                </form>
            </div>
   </div>

@endsection

@section('scripts')
<script type="text/javascript">

  $("#payments").change(function(){
    $payment_method=   $("#payments").val();
    if ($payment_method=="cash_in") {
        $("#payment-cash_in").removeClass('hidden');
        $("#payment-bkash").addClass('hidden');
        $("#payment-rocket").addClass('hidden');
    }
    else if ($payment_method=="bkash") {
       $("#payment-bkash").removeClass('hidden');
       $("#payment-cash_in").addClass('hidden');
       $("#payment-rocket").addClass('hidden');
       $("#transaction_id").removeClass('hidden');
    }
    else if ($payment_method=="rocket") {
     $("#payment-rocket").removeClass('hidden');
     $("#payment-bkash").addClass('hidden');
     $("#payment-cash_in").addClass('hidden');
     $("#transaction_id").removeClass('hidden');
    }

  })

</script>
@endsection
