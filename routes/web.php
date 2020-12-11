<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use App\categories;

Route::get('/','PageController@trangchu', function () {
    return view('pages/trangchu');
});
Route::get('sanpham/{id}','PageController@sanpham',function(){
    return view('pages/sanpham');
});
Route::get('loaisanpham/{id}','PageController@loaisanpham')->name('lsp');

Route::get('dangky','DangkyController@getDangky');
Route::post('dangky/{id}','DangkyController@postDangky')->name('dangky');

Route::post('dangnhap/{id}','DangkyController@postDangnhap')->name('dangnhap');



Route::get('admin/dangnhap','UserController@getDangnhap');
Route::post('admin/dangnhap','UserController@postDangnhap');
Route::get('admin/logout','UserController@getDangxuat');

Route::group(['prefix'=>'admin','middleware'=>['LoginMiddleware']],function(){
	Route::group(['prefix'=>'danhmuc'],function(){
		Route::get('danhsach','AdminController@getDanhsach');

		Route::get('sua/{id}','AdminController@getSua');
		Route::post('sua/{id}','AdminController@postSua');

		Route::get('them','AdminController@getThem');
		Route::post('them','AdminController@postThem');

		Route::get('xoa/{id}','AdminController@getXoa');
	});

	Route::group(['prefix'=>'sanpham'],function(){
		Route::get('danhsach','SanphamController@getDanhsach');

		Route::get('sua/{id}','SanphamController@getSua');
		Route::post('sua/{id}','SanphamController@postSua');

		Route::get('them','SanphamController@getThem');
		Route::post('them','SanphamController@postThem');

		Route::get('xoa/{id}','SanphamController@getXoa');
	});

	Route::group(['prefix'=>'loaisanpham'],function(){
		Route::get('danhsach','ChitietsanphamController@getDanhsach');

		Route::get('sua/{id}','ChitietsanphamController@getSua');
		Route::post('sua/{id}','ChitietsanphamController@postSua');

		Route::get('them','ChitietsanphamController@getThem');
		Route::post('them','ChitietsanphamController@postThem');

		Route::get('xoa/{id}','ChitietsanphamController@getXoa');
	});

	Route::group(['prefix'=>'Khachhang'],function(){
		Route::get('danhsach','orderController@getDanhsach');

		Route::get('sua/{id}','orderController@getSua');
		Route::post('sua/{id}','orderController@postSua');

		Route::get('them','orderController@getThem');
		Route::post('them','orderController@postThem');

		Route::get('xoa/{id}','orderController@getXoa');
	});

	Route::group(['prefix'=>'user'],function(){
		Route::get('danhsach','UserController@getDanhsach');

		Route::get('sua/{id}','UserController@getSua');
		Route::post('sua/{id}','UserController@postSua');

		Route::get('them','UserController@getThem');
		Route::post('them','UserController@postThem');

		Route::get('xoa/{id}','UserController@getXoa');
	});

	Route::group(['prefix'=>'Hoadon'],function(){
		Route::get('danhsach','HoadonController@getDanhsach');

		Route::get('sua/{id}','HoadonController@getSua');
		Route::post('sua/{id}','HoadonController@postSua');

		Route::get('xoa/{id}','HoadonController@getXoa');
	});

	Route::group(['prefix'=>'ajax'],function(){
		Route::get('sanpham/{id_categorie}','AjaxController@getDanhmuc');
	});
});




