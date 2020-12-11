 @extends('admin.layout.index')

 @section('content')
 <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Khách hàng
                            <small>Danh sách</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr align="center">
                                <th>ID</th>
                                <th>Name</th>
                                <th>E-mail</th>
                                <th>Địa chỉ</th>
                                <th>Số điện thoại</th>
                                <th>Delete</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($order as $or)
                            <tr class="odd gradeX" align="center">
                                <td>{{$or->id}}</td>
                                <td>{{$or->name}}</td>
                                <td>{{$or->email}}</td>
                                <td>{{$or->addess}}</td>
                                <td>{{$or->phone}}</td>
                                <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="admin/Khachhang/xoa/{{$or->id}}">Delete</a></td>
                                <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="admin/Khachhang/sua/{{$or->id}}">Edit</a></td>
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