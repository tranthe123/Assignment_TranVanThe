<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class products extends Model
{
    //
    protected $table = "products";

    public function brands()
    {
    	return $this->belongsTo('App\brands','id_brands','id');
    }

    public function orderdettal()
    {
    	return $this->hasMany('App\order_dettal','id_product','id');
    }
     public function image()
    {
        return $this->hasMany('App\image_products');
    }
}
