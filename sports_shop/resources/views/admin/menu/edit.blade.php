@extends('admin.main')

@section('header')
<script src="../assets/vendor/ckeditor5.js"></script>
<link rel="stylesheet" href="../../assets/vendor/ckeditor5.css">
@endsection

@section('content')
<div class="card card-primary">
    <!-- /.card-header -->
    <!-- form start -->
    <form action="" method="post">
        <div class="card-body">
            <div class="form-group">
                <label>Tên danh mục</label>
                <input list="list_option" type="text" value="{{$menu->name}}" name="name" class="form-control"
                    placeholder="Nhập tên danh mục">
                <datalist id="list_option">
                    <option value="Quần áo thể thao">
                    <option value="Giày thể thao">
                    <option value="Phụ kiện thể thao">
                        <!-- <option value=""> -->
                </datalist>
            </div>


            <div class="form-group">
                <label>Danh mục</label>
                <select class="form-control" name="parent_id" id="">
                    <option value="0" {{$menu->parent_id == 0 ? 'selected' : ''}}>Danh mục cha</option>
                    @foreach ($menus as $menuParent)
                        <option value="{{$menuParent->id}} " {{$menu->parent_id == $menuParent->id ? 'selected' : ''}}>
                            {{$menuParent->name}}
                        </option>
                    @endforeach
                </select>
            </div>

        </div>
        <!-- /.card-body -->

        <div class="card-footer">
            <button type="submit" class="btn btn-primary">Cập nhật danh mục</button>
        </div>
        @csrf
    </form>

</div>
@endsection