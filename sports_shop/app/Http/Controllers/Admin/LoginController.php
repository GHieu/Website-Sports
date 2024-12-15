<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Http\Request;
use App\Http\Requests\Login\AuthRequest;
class LoginController extends Controller
{
    public function index()
    {
        if (Auth::id() > 0) {
            return redirect()->route('admin');
        }
        return view('admin.login', [
            'title' => 'LOGIN ADMIN',
            'name' => 'LOGIN ADMIN'
        ]);
    }

    public function store(AuthRequest $request)
    {
        if (
            Auth::attempt([
                'email' => $request->input('email'),
                'password' => $request->input('password')
            ], $request->input('remember'))
        ) {
            return redirect()->route('admin');
        }
        session()->flash('error', 'Email hoặc password không đúng');
        return redirect()->back();
    }


    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect()->route('login');
    }
}