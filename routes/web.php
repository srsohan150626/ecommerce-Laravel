<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



  Route::get('/','FrontEnd\PagesController@index')->name('index');
  Route::get('/contact','FrontEnd\PagesController@contact')->name('contact');


   Route::group(['prefix' => '/products'], function(){
   Route::get('/','FrontEnd\ProductsController@index')->name('products');
   Route::get('/{slug}','FrontEnd\ProductsController@show')->name('products.show');
   Route::get('/new/search','FrontEnd\PagesController@search')->name('search');

   //category route
     Route::get('/categories','FrontEnd\CategoriesController@index')->name('categories.index');
   Route::get('/category/{id}','FrontEnd\CategoriesController@show')->name('categories.show');
 });
//user Route
  Route::group(['prefix' => 'user'], function(){
    Route::get('/token/{token}','FrontEnd\VerificationController@verify')->name('user.verification');
    Route::get('/dashboard','FrontEnd\UsersController@dashboard')->name('user.dashboard');
    Route::get('/profile','FrontEnd\UsersController@profile')->name('user.profile');
    Route::post('/profile/update','FrontEnd\UsersController@profileUpdate')->name('user.profile.update');
  });
//Carts Route
  Route::group(['prefix' => 'carts'], function(){
    Route::get('/','FrontEnd\CartsController@index')->name('carts');
    Route::post('/store','FrontEnd\CartsController@store')->name('carts.store');
    Route::post('/update/{id}','FrontEnd\CartsController@update')->name('carts.update');
    Route::post('/delete/{id}','FrontEnd\CartsController@destroy')->name('carts.delete');
  });
  Route::group(['prefix' => 'checkout'], function(){
    Route::get('/','FrontEnd\CheckoutsController@index')->name('checkouts');
    Route::post('/store','FrontEnd\CheckoutsController@store')->name('checkouts.store');
  });


//Admin Route
  Route::group(['prefix' => 'admin'], function(){
  Route::get('/', 'Backend\PagesController@index')->name('admin.index');
  //admin login route
  Route::get('/login', 'Auth\Admin\LoginController@showLoginForm')->name('admin.login');
  Route::post('/login/submit', 'Auth\Admin\LoginController@login')->name('admin.login.submit');
  Route::post('/logout/submit', 'Auth\Admin\LoginController@logout')->name('admin.logout');

  //Password Email send
  Route::get('/password/reset', 'Auth\Admin\ForgotPasswordController@ShowLinkRequestForm')->name('admin.password.request');
  Route::post('/password/resetPost', 'Auth\Admin\ForgotPasswordController@sendResetLinkEmail')->name('admin.password.email');
  //Password reset
  Route::get('/password/reset/{token}', 'Auth\Admin\ResetPasswordController@ShowResetForm')->name('admin.password.reset');
  Route::post('/password/reset', 'Auth\Admin\ResetPasswordController@reset')->name('admin.password.reset.post');

 //product route
  Route::group(['prefix' => '/products'], function(){
  Route::get('/', 'Backend\ProductsController@index')->name('admin.products');
  Route::get('/create', 'Backend\ProductsController@create')->name('admin.product.create');
  Route::get('/edit/{id}', 'Backend\ProductsController@edit')->name('admin.product.edit');

  Route::post('/store', 'Backend\ProductsController@store')->name('admin.product.store');

  Route::post('/product/edit/{id}', 'Backend\ProductsController@update')->name('admin.product.update');
  Route::post('/product/delete/{id}', 'Backend\ProductsController@delete')->name('admin.product.delete');

});

//Order Route

  Route::group(['prefix' => '/orders'], function(){
  Route::get('/', 'Backend\OrdersController@index')->name('admin.orders');
  Route::get('/view/{id}', 'Backend\OrdersController@show')->name('admin.order.show');
  Route::post('/delete/{id}', 'Backend\OrdersController@delete')->name('admin.order.delete');

  Route::post('/completed/{id}', 'Backend\OrdersController@completed')->name('admin.order.completed');
  Route::post('/paid/{id}', 'Backend\OrdersController@paid')->name('admin.order.paid');
  Route::post('/charge.update/{id}', 'Backend\OrdersController@chargeUpdate')->name('admin.order.charge');
  Route::get('/invoice/{id}', 'Backend\OrdersController@generateInvoice')->name('admin.order.invoice');
});
//Category Route

  Route::group(['prefix' => '/categories'], function(){
  Route::get('/', 'Backend\CategoriesController@index')->name('admin.categories');
  Route::get('/create', 'Backend\CategoriesController@create')->name('admin.category.create');
  Route::get('/edit/{id}', 'Backend\CategoriesController@edit')->name('admin.category.edit');

  Route::post('/store', 'Backend\CategoriesController@store')->name('admin.category.store');

  Route::post('/category/edit/{id}', 'Backend\CategoriesController@update')->name('admin.category.update');
  Route::post('/category/delete/{id}', 'Backend\CategoriesController@delete')->name('admin.category.delete');

});

//Brand Route

  Route::group(['prefix' => '/brands'], function(){
  Route::get('/', 'Backend\BrandsController@index')->name('admin.brands');
  Route::get('/create', 'Backend\BrandsController@create')->name('admin.brand.create');
  Route::get('/edit/{id}', 'Backend\BrandsController@edit')->name('admin.brand.edit');

  Route::post('/store', 'Backend\BrandsController@store')->name('admin.brand.store');

  Route::post('/brand/edit/{id}', 'Backend\BrandsController@update')->name('admin.brand.update');
  Route::post('/brand/delete/{id}', 'Backend\BrandsController@delete')->name('admin.brand.delete');

});
//Division Route

  Route::group(['prefix' => '/divisions'], function(){
  Route::get('/', 'Backend\DivisionsController@index')->name('admin.divisions');
  Route::get('/create', 'Backend\DivisionsController@create')->name('admin.division.create');
  Route::get('/edit/{id}', 'Backend\DivisionsController@edit')->name('admin.division.edit');

  Route::post('/store', 'Backend\DivisionsController@store')->name('admin.division.store');

  Route::post('/division/edit/{id}', 'Backend\DivisionsController@update')->name('admin.division.update');
  Route::post('/division/delete/{id}', 'Backend\DivisionsController@delete')->name('admin.division.delete');

});
//District Route

  Route::group(['prefix' => '/districts'], function(){
  Route::get('/', 'Backend\DistrictsController@index')->name('admin.districts');
  Route::get('/create', 'Backend\DistrictsController@create')->name('admin.district.create');
  Route::get('/edit/{id}', 'Backend\DistrictsController@edit')->name('admin.district.edit');

  Route::post('/store', 'Backend\DistrictsController@store')->name('admin.district.store');

  Route::post('/district/edit/{id}', 'Backend\DistrictsController@update')->name('admin.district.update');
  Route::post('/district/delete/{id}', 'Backend\DistrictsController@delete')->name('admin.district.delete');

});

//Slider Route
  Route::group(['prefix' => '/sliders'], function(){
  Route::get('/', 'Backend\SlidersController@index')->name('admin.sliders');

  Route::post('/store', 'Backend\SlidersController@store')->name('admin.slider.store');
  Route::post('/slider/edit/{id}', 'Backend\SlidersController@update')->name('admin.slider.update');
  Route::post('/slider/delete/{id}', 'Backend\SlidersController@delete')->name('admin.slider.delete');

});
});

Auth::routes();
Route::get('/home', 'HomeController@index')->name('home');

//API routes

Route::get('get-districts/{id}',function($id){
  return json_encode(App\Models\District::where('division_id',$id)->get());
});
