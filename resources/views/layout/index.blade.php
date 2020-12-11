
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Nội thất|@yield('title')</title>
	<base href="{{asset('')}}">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="admin_asset/bootstrap-4.5.0-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="admin_asset/fontawesome-free-5.14.0-web/css/all.css">
	<script src="admin_asset/js/jquery-3.5.1.js"></script>
	<script src="admin_asset/bootstrap-4.5.0-dist/js/bootstrap.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="admin_asset/fontawesome-free-5.14.0-web/css/all.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="admin_asset/mainx.css">	
	@yield('css')
</head>
<body>
	@include('layout.header')
	
	@include('layout.menu')

	@yield('content') 

	@include('layout.footer')

	@yield('script')
</body>
</html>