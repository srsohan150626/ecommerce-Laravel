<!DOCTYPE html>

<html>
<head>
	<title>
	@yield('title','Laravel E-commerce Project')
	</title>
	<meta name="csrf-token" content="{{ csrf_token() }}">
	@include('frontend.partials.styles')

</head>
<body>

<div class="wrapper">
	<!-- navigation-->
	@include('frontend.partials.nav')
  @include('frontend.partials.messages')
@yield('content')

@include('frontend.partials.footer')

</div>

@include('frontend.partials.scripts')
@yield('scripts');
</body>
</html>
