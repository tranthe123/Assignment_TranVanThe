<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\categories;
use App\brands;
use App\products;

class AjaxController extends Controller
{
	public function getDanhmuc($id_categorie)
	{
		$sanpham = brands::where('id_categorie',$id_categorie)->get();
		foreach($sanpham as $sanpham)
		{
			 echo "<option value=".$sanpham->id.">".$sanpham->name."</option>";
		}
	}
}