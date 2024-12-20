<?php

namespace App\Http\Controllers\Admin;

use App;
use App\Http\Controllers\Controller;
use App\Models\Menu;
use App\Http\Requests\Product\ProductRequest;
use App\Http\Services\Product\ProductAdminService;
use App\Models\Product;
use Exception;
use GuzzleHttp\Psr7\Message;
use Illuminate\Http\Request;
use Log;
use Session;

class ProductController extends Controller
{

    //x
    public function get()
    {
        return Product::
            //menu (relationship in model) (Ở Model)
            with('menu')
            ->orderByDesc('id')->paginate(15);
    }

    //form danh sách
    public function index()
    {
        return view('admin.product.list', [
            'title' => 'Danh sách sản phẩm',
            'name' => 'Danh sách sản phẩm',
            'products' => $this->get()
        ]);
    }


    //Lấy danh mục 
    public function getMenu()
    {
        return Menu::where('active', 1)->get();
    }


    //Xử lí giá tiền
    protected function isValidPrice($request)
    {
        if (
            $request->input('price') != 0 && $request->input('price_sale') != 0 &&
            $request->input('price_sale') >= $request->input('price')
        ) {
            Session::flash('error', 'Giá giảm phải nhỏ hơn giá gốc');
            return false;
        }

        if ($request->input('price_sale') != 0 && (int) $request->input('price') == 0) {
            Session::flash('error', 'Vui lòng nhập giá gốc');
            return false;
        }
        return true;
    }

    //hàm xử lí thêm
    public function create2(Request $request)
    {
        $isValidPrice = $this->isValidPrice($request);
        if ($isValidPrice === false) {
            return false;
        }
        try {
            //Loai trừ
            #$request->except('_token');
            Product::create([
                'name' => (string) $request->input('name'),
                'description' => (string) $request->input('description'),
                'content' => (string) $request->input('content'),
                'menu_id' => (string) $request->input('menu_id'),
                'price' => (string) $request->input('price'),
                'price_sale' => (string) $request->input('price_sale'),
                'quantity' => (string) $request->input('quantity'),
                // 'size' => (string) $request->input('size'),
                'thumb' => (string) $request->input('thumb'),
            ]);
            Session::flash('success', 'Thêm sản phẩm mới thành công');
        } catch (Exception $err) {
            Session::flash('error', 'Thêm sản phẩm lỗi');
            Log::info($err->getMessage());
            return false;
        }
        return true;
    }

    //hàm thêm
    public function store(ProductRequest $request)
    {
        $this->create2($request);
        return redirect()->back();
    }

    //form thêm
    public function create()
    {
        return view('admin.product.add', [
            'title' => 'Thêm sản phẩm mới',
            'name' => 'Thêm sản phẩm',
            'menus' => $this->getMenu()
        ]);
    }



    //hàm xử lí cập nhật
    public function update1($request, $product)
    {
        $isValidPrice = $this->isValidPrice($request);
        if ($isValidPrice == false) {
            return false;
        }

        try {
            $product->fill($request->input());
            $product->save();
            Session::flash('success', 'Cập nhật thành công');
        } catch (Exception $err) {
            Session::flash('error', 'Cập nhật thất bại');
            Log::info($err->getMessage());
            return false;
        }
        return true;
    }

    //hàm cập nhật
    public function update2(Product $product, ProductRequest $request)
    {
        $result = $this->update1($request, $product);

        if ($result) {
            return redirect('/admin/products/list');
        }
        return redirect()->back();
    }

    //form sửa
    public function fix(Product $product)
    {
        return view('admin.product.edit', [
            'title' => 'Chỉnh sửa sản phẩm',
            'name' => 'Chỉnh sửa sản phẩm' . $product->name,
            'product' => $product,
            'menus' => $this->getMenu()
        ]);
    }


    public function delete($request)
    {
        $product = Product::where('id', $request->input('id'))->first();
        if ($product) {
            $product->delete();
            return true;
        }
        return false;
    }

    //xoa
    public function destroy(Request $request)
    {
        $result = $this->delete($request);
        if ($result) {
            return response()->json([
                "check" => true,
                'message' => "Xoá thành công sản phẩm"
            ]);
        } else {
            return response()->json([
                "check" => false,
                'message' => "Xoá thất bại"
            ]);
        }
    }

    //Call id Customer/MainController
    //Sản phẩm tại trang chủ
    const LIMIT = 16;
    public function get2($load = null)
    {
        return Product::select('id', 'name', 'price', 'price_sale', 'quantity', 'thumb')
            ->orderByDesc('id')
            ->when($load != null, function ($query) use ($load) {
                $query->offset($load * self::LIMIT);
            })
            ->limit(self::LIMIT)
            ->get();
    }


    //Hiển thị trang chi tiết sản phẩm
    public function show($id)
    {
        return Product::where('id', $id)
            ->with('menu')
            ->firstOrFail();
    }


    //Danh sách xem gần đây
    public function moreProducts($id)
    {
        return Product::select('id', 'name', 'price', 'price_sale', 'quantity', 'thumb')
            ->where('id', '!=', $id)
            ->orderByDesc('id')
            ->limit(4)
            ->get();
    }
}