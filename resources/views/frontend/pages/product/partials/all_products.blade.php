<div class="row">
  @foreach ($products as $product)

<div class="col-md-4">
    <div class="card">
  <!--<img class="card-img-top feature-img" src="{{asset('images/products/'.'xiaomi.jpg') }}" alt="Card image cap">-->
  @php $i=1; @endphp
  @foreach ($product->images as $image)
  @if($i>0)
  <a href="{!! route('products.show',$product->slug) !!}">
   <img class="card-img-top feature-img" src="{{asset('images/products/'.$image->image) }}" alt="{{$product->title}}">
 </a>
   @endif
   @php $i--; @endphp
  @endforeach
  <div class="card-body">
    <h5 class="card-title">
      <a href="{!! route('products.show',$product->slug) !!}">{{$product->title}}</a>
    </h5>
    <p class="card-text">Taka: {{$product->price}}</p>
    @include('frontend.pages.product.partials.cart-button')
  </div>
</div>
</div>
  @endforeach
</div>
 <div class="mt-4 pagination">
   <
       {{ $products->links() }}

 </div>
