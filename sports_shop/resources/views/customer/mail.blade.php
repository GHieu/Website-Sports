<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Đơn hàng của bạn</title>
</head>

<body>
    <h2>Xin chào {{ $customer->name }}</h2>
    <p>Cảm ơn bạn đã đặt hàng tại Sports. Dưới đây là thông tin đơn hàng của bạn:</p>

    <h3>Thông tin khách hàng:</h3>
    <p>Tên: {{ $customer->name }}</p>
    <p>Địa chỉ: {{ $customer->address }}</p>
    <p>Điện thoại: {{ $customer->phone }}</p>
    <p>Email: {{ $customer->email }}</p>

    <h3>Danh sách sản phẩm:</h3>
    <table border="1" cellspacing="0" cellpadding="10">
        <thead>
            <tr>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Giá</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($products as $product)
                <tr>
                    <td>{{ $product['name'] }}</td>
                    <td>{{ $product['quantity'] }}</td>
                    <td>{{ number_format($product['price'], 0, ',', '.') }} đ</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <p>Chúc bạn một ngày tốt lành!</p>
    <p><strong>Sports</strong></p>
</body>

</html>