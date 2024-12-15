<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class CheckLoginMiddleware
{
    public function handle($request, Closure $next)
    {
        if (!Auth::check()) {
            session(['url.intended' => url()->full()]);
            return redirect('/customer/login')->with('error', 'Vui lòng đăng nhập để tiếp tục.');
        }

        return $next($request);
    }

}