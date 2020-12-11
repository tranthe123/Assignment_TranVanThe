<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\categories;
use App\brands;
use App\products;
use App\image_product;

class PageController extends Controller
{
    //
    function __construct()
    {
    	$danhmuc = categories::all();
    	view()->share('danhmuc',$danhmuc);
    }
    function trangchu()
    {
        $danhmuc = categories::all();
    	return view('pages.trangchu');
    }
    function sanpham($id)
    { 
        $sanpham = brands::find($id);
        $lsp = products::where('id_brands',$id)->paginate(4);
        return view('pages.sanpham',['sanpham'=>$sanpham,'lsp'=>$lsp]); 
    }
    function loaisanpham($id)
    {
        $img = image_product::where('product_id',$id)->get();
        $lsp = products::find($id);
        $splq = products::where('id_brands',$lsp->id_brands)->take(4)->get();
        return view('pages.chitietsanpham',['lsp'=>$lsp,'splq'=>$splq,'img'=>$img,'id'=>$id]);
    }
}
