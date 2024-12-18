<?php
namespace App\Http\Controllers\Admin;

use App\Jobs\SendMail;
use App\Models\Product;
use App\Models\Cart;
use App\Models\Customer;
use Exception;
use Illuminate\Http\Request;
use Session;
use DB;
class CartController
{
    public function create($request)
    {
        $quantity = (int) $request->input('num_product');
        $product_id = (int) $request->input('product_id');

        if ($quantity <= 0 || $product_id <= 0) {
            Session::flash('error', 'Số lượng hoặc sản phẩm không chính xác');
            return false;
        }

        // Lấy giỏ hàng hiện tại hoặc khởi tạo giỏ hàng rỗng
        $carts = Session::get('carts', []);

        // Kiểm tra và cập nhật giỏ hàng
        if (isset($carts[$product_id])) {
            $carts[$product_id] += $quantity;
        } else {
            $carts[$product_id] = $quantity;
        }

        // Lưu lại giỏ hàng
        Session::put('carts', $carts);

        return true;
    }


    public function getProduct()
    {
        $carts = Session::get('carts', []);
        if (!empty($carts)) {
            $product_id = array_keys($carts);
            return Product::select('id', 'name', 'price', 'price_sale', 'thumb')
                ->whereIn('id', $product_id)
                ->get();
        }
        return [];
    }



    public function updateCart($request)
    {
        Session::put('carts', $request->input('num_product'));
        return true;
    }


    public function removeCart($id)
    {
        $carts = Session::get('carts');
        unset($carts[$id]);

        //Xoá rồi cập nhật lại mảng
        Session::put('carts', $carts);
        return true;
    }

    public function buyProduct($request)
    {

        try {
            DB::beginTransaction();
            $carts = Session::get('carts', []);
            if (is_null($carts))
                return false;

            $customer = Customer::create([
                'name' => $request->input('name'),
                'address' => $request->input('address'),
                'phone' => $request->input('phone'),
                'email' => $request->input('email'),
                'note' => $request->input('note'),
            ]);
            $this->infoProductCart($carts, $customer->id);

            DB::commit();




            // Lấy sản phẩm trong giỏ hàng để gửi qua email
            $product_ids = array_keys($carts);
            $product = Product::select('id', 'name', 'price', 'thumb')
                ->whereIn('id', $product_ids)
                ->get();


            Session::flash('success', 'Bạn đã đặt hàng thành công');

            //$product = Product::all();
            #Queue
            SendMail::dispatch($request->input('email'), $customer, $product);//->delay(now()->addSeconds(5));

            Session::forget('carts');
        } catch (Exception $err) {
            DB::rollBack();
            Session::flash('error', 'Đặt hàng thất bại! Vui lòng thử lại sau');
            return false;
        }
        return true;
    }

    protected function infoProductCart($carts, $customer_id)
    {
        $product_id = array_keys($carts);
        $products = Product::select('id', 'name', 'price', 'price_sale', 'thumb')
            ->whereIn('id', $product_id)
            ->get();

        $data = [];
        foreach ($products as $product) {
            $data[] = [
                'customer_id' => $customer_id,
                'product_id' => $product->id,
                'quantity' => $carts[$product->id],
                'price' => $product->price_sale != 0 ? $product->price_sale : $product->price
            ];
        }
        return Cart::insert($data);
    }


    public function getCustomer()
    {
        return Cart::select(
            'carts.id', // ID của giỏ hàng
            'customers.name', // Tên khách hàng
            'customers.phone', // Số điện thoại khách hàng
            'customers.email', // Email
            'customers.address', // Địa chỉ
            'customers.note',
            'customers.created_at' // Ngày đặt hàng
        )
            ->join('customers', 'customers.id', '=', 'carts.customer_id') // Kết nối bảng customers với carts
            ->orderByDesc('carts.id') // Sắp xếp giảm dần theo ID
            ->paginate(15);
    }

    //Xử lí đặt hàng admin
    public function index()
    {
        return view('admin.carts.profile', [
            'title' => 'Danh sách đơn đặt hàng',
            'name' => 'Đơn đặt hàng',
            'customers' => $this->getCustomer()
        ]);
    }

    public function viewDetails(Customer $customer)
    {
        return view('admin.carts.detail', [
            'title' => 'Chi tiết đơn hàng',
            'name' => 'Thông tin chi tiết đơn hàng của: ' . $customer->name,
            'customer' => $customer,
            'carts' => $customer->carts()->with([
                'product' => function ($query) {
                    $query->select('id', 'name', 'thumb');
                }
            ])->get()
        ]);
    }
}