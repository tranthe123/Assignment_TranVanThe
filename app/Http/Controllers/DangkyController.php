<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\order;
use App\order_dettal;

class DangkyController extends Controller
{
    public function getDangky()
    {
    	return view('/');
    }
    public function postDangky(Request $request,$id)
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
    			'phone.required'=>'Chưa nhập số điện thoại',
    		]);
    	$order = new order;
    	$order->name = $request->input('name');
    	$order->email = $request->input('email');
    	$order->addess = $request->input('addess');
    	$order->phone = $request->input('phone');
    	$order->save();
        $order_dettal = new order_dettal;
        $order_dettal->id_order= $order->id;
        $order_dettal->id_product=$request->input('id_product');
        $order_dettal->save();
        $request->session()->put('thongbao','thanhcong');
    	return redirect()->route('lsp',$id);	
    }

    public function postDangnhap(Request $request,$id)
    {
        $this->validate($request,
            [
                'email'=>'required'
            ],

            [
                'email.required'=>'Chưa nhập email'
            ]);
        $order =order::where('email',$request->email)->first();
        if(!empty($order))
        {
            $order_dettal = new order_dettal;
            $order_dettal->id_order= $order->id;
            $order_dettal->id_product=$id;
            $order_dettal->save();
        }
        $request->session()->put('thongbao','thanhcong');
        return redirect()->route('lsp',$id);    
    }
}
