@extends('customer.main')

@section('content')
<div class="bg0 p-b-80 m-b-1 p-t-150">
    <div class="container">
        <div class="flex-w flex-sb-m p-b-52">
            <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
                    <h1>{{$title}}</h1>
                </button>
            </div>

            <div class="flex-w flex-c-m m-tb-10">
                <div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
                    <i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
                    <i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                    Filter
                </div>

                <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
                    <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
                    <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
                    Search
                </div>
            </div>

            <!-- Search product -->
            <div class="dis-none panel-search w-full p-t-10 p-b-15">
                <form action="{{route('products.search')}}">
                    <div class="bor8 dis-flex p-l-15">
                        <button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
                            <i class="zmdi zmdi-search"></i>
                        </button>

                        <input class="mtext-107 size-114 plh2 p-r-15" type="text" name="search" placeholder="Search">
                    </div>
                    @csrf
                </form>
            </div>

            <!-- Filter -->
            <div class="dis-none panel-filter w-full p-t-10">
                <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
                    <div class="filter-col1 p-r-15 p-b-27">
                        <div class="mtext-102 p-b-15">
                            Sắp xếp
                        </div>

                        <ul>

                            <li class="p-b-6">
                                <a href="{{request()->fullUrlWithQuery(['price' => 'asc'])}}"
                                    class="filter-link stext-106 trans-04">
                                    Giá tiền tăng dần
                                </a>
                            </li>

                            <li class="p-b-6">
                                <a href="{{request()->fullUrlWithQuery(['price' => 'desc'])}}"
                                    class="filter-link stext-106 trans-04">
                                    Giá tiền giảm dần
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        @include('customer.products.list')
        {{$products->links()}}
    </div>
</div>
@endsection