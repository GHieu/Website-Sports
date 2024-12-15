<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;
class Customer extends Authenticatable
{

    protected $table = 'customers';
    protected $fillable = [
        'name',
        'address',
        'email',
        'password',
        'date_of_birth',
        'phone',
        'note'
    ];

    public function carts()
    {
        return $this->hasMany(\App\Models\Cart::class, 'customer_id', 'id');
    }

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}