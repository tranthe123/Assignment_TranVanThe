<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\categories;


class AdminController extends Controller
{
    //
    public function getDanhsach()
    {
    	$danhmuc = categories::all();
    	return view('admin.danhmuc.danhsach',['danhmuc'=>$danhmuc]);
    }
     public function getSua($id)
    {
        $danhmuc = categories::all();
    	return view('admin.danhmuc.sua',['danhmuc'=>$danhmuc]); 
    }
    public function postSua(Request $request,$id)
    {
    	$danhmuc = categories::find($id);
    	$this->validate($request,
    		[
    			'name' => 'required|unique:categories,name|min:3|max:100'
    		],
    		[
    			'name.required' => 'Chưa nhập tên danh mục',
    			'name.unique' => 'Tên thể loại đã tồn tại',
    			'name.min'=>'Độ dài không hợp lệ',
    			'name.max'=>'Độ dài không hợp lệ'
    		]);
    	$danhmuc->name = $request->name;
    	$danhmuc->save();

    	return redirect('admin/danhmuc/sua/'.$id)->with('thongbao','Sửa thành công');
    }


    public function getThem()
    {
    	return view('admin.danhmuc.them');
    }
    public function postThem(Request $request)
    {
    	$this->validate($request,
    		[
    			'name'=>'required|unique:categories,name|min:3|max:100'
    		],

    		[
    			'name.required'=>'Chưa nhập tên danh mục',
    			'name.unique' => 'Tên thể loại đã tồn tại',
    			'name.min'=>'Độ dài không hợp lệ',
    			'name.max'=>'Độ dài không hợp lệ'
    		]);

    	$danhmuc = new categories;
    	$danhmuc->name = $request->name;
    	$danhmuc->save();

    	return redirect('admin/danhmuc/them')->with('thongbao','Thêm thành công');	
    }

    public function getXoa($id)
    {
    	$danhmuc = categories::find($id);
    	$danhmuc->delete();

    	return redirect('admin/danhmuc/danhsach')->with('thongbao','Xóa thành công');
    }

}
