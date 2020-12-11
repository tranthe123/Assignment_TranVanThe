<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class order_dettal extends Model
{
    //
    protected $table = "order_dettal";

    public function products()
    {
    	return $this->belongsTo('App\products','id_product','id');
    }
    public function order()
    {
    	return $this->belongsTo('App\order','id_orders','id');
    }
}
