@extends('test')
@section("content")


<!--Page Log In  -->
<form action="{{ route('register.post') }}" method="post">
    @csrf
    <div class="modal js-modal">
        <div class="modal-container js-container">

            <header class="modal-header">
                {{$name}}
            </header>

            <div class="modal-body">

                @if(session()->has('success'))
                <div class="alert alert-success">
                    {{session()->get('success')}}
                </div>
                @endif

                @if(session()->has('error'))
                <div class="alert alert-danger">
                    {{session()->get('error')}}
                </div>
                @endif



                <div class="modal-body-2">
                    <label for="emailInput" class="modal-label">
                        <i class="fa-solid fa-user"></i>
                        Họ và tên
                    </label>


                    <input id="emailLog" type="text" name="name" class="modal-input" placeholder="Nguyễn Văn A ...">
                    @if($errors->has('name'))
                    <span class="text-danger">
                        {{$errors->first('name')}}
                    </span>
                    @endif
                </div>


                <div class="modal-body-2">
                    <label for="emailInput" class="modal-label">
                        <i class="fa-solid fa-envelope"></i>
                        Email
                    </label>

                    <input id="emailLog" name="email" type="email" class="modal-input" placeholder="h21@gmail.com ...">
                    @if($errors->has('email'))
                    <span class="text-danger">
                        {{$errors->first('email')}}
                    </span>

                    @endif
                </div>

                <div class="modal-body-2">
                    <label for="emailInput" class="modal-label">
                        <i class="fa-solid fa-envelope"></i>
                        Số điện thoại
                    </label>
                    <input id="emailLog" name="phone" type="number" class="modal-input" placeholder="...">
                    @if($errors->has('phone'))
                    <span class="text-danger">
                        {{$errors->first('phone')}}
                    </span>

                    @endif
                </div>

                <div class="modal-body-2">
                    <label for="emailInput" class="modal-label">
                        <i class="fa-solid fa-calendar-days"></i>
                        Ngày tháng năm sinh
                    </label>
                    <input id="emailLog" name="date_of_birth" type="date" class="modal-input">
                    @if($errors->has('date_of_birth'))
                    <span class="text-danger">
                        {{$errors->first('date_of_birth')}}
                    </span>

                    @endif
                </div>

                <div class="modal-body-2">
                    <label for="emailInput" class="modal-label">
                        <i class="fa-solid fa-location-dot"></i>
                        Địa chỉ
                    </label>
                    <input id="emailLog" name="address" type="text" class="modal-input"
                        placeholder="Đường / Phường / Quận / Thành phố">
                    @if($errors->has('address'))
                    <span class="text-danger">
                        {{$errors->first('address')}}
                    </span>

                    @endif
                </div>

                <div class="modal-body-2">
                    <label for="passLog" class="modal-label">
                        <i class="fa-solid fa-lock"></i>
                        Mật khẩu
                    </label>
                    <input maxlength="30" id="passLog" name="password" type="password" class="modal-input" name=""
                        placeholder="password">
                    @if($errors->has('password'))
                    <span class="text-danger">
                        {{$errors->first('password')}}
                    </span>

                    @endif
                </div>

                <button type="submit" id="log-in"> Đăng kí <i class="ti-check"></i>
                </button>

                <div class="log-register">
                    <p>Nếu bạn đã có tài khoản hãy
                        <a href="/customer/login">Đăng nhập</a>!
                    </p>
                    <p class="modal-help">Need <a href="#"> help?</a></p>
                </div>
            </div>
        </div>
    </div>
</form>
@endsection