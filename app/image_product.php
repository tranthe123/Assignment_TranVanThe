<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class image_product extends Model
{
    protected $table = "image_products";

    public function imageproduct()
    {
    	return $this->belongsTo('App\products','product_id');
    }
}
