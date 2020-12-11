@extends('layout.index')

@section('content')
<div class="container">
    </nav>
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="carouselExampleControls" data-slide-to="0" class="active"></li>
            <li data-target="carouselExampleControls" data-slide-to="1"></li>
            <li data-target="carouselExampleControls" data-slide-to="2"></li>
            <li data-target="carouselExampleControls" data-slide-to="3"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="admin_asset/img/slide1.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="admin_asset/img/slide2.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
                 <img class="d-block w-100" src="admin_asset/img/slide3.jpg" alt="Third slide">
            </div>
            <div class="carousel-item">
                 <img class="d-block w-100" src="admin_asset/img/slide4.jpg" alt="ford slide">
            </div>
           
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
 
    </div>
</div>
<div class="container">
	<h2 style="text-align: center; color: #7f3e0e; padding-top: 10px;border-bottom: 2px solid #7f3e0e;font-style: bold;font-size: 25px">CÁC DỰ ÁN THIẾT KẾ NỘI THẤT &amp; KIẾN TRÚC</h2>
	<div class="noidung">
		@foreach($danhmuc as $dm)
			@if(count($dm->brands) > 0)
    	<div class="noidung1">
    		<div class="title1">
    			<h3 style=" background: #7f3e0e;color: white;font-style: bold;padding-left: 12px;">{{$dm->name}}</h3>
    		</div>
    		<ul>
    			@foreach($dm->brands as $sp)
    			<li>
    				<a href="sanpham/{{$sp->id}}">{{$sp->name}}</a>
    			</li>
    	        @endforeach
    		</ul>
    	</div>
    		@endif
    	@endforeach
    </br>
    </div>
</div>
<div class="container">
    <h2 style="text-align: center; color: #7f3e0e; padding-top: 10px;border-bottom: 2px solid #7f3e0e;font-style: bold;font-size: 25px">CÁC CÔNG TRÌNH THIẾT KẾ NỘI THẤT HOT</h2>   
    <div class="panel-body">
        @foreach($danhmuc as $dm)
        <div class="row-item row">
            <h3>
                <a style="color: #7f3e0e;">{{$dm->name}}</a> | 
                @foreach($dm->brands as $sp)
                <small><a style="color: #7f3e0e;" href="sanpham/{{$sp->id}}"><i>{{$sp->name}}</i></a>/</small>
                @endforeach
            </h3>
            <?php 
            $data=$sp->products->take(5);

            ?>
            @foreach($data->all() as $lsp)
            <div class="col-md-6 ">
                <div class="col-md-6">
                    <a href="loaisanpham/{{$lsp['id']}}">
                        <img class="img-responsive" src="admin_asset/img/{{$lsp->img}}" alt="">
                    </a>
                </div>

                <div style="" class="col-md-6">
                    <h3>{{$lsp['name']}}</h3>
                    <p>{{$lsp['name']}}</p>
                    <a  class="btn btn-primary" href="loaisanpham/{{$lsp['id']}}">Chi tiết<span class="glyphicon glyphicon-chevron-right"></span></a>
                </div>

            </div>
            @endforeach
        </div>
        @endforeach
    </div>
</div>
@endsection