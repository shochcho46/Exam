<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductVariant extends Model
{

    protected $fillable = [
        'variant', 'variant_id', 'product_id'
    ];


    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function variant()
    {
        return $this->belongsTo(Variant::class);
    }


    public function productVariantPrices()
    {
        return $this->hasMany(ProductVariantPrice::class);
    }

}
