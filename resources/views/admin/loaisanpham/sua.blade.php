@extends('admin.layout.index')

@section('content')
<!-- Page Content -->
<?php use App\categories; ?>
<?php use App\brands; ?>
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Category
                            <small>Edit</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="col-lg-7" style="padding-bottom:120px">
                        @if(count($errors) > 0)
                            <div class="alert alert-danger">
                                @foreach($errors->all() as $err)
                                    {{$err}}<br>
                                @endforeach
                                
                            </div> 
                        @endif

                        @if(session('thongbao'))
                            <div class="alert alert-success">
                                {{session('thongbao')}}
                            </div>
                        @endif
                        <form action="" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="_token" value="{{csrf_token()}}" />
                            <div class="form-group">
                                <label>Danh mục</label>
                                <select class="form-control" id="danhmuc">
                                     @foreach($danhmuc as $danhmuc)
                                     <?php $sp=brands::where('id',$ctsanpham->id_brands)->first(); ?>
                                     <?php $dm=categories::where('id',$sp->id_categorie)->first();?>
                                    <option value="{{$danhmuc->id}}"
                                        @if($danhmuc->id==$dm->id)
                                        selected
                                        @endif
                                        >{{$danhmuc->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                             <div class="form-group" >
                                <label>Category Parent</label>
                                <select class="form-control" name="sanpham" id="sanpham">
                                     @foreach($sanpham as $sanpham)
                                    <option value="{{$sanpham->id}}"
                                        @if($ctsanpham->id_brands==$sanpham->id)
                                        selected
                                        @endif
                                        >{{$sanpham->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input class="form-control" name="name" placeholder="Nhập tên sản phảm" value="{{$ctsanpham->name}}" />
                            </div>
                            <div class="form-group">
                                <label>Hình ảnh</label>
                                <input class="form-control" type="file" name="img" />
                            </div>
                            <button type="submit" class="btn btn-default">Sửa</button>
                            <button type="reset" class="btn btn-default">Đặt lại</button>
                        <form>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

@endsection
@section('script')
    <script>
        $(document).ready(function(){
            $("#danhmuc").change(function(){
                var id_categorie = $(this).val();
                $.get("admin/ajax/sanpham/"+id_categorie,function(data){
                    $("#sanpham").html(data);
                });
            }); 
        });
    </script>
@endsection