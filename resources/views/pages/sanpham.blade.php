@extends('layout.index')

@section('content')

    <link href="admin_asset/css/bootstrap.min.css" rel="stylesheet">
    <link href="admin_asset/css/shop-homepage.css" rel="stylesheet">
    <link href="admin_asset/css/my.css" rel="stylesheet">
    <link rel="stylesheet" href="admin_asset/mainx.css"> 
<div class="container">
    <div class="row">
        <div class="col-md-3 ">
            <ul class="list-group" id="menu">
                <li href="#" class="list-group-item menu1 active">
                    Menu
                </li>
                @foreach($danhmuc as $dm)
                @if(count($dm->brands) > 0)
                <li href="#" class="list-group-item menu1">
                    {{$dm->name}}
                </li>
                <ul>
                    @foreach($dm->brands as $sp)
                    <li class="list-group-item">
                        <a href="sanpham/{{$sp->id}}">{{$sp->name}}</a>
                    </li>
                     @endforeach
                </ul>
                @endif
                @endforeach
            </ul>
        </div>

        <div class="col-md-9 ">
            <div class="panel panel-default">
                <div class="panel-heading" style="background-color:#7f3e0e; color:white;">
                    <h4><b>{{$sanpham->name}}</b></h4>
                </div>
                @foreach($lsp as $lsp1)
                <div class="row-item row">
                    <div class="col-md-3">

                        <a href="loaisanpham/{{$lsp1->id}}">
                            <br>
                            <img width="200px" height="200px" class="img-responsive" src="admin_asset/img/{{$lsp1->img}}" alt="">
                        </a>
                    </div>

                    <div class="col-md-9">
                        <h3>{{$lsp1->name}}</h3>
                        <a class="btn btn-primary" href="loaisanpham/{{$lsp1->id}}">Chi tiết<span class="glyphicon glyphicon-chevron-right"></span></a>
                    </div>
                    <div class="break"></div>
                </div>
                @endforeach
                {{$lsp->links()}}
            </div>
        </div> 

    </div>

</div>
    <hr>
    <script src="admin_asset/js/jquery.js"></script>
    <script src="admin_asset/js/bootstrap.min.js"></script>
    <script src="admin_asset/js/my.js"></script>


@endsection