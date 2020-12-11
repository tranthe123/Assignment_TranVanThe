     @extends('admin.layout.index')

 @section('content')
 <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Loại sản phẩm
                            <small>Thêm</small>
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
                        <form action="admin/loaisanpham/them" method="POST" enctype="multipart/form-data">
                             <input type="hidden" name="_token" value="{{csrf_token()}}" />
                            <div class="form-group">
                                <label>Danh mục</label>
                                <select class="form-control" name="danhmuc" id="danhmuc">
                                    @foreach($danhmuc as $danhmuc)
                                    <option value="{{$danhmuc->id}}">{{$danhmuc->name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sản phẩm</label>
                                <select class="form-control" name="sanpham" id="sanpham">
                                    @foreach($sanpham as $sanpham)
                                    <option value="{{$sanpham->id}}">{{$sanpham->name}}</option>
                                    @endforeach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Nhập tên sản phẩm</label>
                                <input class="form-control" name="name" placeholder="Nhập tên sản phảm" value=" " />
                            </div>
                            <div class="form-group">
                                <label>Hình ảnh</label>
                                <input class="form-control" type="file" name="img" />
                            </div>
                            
                            <button type="submit" class="btn btn-default">Thêm</button>
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