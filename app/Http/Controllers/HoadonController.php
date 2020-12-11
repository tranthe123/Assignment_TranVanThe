<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\order;
use App\order_dettal;

class HoadonController extends Controller
{
   public function getDanhsach()
    {
    	$Hoadon = order_dettal::all();
    	return view('admin.Hoadon.danhsach',['Hoadon'=>$Hoadon]);
    }
     public function getSua($id)
    {
    	$order = order::all();
    	$Hoadon = order_dettal::find($id);
    	return view('admin.Hoadon.sua',['Hoadon'=>$Hoadon,'order'=>$order]); 
    }
    public function postSua(Request $request,$id)
    {
    	$Hoadon = order_dettal::find($id);
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
    	$Hoadon->name = $request->name;
    	$Hoadon->id_order=$request->order;
    	$Hoadon->save();

    	return redirect('admin/Hoadon/sua/'.$id)->with('thongbao','Sửa thành công');
    }

    public function getXoa($id)
    {
    	$Hoadon = order_dettal::find($id);
    	$Hoadon->delete();

    	return redirect('admin/sanpham/danhsach')->with('thongbao','Xóa thành công');
    }
}
