@extends('admin.main')


@section('content')
<div class="customer mt-3">
    <ul>
        <li>Tên khách hàng: <strong>{{$customer->name}}</strong></li>
        <li>Số điện thoại: <strong>{{$customer->phone}}</strong></li>
        <li>Địa chỉ: <strong>{{$customer->address}}</strong></li>
        <li>Email: <strong>{{$customer->email}}</strong></li>
        <li>Nội dung ghi chú: <strong>{{$customer->note}}</strong></li>
    </ul>
</div>

<div class="carts">
    <table class="table">

        @php
            $total = 0;
        @endphp
        <tbody>
            <tr class="table_head">
                <th class="column-1">Hình ảnh sản phẩm</th>
                <th class="column-2">Tên sản phẩm</th>
                <th class="column-3">Giá</th>
                <th class="column-4">Số lượng</th>
                <th class="column-5">Thành tiền</th>
            </tr>

            @foreach ($carts as $value)
                        @php
                            $price = $value->price * $value->quantity;
                            $total += $price;
                        @endphp

                        <tr>
                            <td class="column-1">
                                <div class="how-itemcart1">
                                    <img src="{{$value->product->thumb}}" alt="IMG" style="width:100px">
                                </div>
                            </td>
                            <td class="column-2">{{$value->product->name}}</td>
                            <td class="column-3">{{ number_format($value->price, 0, ',', '.') }} VND</td>
                            <td class="column-3">{{ $value->quantity}}</td>
                            <td class="column-5">{{ number_format($price, 0, ',', '.') }} VND</td>
                        </tr>
            @endforeach
            <tr>
                <td colspan="4" class="text-right">Tổng tiền</td>
                <td>{{ number_format($total, 0, ',', '.') }} VND </td>
            </tr>
        </tbody>
    </table>
</div>
@endsection