<header>
    @php
    $menuHTML = App\Helpers\Helper::menus($key);
    $name = session('name'); // Lấy tên người dùng từ session
    @endphp

    <!-- Header desktop -->
    <div class="container-menu-desktop">
        <div class="wrap-menu-desktop">
            <nav class="limiter-menu-desktop container">
                <a href="/" class="logo">
                    <img src="/template/customer/images/icons/logo.webp" alt="IMG-LOGO">
                </a>
                <div class="menu-desktop">
                    <ul class="main-menu">
                        <li><a href="/">Trang chủ</a></li>
                        {!! $menuHTML !!}
                        <li><a href="#">About</a></li>
                        <li><a href="#">Liên hệ</a></li>
                    </ul>
                </div>

                <!-- Icon header -->
                <div class="wrap-icon-header flex-w flex-r-m">
                    <!-- <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
                        <i class="zmdi zmdi-search"></i>
                    </div> -->
                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
                        data-notify="{{ !is_null(\Session::get('carts')) ? count(\Session::get('carts')) : 0 }}">
                        <i class="zmdi zmdi-shopping-cart"></i>
                    </div>

                    @if ($name)
                    <a href="#" class="dis-block cl2 hov-cl1 trans-04 p-l-22 p-r-11">
                        Chào mừng, {{ $name }}
                    </a>
                    <a href="{{ route('customer.signout') }}" class="dis-block cl2 hov-cl1 trans-04 p-l-22 p-r-11">
                        Đăng xuất
                    </a>
                    @else
                    <a href="/customer/login" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
                        <i style="font-size:90%" class="fa-regular fa-user"></i>
                    </a>
                    @endif
                </div>
            </nav>
        </div>
    </div>
</header>