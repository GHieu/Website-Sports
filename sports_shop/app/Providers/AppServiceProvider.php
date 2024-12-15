<?php

namespace App\Providers;
use App\Models\Menu;
use App\Models\Product;
use View;
use App\Http\View\Composers\CartComposer;
use Session;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades;
use Illuminate\Pagination\Paginator;
class AppServiceProvider extends ServiceProvider
{

    public function register(): void
    {

    }

    public function boot(): void
    {
        $value = Menu::select('id', 'name', 'parent_id')->orderByDesc('id')->get();
        Facades\View::share('key', $value);
        Paginator::useBootstrap();


        // Chia sẻ products cho view 'cart'
        View::composer('customer.cart', function ($view) {
            $carts = Session::get('carts', []);

            if (empty($carts)) {
                $view->with('products', collect()); // Truyền Collection rỗng nếu giỏ hàng trống
                return;
            }

            $productId = array_keys($carts);
            $products = Product::select('id', 'name', 'price', 'price_sale', 'thumb')
                ->whereIn('id', $productId)
                ->get();

            $view->with('products', $products);
        });
    }
}