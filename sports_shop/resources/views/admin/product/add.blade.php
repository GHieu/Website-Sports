@extends('admin.main')

@section('header')
<script src="../assets/vendor/ckeditor5.js"></script>
<link rel="stylesheet" href="../../assets/vendor/ckeditor5.css">
@endsection

@section('content')
<form action="" method="POST">
    <div class="card-body">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="menu">Tên Sản Phẩm</label>
                    <input type="text" name="name" value="{{ old('name') }}" class="form-control"
                        placeholder="Nhập tên sản phẩm">
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label>Danh Mục</label>
                    <select class="form-control" name="menu_id">
                        @foreach($menus as $menu)
                        <option value="{{ $menu->id }}">{{ $menu->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="menu">Giá Gốc</label>
                    <input type="number" name="price" value="{{ old('price') }}" class="form-control">
                </div>
            </div>
            <div class=" col-md-6">
                <div class="form-group">
                    <label for="menu">Giá Giảm</label>
                    <input type="number" name="price_sale" value="{{ old('price_sale') }}" class="form-control">
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label for="menu">Số lượng</label>
                    <input type="number" name="quantity" value="{{ old('quantity') }}">
                </div>
            </div>

            <div class="col-md-2">
                <div>
                    <label for="menu">Size</label>
                </div>
                <select name="size" id="">
                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                    <option value="XL">XL</option>
                    <option value="2XL">2XL</option>
                </select>
            </div>

        </div>



        <div class="form-group">
            <label>Mô Tả </label>
            <textarea name="description" class="form-control">{{ old('description') }}</textarea>
        </div>

        <div class="form-group">
            <label>Mô Tả Chi Tiết</label>
            <textarea name="content" id="content" class="form-control">{{ old('content') }}</textarea>
        </div>

        <div class="form-group">
            <label for="menu">Ảnh Sản Phẩm</label>
            <input type="file" class="form-control" id="upload">

            <div id="image_show">

            </div>

            <input type="hidden" name="thumb" id="thumb">

        </div>

    </div>

    <div class="card-footer">
        <button type="submit" class="btn btn-primary">Thêm Sản Phẩm</button>
    </div>
    </div>
    @csrf
</form>
@endsection

@section('footer')
<script type="importmap">
    {
                "imports": {
                    "ckeditor5": "../../assets/vendor/ckeditor5.js",
                    "ckeditor5/": "../../assets/vendor/"
                }
            }
        </script>

<script type="module">
import {
    ClassicEditor,
    Essentials,
    Paragraph,
    Bold,
    Italic,
    Font
} from 'ckeditor5';

ClassicEditor
    .create(document.querySelector('#content'), {
        plugins: [Essentials, Paragraph, Bold, Italic, Font],
        toolbar: [
            'undo', 'redo', '|', 'bold', 'italic', '|',
            'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor'
        ]
    })
    .then(content => {
        window.content = content;
    })
    .catch(error => {
        console.error(error);
    });


function formatCurrency(input) {
    let value = input.value.replace(/[^0-9]/g, ''); // Chỉ giữ lại số
    if (value) {
        input.value = new Intl.NumberFormat('vi-VN').format(value) + ' đ';
    }
}
</script>
@endsection