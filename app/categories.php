<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class categories extends Model
{
    //
    protected $table = "categories";

    public function brands()
    {
    	return $this->hasMany('App\brands','id_categorie','id'); 
    }

    public function products()
    {
    	return $this->hasManyThrough('App\products','App\brands','id_categorie','id_brands','id');
    }
}
