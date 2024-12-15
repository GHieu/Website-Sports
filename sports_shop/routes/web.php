<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\LoginController;
use App\Http\Controllers\Admin\MenuController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\UploadController;
use App\Http\Middleware\AuthenticateMiddleware;
use App\Http\Controllers\Admin\MainController;
use App\Http\Middleware\LogginMiddleware;


Route::get('login', [LoginController::class, 'index'])->name('login');
Route::post('login/store', [LoginController::class, 'store']);
Route::middleware(['auth'])->group(function () {



    Route::prefix('admin')->group(function () {
        Route::get('admin/logout', [LoginController::class, 'logout'])->name('logout');

        Route::get('/', [MainController::class, 'index'])->name('admin');
        Route::get('main', [MainController::class, 'index'])->middleware(AuthenticateMiddleware::class);

        #menu
        Route::prefix('menus')->group(function () {
            Route::get('add', [MenuController::class, 'create']);
            Route::post('add', [MenuController::class, 'store']);
            Route::get('list', [MenuController::class, 'index']);
            Route::get('edit/{menu}', [MenuController::class, 'fix']);
            Route::post('edit/{menu}', [MenuController::class, 'update2']);
            Route::DELETE('destroy', [MenuController::class, 'destroy']);
        });

        #product
        Route::prefix('products')->group(function () {
            Route::get('add', [ProductController::class, 'create']);
            Route::post('add', [ProductController::class, 'store']);
            Route::get('list', [ProductController::class, 'index']);
            Route::get('edit/{product}', [ProductController::class, 'fix']);
            Route::post('edit/{product}', [ProductController::class, 'update2']);
            Route::DELETE('destroy', [ProductController::class, 'destroy']);
        });
        Route::post('upload/services', [UploadController::class, 'store2']);

        #cart
        Route::get('carts/list', [App\Http\Controllers\Admin\CartController::class, 'index'])->name('admin.cart.list');
        Route::get('carts/view/{customer}', [App\Http\Controllers\Admin\CartController::class, 'viewDetails']);
    });

});



Route::get('/', [App\Http\Controllers\Customer\MainController::class, 'index'])->name('home');
Route::middleware(['web'])->group(function () {
    Route::post('/services/load-product', [App\Http\Controllers\Customer\MainController::class, 'loadProduct']);
    Route::get('danh-muc/{id}-{slug}.html', [App\Http\Controllers\Customer\MenuController2::class, 'index']);
    Route::get('san-pham/{id}-{slug}.html', [App\Http\Controllers\Customer\ProductController2::class, 'index']);
    Route::post('add-cart', [App\Http\Controllers\Customer\CartController2::class, 'index']);
    Route::get('carts', [App\Http\Controllers\Customer\CartController2::class, 'show']);
    Route::post('update-cart', [App\Http\Controllers\Customer\CartController2::class, 'update']);
    Route::get('carts/remove/{id}', [App\Http\Controllers\Customer\CartController2::class, 'remove']);
    Route::post('carts', [App\Http\Controllers\Customer\CartController2::class, 'buy'])->name('buyCarts');
});

Route::get('customer/login', [App\Http\Controllers\Customer\LoginController::class, 'login'])->name('customer.login');
Route::post('customer/login/post', [App\Http\Controllers\Customer\LoginController::class, 'loginPost'])->name('login.post');
Route::get('customer/logout', [App\Http\Controllers\Customer\LoginController::class, 'signOut'])->name('customer.signout');

// Route đăng ký
Route::get('customer/register', [App\Http\Controllers\Customer\LoginController::class, 'register'])->name('register');
Route::post('customer/register/post', [App\Http\Controllers\Customer\LoginController::class, 'registerPost'])->name('register.post');


Route::get('/products/search', [App\Http\Controllers\Customer\ProductController2::class, 'search'])->name('products.search');