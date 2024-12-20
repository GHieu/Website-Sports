<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{{$title}}</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="/template/admin/plugins/fontawesome-free/css/all.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- icheck bootstrap -->
<link rel="stylesheet" href="/template/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Bootstrap CSS từ CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Theme style -->
<link rel="stylesheet" href="/template/admin/dist/css/adminlte.min.css">
<link rel="stylesheet" href="/template/admin/dist/css/custom.css">

<meta name="csrf-token" content="{{ csrf_token() }}">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
<script src="/template/customer/js/jquery.maskMoney.js" type="text/javascript"></script>
@yield('header')