@extends('admin.main')


@section('content')
<table class="table">
    <thead>
        <tr>
            <th style="width:50px">ID</th>
            <th>Tên sản phẩm</th>
            <th>Danh mục</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <!-- <th>Size</th> -->
            <th>Thời gian tạo sản phẩm</th>

            <th style="width:100px">&nbsp;</th>
        </tr>
    </thead>

    <tbody>

        @foreach ($products as $key => $value)



            <tr>
                <td>{{$value->id}}</td>
                <td>{{$value->name}}</td>
                <td>{{$value->menu->name}}</td>
                <td>{{ number_format($value->price, 0, ',', ',') }} VNĐ</td>
                <td>{{$value->quantity}}</td>
                <!-- <td>{{$value->size}}</td> -->
                <td>{{$value->updated_at->format('d/m/Y')}}</td>


                <td>
                    <a class="btn btn-primary btn-sm" href="/admin/products/edit/{{$value->id}}">
                        <i class="fa-solid fa-user-pen"></i>
                    </a>
                    <a href="#" class="btn btn-danger btn-sm"
                        onclick="removeRow({{$value->id}}, '/admin/products/destroy')">
                        <i class="fa-solid fa-trash"></i>
                    </a>
                </td>

        @endforeach
    </tbody>
    </tr>
</table>

{!! $products->links() !!}

@endsection