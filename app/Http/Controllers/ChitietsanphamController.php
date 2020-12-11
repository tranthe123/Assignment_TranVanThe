<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use App\categories;
use App\brands;
use App\products;

class ChitietsanphamController extends Controller
{
    //
    public function getDanhsach()
    {
    	$ctsanpham = products::all();
    	return view('admin.loaisanpham.danhsach',['ctsanpham'=>$ctsanpham]);
    }
     public function getSua($id)
    {
    	$danhmuc = categories::all();
        $sanpham = brands::all();
    	$ctsanpham = products::find($id);
    	return view('admin.loaisanpham.sua',['ctsanpham'=>$ctsanpham,'danhmuc'=>$danhmuc,'sanpham'=>$sanpham]); 
    }
    public function postSua(Request $request,$id)
    {
    	$ctsanpham = products::find($id);
    	$this->validate($request,
    		[
    			'name' => 'required|min:3|max:100'
    		],
    		[
    			'name.required' => 'Chưa nhập tên danh mục',
    			/*'name.unique' => 'Tên thể loại đã tồn tại',*/
    			'name.min'=>'Độ dài không hợp lệ',
    			'name.max'=>'Độ dài không hợp lệ'
    		]);

    	$ctsanpham->name = $request->name;
    	$ctsanpham->id_brands=$request->sanpham;

        if($request->hasFile('img'))
        {
            $img= $request->file('img');
            File::delete(public_path('admin_asset/img/'.$ctsanpham->img));
            $filename=time().'.'.$img->getClientOriginalExtension();
            $img->move(public_path('admin_asset/img'),$filename);
            $ctsanpham->img=$filename;
            $ctsanpham->save();
        }
        else
        {
            $ctsanpham ->img = "";
        }
    	$ctsanpham->save();

    	return redirect('admin/loaisanpham/sua/'.$id)->with('thongbao','Sửa thành công');
    }


    public function getThem()
    {
    	$danhmuc = categories::all();
        $sanpham = brands::all();
    	return view('admin.loaisanpham.them',['danhmuc'=>$danhmuc,'sanpham'=>$sanpham]);
    }
    public function postThem(Request $request)
    {

    	$this->validate($request,
    		[
    			'name'=>'required|min:3|max:100',
    			'danhmuc'=>'required',
                'sanpham'=>'required'
    		],

    		[
    			'name.required'=>'Chưa nhập tên sản phẩm',
    			'name.min'=>'Độ dài không hợp lệ',
    			'name.max'=>'Độ dài không hợp lệ',
    			'danhmuc.required'=>'Chưa nhập tên danh mục',
                'sanpham.required'=>'Chưa nhập tên sản phẩm'
    		]);

    	$ctsanpham = new products;
    	$ctsanpham->name = $request->name;
    	$ctsanpham->id_brands=$request->sanpham;

        if($request->hasFile('img'))
        {
           $img= $request->file('img');
            $filename=time().'.'.$img->getClientOriginalExtension();
            $img->move(public_path('admin_asset/img'),$filename);
            $ctsanpham->img=$filename;
        }
        else
        {
            $ctsanpham ->img = "";
        }

    	$ctsanpham->save();

    	return redirect('admin/loaisanpham/them')->with('thongbao','Thêm thành công');	
    }

    public function getXoa($id)
    {
    	$ctsanpham = products::find($id);
    	$ctsanpham->delete();

    	return redirect('admin/loaisanpham/danhsach')->with('thongbao','Xóa thành công');
    }

}
