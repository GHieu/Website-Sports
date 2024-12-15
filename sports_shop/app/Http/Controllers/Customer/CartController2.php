<?php

namespace App\Http\Controllers\Customer;


use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\Admin\CartController;
use Session;

class CartController2 extends Controller
{
    protected $cart;
    public function __construct(CartController $cartController)
    {
        $this->cart = $cartController;
    }

    public function index(Request $request)
    {
        $result = $this->cart->create($request);
        if ($result == false) {
            return redirect()->back();
        }
        return redirect('/carts');
    }

    public function show()
    {
        $products = $this->cart->getProduct();

        return view('customer.carts.list', [
            'title' => 'Giỏ hàng',
            'products' => $products,
            'carts' => Session::get('carts'),
        ]);
    }


    public function update(Request $request)
    {
        $this->cart->updateCart($request);
        return redirect('/carts');
    }

    public function remove($id = 0)
    {
        $this->cart->removeCart($id);
        return redirect('/carts');
    }

    public function buy(Request $request)
    {
        $this->cart->buyProduct($request);
        return redirect()->back();
    }
}