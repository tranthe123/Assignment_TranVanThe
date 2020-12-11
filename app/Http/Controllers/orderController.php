<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\order;

class orderController extends Controller
{
    public function getDanhsach()
    {
    	$order = order::all();
    	return view('admin.Khachhang.danhsach',['order'=>$order]);
    }
    public function getThem()
    {
    	$order = order::all();
    	return view('admin.Khachhang.them',['order'=>$order]);
    }
    public function postThem(Request $request)
    {

    	$this->validate($request,
    		[
    			'name'=>'required|min:3|max:100',
    			'email'=>'required',
                'addess'=>'required',
                'phone'=>'required'
    		],

    		[
    			'name.required'=>'Chưa nhập tên khách hàng',
    			'name.min'=>'Độ dài không hợp lệ',
    			'name.max'=>'Độ dài không hợp lệ',
    			'email.required'=>'Chưa nhập email',
                'addess.required'=>'Chưa nhập địa chỉ',
                'phone.required'=>'Chưa nhập số điện thoại'
    		]);

    	$order = new order;
    	$order->name = $request->name;
    	$order->email = $request->email;
    	$order->addess = $request->addess;
    	$order->phone = $request->phone;
    	$order->save();

    	return redirect('admin/Khachhang/them')->with('thongbao','Thêm thành công');	
    }
    
    public function getSua($id)
    {
        $order = order::all();
    	return view('admin.Khachhang.sua',['order'=>$order]); 
    }
    public function postSua(Request $request,$id)
    {
    	$order = order::find($id);
    	$this->validate($request,
    		[
    			'name' => 'required|unique:categories,name|min:3|max:100',
    			'email'=>'required',
                'addess'=>'required',
                'phone'=>'required'
    		],
    		[
    			'name.required' => 'Chưa nhập tên danh mục',
    			'name.unique' => 'Tên thể loại đã tồn tại',
    			'name.min'=>'Độ dài không hợp lệ',
    			'name.max'=>'Độ dài không hợp lệ',
    			'email.required'=>'Chưa nhập email',
                'addess.required'=>'Chưa nhập địa chỉ',
                'phone.required'=>'Chưa nhập số điện thoại'
    		]);
    	$order->name = $request->name;
    	$order->email = $request->email;
    	$order->addess = $request->addess;
    	$order->phone = $request->phone;
    	$order->save();

    	return redirect('admin/Khachhang/sua/'.$id)->with('thongbao','Sửa thành công');
    }
    public function getXoa($id)
    {
    	$order = order::find($id);
    	$order->delete();

    	return redirect('admin/Khachhang/danhsach')->with('thongbao','Xóa thành công');
    }
}
