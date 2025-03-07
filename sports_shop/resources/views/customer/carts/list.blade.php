@extends('customer.main')

@section('content')
<form class="bg0 p-t-100 p-b-85 con-pa-top" method="post">

    @include('admin.alert');

    @if(count($products) != 0)
    <div class="container">
        <div class="row">
            <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                <div class="m-l-25 m-r--38 m-lr-0-xl">
                    <div class="wrap-table-shopping-cart">
                        <table class="table-shopping-cart">

                            @php
                            $total = 0;
                            @endphp
                            <tbody>

                                <tr class="table_head">
                                    <th class="column-1">Sản phẩm</th>
                                    <th class="column-2"></th>
                                    <th class="column-3">Giá</th>
                                    <th class="column-4">Số lượng</th>
                                    <th class="column-5">Tổng tiền</th>
                                    <th class="column-6">&nbsp;</th>
                                </tr>

                                @foreach ($products as $value)
                                @php
                                $price = $value->price_sale != 0 ? $value->price_sale : $value->price;

                                $priceEnd = $carts[$value->id] * $price;

                                $total += $priceEnd;
                                @endphp

                                <tr class="table_row">
                                    <td class="column-1">
                                        <div class="how-itemcart1">
                                            <img src="{{$value->thumb}}" alt="IMG">
                                        </div>
                                    </td>
                                    <td class="column-2">{{$value->name}}</td>
                                    <td class="column-3">{{ number_format($price, 0, ',', '.') }} VND</td>
                                    <td class="column-4">
                                        <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                            <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fs-16 zmdi zmdi-minus"></i>
                                            </div>

                                            <input class="mtext-104 cl3 txt-center num-product" type="number"
                                                name="num_product[{{$value->id}}]"
                                                value="{{ isset($carts[$value->id]) ? $carts[$value->id] : 0 }}">

                                            <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                <i class="fs-16 zmdi zmdi-plus"></i>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="column-5">{{ number_format($priceEnd, 0, ',', '.') }} VND</td>
                                    <td class="p-r-15">

                                        <a href="/carts/remove/{{$value->id}}" class="p-1 delete-cart">
                                            Xoá</a>
                                    </td>
                                </tr>
                                @endforeach

                            </tbody>
                        </table>
                    </div>

                    <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
                        <input style="margin:auto;width:100%" type="submit" value="Cập nhật giỏ hàng"
                            formaction="/update-cart"
                            class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
                        @csrf
                    </div>
                </div>
            </div>


            <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
                    <h4 class="mtext-109 p-b-30">
                        Thông tin đơn hàng
                    </h4>
                    <div class="flex-w flex-t bor12 p-t-15 p-b-30">

                        <div class="size-100 p-r-18 p-r-0-sm w-full-ssm">

                            <div class="p-t-15">
                                <span class="stext-112 cl8">
                                    Thông tin khách hàng
                                </span>

                                <div class="bor8 bg0 m-b-12">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="name"
                                        placeholder="Tên khách hàng">
                                </div>

                                <div class="bor8 bg0 m-b-22">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="number" name="phone"
                                        placeholder="Số điện thoại">
                                </div>

                                <div class="bor8 bg0 m-b-22">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="address"
                                        placeholder="Địa chỉ">
                                </div>

                                <div class="bor8 bg0 m-b-22">
                                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="email" name="email"
                                        placeholder="Email liên hệ">
                                </div>

                                <div class="bor8 bg0 m-b-22">
                                    <textarea class="cl8 plh3 size-111 p-lr-15" name="note"
                                        placeholder="Ghi chú"></textarea>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="flex-w flex-t p-t-27 p-b-33">
                        <div class="size-208">
                            <span class="mtext-101">
                                Tổng tiền:
                            </span>
                        </div>

                        <div class="size-209 p-t-1">
                            <span class="mtext-110">
                                {{ number_format($total, 0, ',', '.') }} VND
                            </span>
                        </div>
                    </div>

                    <button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                        Đặt hàng
                    </button>
                </div>
            </div>
        </div>
    </div>
    @else
    <div class="text-center">
        <h2 class="cart-container">Giỏ hàng trống</h2>
    </div>
    @endif
</form>
@endsection