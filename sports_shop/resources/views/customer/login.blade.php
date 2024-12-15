@extends("test")

@section("content")


<!--Page Log In  -->
<form action="{{ route('login.post') }}" method="post">
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
                        Email
                    </label>
                    <input id="emailLog" type="email" name="email" class="modal-input" placeholder="Email">
                    @if ($errors->has('email'))
                    <span class="error-message">{{$errors->first('email')}}*</span>
                    @endif
                    <div class="error-message" id="mailLogErrorMessage"></div>
                </div>



                <div class="modal-body-2">
                    <label for="passLog" class="modal-label">
                        <i class="fa-solid fa-lock"></i>
                        Mật khẩu
                    </label>
                    <input maxlength="30" id="passLog" type="password" class="modal-input" name="password"
                        placeholder="Password">
                    @if ($errors->has('password'))
                    <span class="error-message">{{$errors->first('password')}}*</span>
                    @endif

                    <div class="error-message" id="passLogErrorMessage"></div>
                </div>

                <p>This site is protected by reCAPTCHA and the Google <a
                        href="https://policies.google.com/privacy">Privacy Policy</a> and <a
                        href="https://policies.google.com/terms">Terms of Service</a> apply.</p>

                <button type="submit" id="log-in"> Đăng nhập <i class="ti-check"></i>
                </button>

                <div class="log-register">
                    <p>Nếu bạn chưa có tài khoản hãy
                        <a href="/customer/register">Đăng ký</a>!
                    </p>
                    <p class="modal-help">Need <a href="#"> help?</a></p>
                </div>
            </div>
        </div>
    </div>
</form>

@endsection