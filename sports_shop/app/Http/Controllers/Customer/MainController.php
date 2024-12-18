<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Admin\MenuController;
use App\Http\Controllers\Admin\ProductController;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MainController extends Controller
{
    protected $menu;
    protected $product;


    public function __construct(MenuController $menu, ProductController $product)
    {
        $this->menu = $menu;
        $this->product = $product;
    }

    //Trang chủ
    public function index()
    {
        return view('customer.home', [
            'title' => 'Kamito - Cửa hàng quần áo thể thao',
            'products' => $this->product->get2(),
        ]);
    }

    //Xử lí load thêm sản phẩm nhận yêu cầu từ ajax
    public function loadProduct(Request $request)
    {
        $load = $request->input('load', 0);
        $result = $this->product->get2($load);
        if (count($result) != 0) {
            $html = view('customer.products.list', ['products' => $result])->render();
            return response()->json(['html' => $html]);
        }
        return response()->json(['html' => '']);
    }
}