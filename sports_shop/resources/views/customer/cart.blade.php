<div class="wrap-header-cart js-panel-cart">
    <div class="s-full js-hide-cart"></div>

    <div class="header-cart flex-col-l p-l-65 p-r-25">
        <div class="header-cart-title flex-w flex-sb-m p-b-8">
            <span class="mtext-103 cl2">
                Your Cart
            </span>

            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>

        <div class="header-cart-content flex-w js-pscroll">
            @php
            $sumPrice = 0;
            @endphp
            <ul class="header-cart-wrapitem w-full">

                @if (count($products) > 0)
                @foreach ($products as $key => $value)

                @php
                $price = \App\Helpers\Helper::price($value->price, $value->price_sale);
                $sumPrice += $value->price_sale != 0 ? $value->price_sale : $value->price;
                @endphp
                <li class="header-cart-item flex-w flex-t m-b-12">
                    <div class="header-cart-item-img">
                        <img src="{{$value->thumb}}" alt="IMG">
                    </div>

                    <div class="header-cart-item-txt p-t-8">
                        <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                            {{$value->name}}
                        </a>

                        <span class="header-cart-item-info">
                            <!-- {!! $price !!} -->
                            {{ number_format($value->price_sale, 0, ',', '.') }} VND
                        </span>
                    </div>
                </li>

                @endforeach
                @endif
            </ul>

            <div class="w-full" style="text-align:center">
                <div class="header-cart-total w-full p-tb-40">
                    Tổng tiền: {{ number_format($sumPrice, 0, ',', '.') }} VND
                </div>

                <div class="header-cart-buttons flex-w w-full" style="display: flex; justify-content: center;">
                    <a href="/carts"
                        class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
                        Xem giỏ hàng
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>