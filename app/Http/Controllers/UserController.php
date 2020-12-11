<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;


class UserController extends Controller
{
    //
    public function getDanhsach()
    {
    	$user = User::all();
    	return view('admin.user.danhsach',['user'=>$user]);
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

    public function getLogout()
    {
        Auth::logout();
        return redirect('admin/dangnhap');
    }


    public function getThem()
    {
    	return view('admin.user.them');
    }
    public function postThem(Request $request)
    {
    	$this->validate($request,
    		[
    			'name'=>'required|min:3|max:100',
    			'email'=>'required|email|unique:users,email',
                'password'=>'required|min:3|max:36',
                'passwordAgain'=>'required|same:password'
    		],

    		[
    			'name.required'=>'Chưa nhập tên người dùng',
    			'name.min'=>'Độ dài không hợp lệ',
    			'name.max'=>'Độ dài không hợp lệ',
    			'email.required'=>'Chưa nhập email',
                'password.required'=>'Chưa nhập password',
                'password.min'=>'Độ dài password không hợp lệ',
                'password.max'=>'Độ dài password không hợp lệ',
                'passwordAgain'=>'Mật khẩu nhập lại phải giống với mật khẩu'
    		]);

    	$user = new User;
    	$user->name = $request->name;
        $user->email = $request->email;
        $user->password = $request->password;
        $user->level = $request->level;
    	$user->save();

    	return redirect('admin/user/them')->with('thongbao','Thêm thành công');	
    }

    public function getXoa($id)
    {
    	$sanpham = brands::find($id);
    	$sanpham->delete();

    	return redirect('admin/sanpham/danhsach')->with('thongbao','Xóa thành công');
    }

    public function getDangnhap()
    {
        return view('admin.login');
    }
    public function postDangnhap(Request $request)
    {
        $this->validate($request,
            [
                'email'=>'required',
                'password'=>'required'
            ],
            [
                'email.required'=>'Bạn chưa nhập e-mail',
                'password.required'=>'Bạn chưa nhập password'
            ]);
        if(Auth::attempt(['email'=>$request->email,'password'=>$request->password]))
        {
            return redirect('admin/danhmuc/danhsach');
        }
        else
        {
            return redirect('admin/dangnhap')->with('thongbao','Sai tài khoản hoặc mật khẩu ');
        }
    }
    public function getDangxuat()
    {
        Auth::logout();
        return redirect('admin/dangnhap');
    }

}
