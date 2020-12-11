@extends('layout.index')
@section('content')
<link href="admin_asset/css/bootstrap.min.css" rel="stylesheet">
 <link href="admin_asset/css/shop-homepage.css" rel="stylesheet">
 <link href="admin_asset/my.css" rel="stylesheet">
 <script src="admin_asset/js/jquery.js"></script>
<script src="admin_asset/js/bootstrap.min.js"></script>
<script src="admin_asset/js/my.js"></script>
 <link rel="stylesheet" href="admin_asset/mainx.css"> 
<div class="container">
    <div class="row">
        <div class="col-lg-9">
            <h1>{{$lsp->name}}</h1>
            <p class="lead">
                <a href="loaisanpham/{{$lsp->id}}">{{$lsp->name}}</a>
            </p>
            <div class="col-lg-6">
                <img src="admin_asset/img/{{$lsp->img}}" width="350" id="mian-img" />
                <p>
                    @foreach($img as $imgs)
                    <img src="admin_asset/img/{{$imgs->img}}" width="90" />
                    @endforeach
                </p>
                <script src="js/jquery-3.5.1.js"></script>
                <script>
                    $(()=>{
                        $('p img').click(function(){
                            let imgPath = $(this).attr('src');
                            $('#mian-img').attr('src', imgPath);
                        })
                    })
                </script>
            </div>
            <div col-lg-6>
                <p><span class="glyphicon glyphicon-time"></span> Posted on: {{$lsp->created_at}}</p>
                 <div class="row">
                    <p class="lead">
                        {{$lsp->title}}
                    </p>
                    @include('pages.dangky')
    </div>
            </div>
            <div style="padding-top: 100px;" class="comment">
                <div class="well">
                <h4>Viết bình luận ...<span class="glyphicon glyphicon-pencil"></span></h4>
                <form role="form">
                    <div class="form-group">
                        <textarea class="form-control" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Gửi</button>
                </form>
                </div>
            <div class="media">
                <a class="pull-left" href="#">
                    <img class="media-object" src="http://placehold.it/64x64" alt="">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">Bình luận
                        <small>August 25, 2014 at 9:30 PM</small>
                    </h4>
                </div>
            </div>
            </div>
                
        </div>


        <!-- Blog Sidebar Widgets Column -->
        <div class="col-md-3">

            <div class="panel panel-default">
                <div class="panel-heading"><b>Sản phẩm liên quan</b></div>
                <div class="panel-body">

                    @foreach($splq as $ctsp)
                    <div class="row" style="margin-top: 10px;">
                        <div class="col-md-5">
                            <a href="loaisanpham/{{$ctsp->id}}">
                                <img class="img-responsive" src="admin_asset/img/{{$ctsp->img}}" alt="">
                            </a>
                        </div>
                        <div class="col-md-7">
                            <a href="loaisanpham/{{$ctsp->id}}"><b>{{$ctsp->name}}</b></a>
                        </div>
                        <div class="break"></div>
                    </div>
                    @endforeach    
                </div>
            </div>
        </div>

    </div>
</div>
@if(session('thongbao'))
    <script>
        $(document).ready(function(){
            alert('thêm thành công');
        });
    </script>
    <?php Session::forget('thongbao') ?>
@endif
@endsection
