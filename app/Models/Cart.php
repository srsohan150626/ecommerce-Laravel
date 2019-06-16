<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Auth;
class Cart extends Model
{
  public $fillable= [
    'product_id',
    'user_id',
    'order_id',
    'ip_address',
    'product_quantity'
  ];


  public function user()
  {
    return $this->belongsTo(User::class);
  }
  public function order()
  {
    return $this->belongsTo(Order::class);
  }
  public function product()
  {
    return $this->belongsTo(Product::class);
  }

//return total carts
  public static function  totalCarts()
  {
    if (Auth::check()) {
      $carts=Cart::where('user_id',Auth::id())
      ->orwhere('ip_address',request()->ip())
      ->where('order_id',NULL)
      ->get();
    } else{
      $carts=Cart::where('ip_address',request()->ip())
      ->where('order_id',NULL)
      ->get();
    }
    return $carts;
  }
  //return total number of cart items
  public static function  totalItems()
  {
    $carts=Cart::totalCarts();
    $total_Item=0;
    foreach ($carts as $cart) {
    $total_Item+=$cart->product_quantity;
    }

    return $total_Item;
  }
}
