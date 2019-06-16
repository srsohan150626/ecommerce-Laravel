<?php

namespace App\Http\Controllers\Backend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\Admin;


class AdminController extends Controller
{
  public function __construct()
  {
      $this->middleware('auth:admin');
  }
}
