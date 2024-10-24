<?php

namespace App\Http\Controllers\Admin\Users;


use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function index()
    {
        return view('admin.users.login', [
            'title' => 'Bảng nhập hệ thống',
            'name' => 'Hieu khong ngu'
        ]);
    }

    public function store(Request $request)
    {
        //// $this->validate($request,[
        ////     'email' => 'required|email:filter',
        ////     'password' => 'required'
        //// ]);
        $request->validate([
            'email' => 'required|email:filter',
            'password' => 'required'
        ]);
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
}