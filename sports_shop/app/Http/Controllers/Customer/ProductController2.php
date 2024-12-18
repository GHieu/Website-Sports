<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Controllers\Admin\ProductController;

class ProductController2 extends Controller
{
    protected $productController2;

    public function __construct(ProductController $productController)
    {
        $this->productController2 = $productController;
    }
    public function index($id = '', $slug = '')
    {
        $product = $this->productController2->show($id);

        $productsMore = $this->productController2->moreProducts($id);

        //Chi tiết sản phẩm
        return view('customer.products.content', [
            "title" => $product->name,
            'product' => $product,
            'products' => $productsMore
        ]);
    }

    public function search(Request $request)
    {
        $title = 'Kết quả tìm kiếm';
        $keyword = $request->input('search');
        $products = Product::where('name', 'LIKE', '%' . $keyword . '%')->orderByDesc('id')->paginate(20);
        return view('customer.search', compact('title', 'products'));
    }
}