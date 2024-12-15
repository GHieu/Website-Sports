<?php


namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Http\Services\Menu\MenuService;

class Cart extends Model
{

    protected $table = 'carts';
    protected $fillable = [
        'customer_id',
        'product_id',
        'quantity',
        'price',
        'created_at'
    ];
    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }
}