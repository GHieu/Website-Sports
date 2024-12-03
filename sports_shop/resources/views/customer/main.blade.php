<!DOCTYPE html>
<html lang="en">

<head>
    @include('customer.header')
</head>


<!--class="animsition" -->

<body>

    <!-- Header -->
    @include('customer.headerBody')

    <!-- Cart -->
    @include('customer.cart')


    <!-- Slider, Banner, Content -->
    @yield('content')


    <!-- Footer -->
    @include('customer.footer')

</body>

</html>