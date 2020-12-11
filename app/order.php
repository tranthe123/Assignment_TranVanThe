<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class order extends Model
{
    //
    protected $table = "order";

    public function orderdettal()
    {
    	return $this->belongsTo('App\order_dettal','id_order','id');
    }
}
