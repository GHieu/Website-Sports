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
                    <input type="text" name="name" value="{{ $product->name }}" class="form-control"
                        placeholder="Nhập tên sản phẩm">
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label>Danh Mục</label>
                    <select class="form-control" name="menu_id">
                        @foreach($menus as $menu)
                        <option value="{{ $menu->id }}" {{$product->menu_id == $menu->id ? 'selected' : ''}}>
                            {{ $menu->name }}
                        </option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label for="menu">Giá Gốc</label>
                    <input type="number" name="price" value="{{ $product->price }}" class="form-control">
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="menu">Giá Giảm</label>
                    <input id="currency" type="number" name="price_sale" value="{{ $product->price_sale }}"
                        class="form-control">
                </div>
            </div>


            <div class="col-md-3">
                <div class="form-group">
                    <label for="menu">Số lượng</label>
                    <input type="number" name="quantity" value="{{ old('quantity') }}" class="form-control">
                </div>
            </div>

            <!-- <div class="col-md-3">
                <div class="form-group">
                    <label for="menu">Size</label>
                    <select name="size" id="">
                        <option value="">S</option>
                        <option value="">M</option>
                        <option value="">L</option>
                        <option value="">XL</option>
                        <option value="">2XL</option>
                    </select>
                </div>
            </div> -->
        </div>

        <div class="form-group">
            <label>Mô Tả </label>
            <textarea name="description" class="form-control">{{ $product->description }}</textarea>
        </div>

        <div class="form-group">
            <label>Mô Tả Chi Tiết</label>
            <textarea name="content" id="content" class="form-control">{{ $product->content }}</textarea>
        </div>

        <div class="form-group">
            <label for="menu">Ảnh Sản Phẩm</label>
            <input type="file" class="form-control" id="upload">

            <div id="image_show">

                <a href="{{ $product->thumb }}" target="_blank">

                    <img src="{{ $product->thumb }}" alt="" width="100px">

                </a>

            </div>

            <input type="hidden" name="thumb" id="thumb" value="{{ $product->thumb }}">

        </div>

    </div>

    <div class="card-footer">
        <button type="submit" class="btn btn-primary">Cập nhật Sản Phẩm</button>
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
</script>
@endsection