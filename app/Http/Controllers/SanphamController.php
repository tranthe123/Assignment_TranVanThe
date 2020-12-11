<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\categories;
use App\brands;

class SanphamController extends Controller
{
    //
    public function getDanhsach()
    {
    	$sanpham = brands::all();
    	return view('admin.sanpham.danhsach',['sanpham'=>$sanpham]);
    }
     public function getSua($id)
    {
    	$danhmuc = categories::all();
    	$sanpham = brands::find($id);
    	return view('admin.sanpham.sua',['sanpham'=>$sanpham,'danhmuc'=>$danhmuc]); 
    }
    public function postSua(Request $request,$id)
    {
    	$sanpham = brands::find($id);
    	$this->validate($request,
    		[
    			'name' => 'required|unique:brands,name|min:3|max:100'
    		],
    		[
    			'name.required' => 'Chưa nhập tên danh mục',
    			'name.unique' => 'Tên thể loại đã tồn tại',
    			'name.min'=>'Độ dài không hợp lệ',
    			'name.max'=>'Độ dài không hợp lệ'
    		]);
    	$sanpham->name = $request->name;
    	$sanpham->id_categorie=$request->danhmuc;
    	$sanpham->save();

    	return redirect('admin/sanpham/sua/'.$id)->with('thongbao','Sửa thành công');
    }


    public function getThem()
    {
    	$danhmuc = categories::all();
    	return view('admin.sanpham.them',['danhmuc'=>$danhmuc]);
    }
    public function postThem(Request $request)
    {
    	$this->validate($request,
    		[
    			'name'=>'required|unique:brands,name|min:3|max:100',
    			'danhmuc'=>'required'
    		],

    		[
    			'name.required'=>'Chưa nhập tên sản phẩm',
    			'name.unique' => 'Tên sản phẩm đã tồn tại',
    			'name.min'=>'Độ dài không hợp lệ',
    			'name.max'=>'Độ dài không hợp lệ',
    			'danhmuc.required'=>'Chưa nhập tên danh mục'
    		]);

    	$sanpham = new brands;
    	$sanpham->name = $request->name;
    	$sanpham->id_categorie=$request->danhmuc;
    	$sanpham->save();

    	return redirect('admin/sanpham/them')->with('thongbao','Thêm thành công');	
    }

    public function getXoa($id)
    {
    	$sanpham = brands::find($id);
    	$sanpham->delete();

    	return redirect('admin/sanpham/danhsach')->with('thongbao','Xóa thành công');
    }

}
