 <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">
        Liên hệ
      </button>
      <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-md5 col-lg-5 block-image">
                      <img src="admin_asset/img/thongbao.jpg" class="img-responsive" />
                    </div>
                    <div class="col-md-6 col-lg-6 block-contact">
                        <h3>Xin điền thông tin</h3>
                        <input type="button" value="Đã có tài khoản" class="btn btn-info" id="taikhoan">
                        <input type="button" value="Chưa có tài khoản" class="btn btn-warning" id="taikhoan1">

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
                        <form action="{{route('dangky',$id)}}" method="POST" id="dangky">

                            {{csrf_field()}}
                            <input type="hidden" name="_token" value="{{csrf_token()}}" />
                            <div class="form-group">
                            <label>Họ Tên</label>
                            <input type="text" class="form-control"
                              name="name" placeholder="Nhập họ tên"/>
                            </div>
                             <label>E-mail</label>
                            <div class="form-group">
                              <input type="email" class="form-control"
                              name="email" placeholder="Nhập E-mail"/>
                            </div>
                             <label>Số điện thoại</label>
                            <div class="form-group">
                              <input type="text" class="form-control" name="phone" placeholder="Nhập só điện thoại"/>
                            </div>
                             <label>Địa chỉ</label>
                            <div class="form-group">
                              <input type="text" class="form-control" name="addess" placeholder="Nhập địa chỉ"/>
                            </div>
                            <label>Sản phẩm</label>
                             <div class="form-group">
                              <input type="text" class="form-control" readonly 
                              name="id_product" hidden="" value="{{$lsp->id}}" />
                              <input type="text" class="form-control" readonly 
                              name="sanpham" placeholder="Nhập sản phẩm" value="{{$lsp->name}}" />
                            </div>
                            <button type="submit" class="btn btn-success pull-left">Gửi</button>
                        </form>
                        <form action="{{route('dangnhap',$id)}}" method="POST" id="dangnhap" style="display:none;">

                            {{csrf_field()}}
                            <input type="hidden" name="_token" value="{{csrf_token()}}" />
                             <label>E-mail</label>
                            <div class="form-group">
                              <input type="email" class="form-control"
                              name="email" placeholder="Nhập E-mail"/>
                            </div>
                            <div class="form-group">
                              <input type="text" class="form-control" readonly
                              name="sanpham" placeholder="Nhập sản phẩm" value="{{$lsp->name}}" />
                            </div>
                            <button type="submit" class="btn btn-success pull-left">Gửi</button>
                        </form>
                    </div>

                </div>
            </div>
          </div>
        </div>
      </div>
      <script>
        $(document).ready(function(){
          $('#taikhoan').click(function(){
            $('#dangky').css('display','none');
            $('#dangnhap').css('display','block');
          });
          $('#taikhoan1').click(function(){
            $('#dangky').css('display','block');
            $('#dangnhap').css('display','none');
          });
        });
      </script>