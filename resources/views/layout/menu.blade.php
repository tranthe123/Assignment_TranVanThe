
<div class="container-fluid">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="nav navbar-nav">
			    <li class=" active">
			        <a class="nav-link" class="active" href="#">Trang chủ <span class="sr-only">(current)</span></a>
			    </li> 
			    @foreach($danhmuc as $dm)
				    <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          {{$dm->name}}
				        </a>
				      
				           <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				           	@foreach($dm->brands as $sp)
				                <a class="dropdown-item" href="sanpham/{{$sp->id}}">{{$sp->name}}</a>
				            @endforeach
				           </div>

				    </li>
			    @endforeach
			    <li class="nav-item">
			        <a class="nav-link" href="#">Tư vấn</a>
			    </li> 
			    <li class="nav-item">
			        <a class="nav-link" href="#">Liên hệ</a>
			    </li>   
		    </ul>
		</div>
	</nav>
</div>

