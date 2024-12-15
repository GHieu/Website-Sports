<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Http\Requests\Login\AuthRequest;
use App\Models\User;
use App\Models\Customer;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class LoginController extends Controller
{
    public function login()
    {
        return view("customer.login", [
            'title' => 'Đăng nhập',
            'name' => 'Đăng nhập tài khoản'
        ]);
    }

    function loginPost(AuthRequest $request)
    {
        $request->validate([
            'email' => "required",
            'password' => "required",
        ]);
        $credentials = $request->only("email", "password");

        if (Auth::guard('customer')->attempt($credentials)) {
            // Đăng nhập thành công, lưu tên người dùng vào session
            $user = Auth::guard('customer')->user();
            session(['name' => $user->name]); // Lưu tên người dùng
            return redirect()->route("home"); // Chuyển đến trang chính
        }

        return redirect(route("customer.login"))
            ->with("error", "Email hoặc mật khẩu không hợp lệ");
    }

    public function signOut()
    {
        Auth::guard('customer')->logout();
        session()->forget('name'); // Xóa tên khỏi session
        return redirect()->route('home');
    }


    function register()
    {
        return view("customer.register", [
            'title' => 'Đăng kí',
            'name' => 'Đăng kí tài khoản'
        ]);
    }

    function registerPost(Request $request)
    {

        $request->validate([
            "name" => "required",
            "email" => "required|email|unique:customers,email",
            "password" => "required|min:6|max:10",
            "phone" => "required|regex:/^[0-9]{10}$/",
            "address" => "required",
            "date_of_birth" => "required|date"
        ], [
            "name.required" => "Bạn chưa điền họ và tên*",
            "email.required" => "Bạn chưa điền email*",
            "email.email" => "Email không đúng định dạng*",
            "email.unique" => "Email này đã được sử dụng*",
            "password.required" => "Bạn chưa điền mật khẩu*",
            "password.min" => "Mật khẩu phải có ít nhất 6-10 chữ số.",
            // "password.confirmed" => "Mật khẩu xác nhận không khớp.",
            "phone.required" => "Bạn chưa điền số điện thoại*",
            "phone.regex" => "Số điện thoại không hợp lệ.",
            "address.required" => "Bạn chưa điền địa chỉ*",
            "date_of_birth.required" => "Bạn chưa chọn ngày tháng năm*"
        ]);

        try {
            $user = new Customer();
            $user->name = $request->name; // gán gtrị ng dùng        
            $user->email = $request->email;
            $user->password = Hash::make($request->password);
            $user->phone = $request->phone;
            $user->address = $request->address;
            $user->date_of_birth = $request->date_of_birth;
            $user->save();

            return redirect(route("customer.login"))->with("success", "Tạo tài khoản thành công");

        } catch (\Illuminate\Database\QueryException $exception) {
            if ($exception->errorInfo[1] == 1062) { // Mã lỗi 1062: Duplicate entry
                return redirect()->back()->with('error', 'Email này đã được sử dụng.');
            }
            throw $exception;
        }
    }
}