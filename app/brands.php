<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class brands extends Model
{
    //
    protected $table = "brands";

    public function categorie()
    {
    	return $this->belongsTo('App\categorie','id_categorie','id');
    }
    public function products()
    {
    	return $this->hasMany('App\products','id_brands','id');
    }
}
