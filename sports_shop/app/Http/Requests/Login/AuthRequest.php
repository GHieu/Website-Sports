<?php

namespace App\Http\Requests\Login;

use Illuminate\Foundation\Http\FormRequest;

class AuthRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'email' => 'required|email:filter',
            'password' => 'required',
        ];
    }

    public function messages(): array
    {
        return [
            'email.required' => 'Bạn chưa điền email',
            'email.email' => 'Email không đúng định dạng',
            'password.required' => 'Bạn chưa điền password'
        ];
    }
}