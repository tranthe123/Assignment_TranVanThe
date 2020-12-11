 @extends('admin.layout.index')

 @section('content')
 <!-- Page Content -->
 <?php use App\order; ?>
 <?php use App\products; ?>
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Danh mục
                            <small>Danh sách</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    @if(session('thongbao'))
                            <div class="alert alert-success">
                                {{session('thongbao')}}
                            </div>
                    @endif
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr align="center">
                                <th>ID</th>
                                <th>Tên khách hàng</th>
                                <th>Loại hình</th>
                                <th>Delete</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($Hoadon as $hd)
                            <tr class="odd gradeX" align="center">
                                <td>{{$hd->id}}</td>
                                <?php $ten=order::where('id',$hd->id_order)->first(); ?>
                                <td>{{$ten->name}}</td>
                                <?php $sp=products::where('id',$hd->id_product)->first(); ?>
                                <td>{{$sp->name}}</td>
                                <td class="center"><i class="fa fa-trash-o fa-fw"></i><a href="admin/Hoadon/xoa/{{$hd->id}}"> Delete</a></td>
                                <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="admin/Hoadon/sua/{{$hd->id}}">Edit</a></td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

 @endsection