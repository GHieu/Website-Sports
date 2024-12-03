<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Controllers\Admin\MenuController;
class MenuController2 extends Controller
{
    protected $menuAdmin;
    public function __construct(MenuController $menuController)
    {
        $this->menuAdmin = $menuController;
    }

    public function index(Request $request, $id, $slug = '')
    {
        $menu = $this->menuAdmin->getId($id);
        $products = $this->menuAdmin->getProduct($menu, $request);
        return view('customer.menu', [
            'title' => $menu->name,
            'products' => $products,
            'menu' => $menu
        ]);
    }
}