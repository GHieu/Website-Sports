@extends('admin.main')


@section('content')
<table class="table">
    <thead>
        <tr>
            <th style="width:50px">ID</th>
            <th>Tên khách hàng</th>
            <th>Số điện thoại</th>
            <th>Email</th>
            <th>Địa chỉ</th>
            <th>Ngày đặt hàng</th>
            <th style="width:100px">&nbsp;</th>
        </tr>
    </thead>

    <tbody>

        @foreach ($customers as $value)

        <tr>
            <td>{{$value->id}}</td>
            <td>{{$value->name}}</td>
            <td>{{$value->phone}}</td>
            <td>{{$value->email}}</td>
            <td>{{$value->address}}</td>
            <td>{{$value->created_at}}</td>


            <td>
                <a class="btn btn-primary btn-sm" href="/admin/carts/view/{{$value->id}}">
                    <i class="fa-solid fa-user-pen"></i>
                </a>
                <a href="#" class="btn btn-danger btn-sm" onclick="removeRow({{$value->id}}, '/admin/carts/destroy')">
                    <i class="fa-solid fa-trash"></i>
                </a>
            </td>

            @endforeach
    </tbody>
    </tr>
</table>

{!! $customers->links() !!}

@endsection