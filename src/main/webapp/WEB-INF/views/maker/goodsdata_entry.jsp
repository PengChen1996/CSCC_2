<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsdata_entry.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link type="text/css" rel="stylesheet" href="${__static__}/jedate/skin/jedate.css">
	<script type="text/javascript" src="${__static__}/jedate/jedate.js"></script>
	<link rel="stylesheet" href="${__static__}/cropbox/cropimg.css" type="text/css" />
	<script type="text/javascript" src="${__static__}/bootstrap3/js/jquery2.1.4.min.js"></script> 
	<link rel="stylesheet" href="${__static__}/bootstrap3/css/bootstrap.min.css" type="text/css">
  	<script type="text/javascript" src="${__static__}/bootstrap3/js/bootstrap.min.js"></script>
  	<script type="text/javascript">
  		function entry_parts(){
	  		$.ajax({
	  			url:"maker/partsdata_entry",
  				data:$("#form_parts").serialize(),
  				type:"post",
  				success:function(){
  					alert("success!");
  					var oldparts_num = $("#goods_material").val();
  					var newparts_num = $("#parts_id").val();
  					$("#goods_material").val(oldparts_num+"@"+newparts_num);
  					var parts_num = "";
		    		for(var i=0;i<11;i++){
		 				parts_num += parseInt(Math.random()*9.9);   		
		    		}
		    		$("#parts_id").val("#P"+parts_num);
  					/* window.location.href = window.location.href; */
  				},
  				error:function(){
  					alert("error");
  				}
	  		});
  		}
  	</script>
  </head>
  <body>
  	<div class="container-fluid">
  		<br>
  		<div class="row">
  		<div class="col-sm-6">
		    <form class="form-horizontal" action="maker/goodsdata_entry" method="post" enctype="multipart/form-data">
		    	<div class="form-group">
		    		<label class="col-sm-4 control-label">产品图片</label>
				    <div class="col-sm-8">
					    <div class="goodspic">
				   		<img alt="图片" src="${__static__}/cropbox/001.jpg" class="img-rounded" style="width:270px;height:200px;">
					   	</div>
					   	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#goodsModal" style="width:270px;">
							上传图片
						</button>
					</div>
			  	</div>
		    	<div class="form-group">
				    <label class="col-sm-4 control-label">产品图片</label>
				    <div class="col-sm-8">
				    	<input type="text" class="form-control" id="goods_picture" name="goodsPicture" placeholder="产品图片">
				    </div>
			  	</div>
		    	<div class="form-group">
				    <label class="col-sm-4 control-label">产品编号</label>
				    <div class="col-sm-8">
				    	<input type="text" class="form-control" id="goods_id" name="goodsId" placeholder="产品编号">
				    </div>
			  	</div>
		    	<div class="form-group">
				    <label class="col-sm-4 control-label">产品名称</label>
				    <div class="col-sm-8">
				    	<input type="text" class="form-control" name="goodsName" placeholder="产品名称">
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-4 control-label">产品价格</label>
				    <div class="col-sm-8">
				    	<input type="text" class="form-control" name="goodsPrice" placeholder="产品名称">
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-4 control-label">保质期</label>
				    <div class="col-sm-8">
				    	<input type="text" class="form-control" name="qualityGuarantee" placeholder="产品名称">
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-4 control-label">生产时间</label>
				    <div class="col-sm-8">
				    	<input type="text" class="form-control" id="goodsdate" name="productionTime" placeholder="生产时间">
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-4 control-label">生产地点</label>
				    <div class="col-sm-8">
				    	<input type="text" class="form-control" name="productionArea" placeholder="生产地点">
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-4 control-label">产品构成</label>
				    <div class="col-sm-8">
				    	<input type="text" class="form-control" id="goods_material" name="goodsMaterial" placeholder="产品构成">
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-4 control-label">产品描述</label>
				    <div class="col-sm-8">
				    	<textarea class="form-control" name="goodsDescription" rows="5"></textarea>
				    </div>
			  	</div>
			  	 <div class="form-group">
				    <div class="col-sm-offset-4 col-sm-8">
				      <button type="submit" class="btn btn-default">提交</button>
				    </div>
			  	</div>
			  	<%-- 产品编号：<input type="text"  name="goodsId"><br>
		    	产品名称：<input type="text" name="goodsName"><br>
		    	产品图片：<input type="text" id="goods_picture" name="goodsPicture"><br>
		    	<div class="goodspic">
		   		<img alt="图片" src="${__static__}/cropbox/001.jpg" class="img-rounded" style="width:270px;height:200px;">
			   	</div>
			   	<button type="button" data-toggle="modal" data-target="#goodsModal">
					上传图片
				</button>
				<br>
		    	产品价格：<input type="text" name="goodsPrice"><br>
		    	产品构成：<input type="text" id="goods_material" name="goodsMaterial"><br>
		    	产品描述：<input type="text" name="goodsDescription"><br>
		    	<!-- 制作时间：<input type="text" name="makingTime"><br> -->
		    	生产时间：<input type="text" name="productionTime" id="goodsdate"><br>
		    	生产地点：<input type="text" name="productionArea"><br>
		    	保质期：<input type="text" name="qualityGuarantee"><br>
		    	<input type="submit" value="提交"> --%>
		    </form>
	    </div>
	    </div>
    </div>
    <input type="button" id="addparts" value="添加">
    <hr>
    <div id="parts_entry" style="display:none;">
	    <form id="form_parts" method="post" enctype="multipart/form-data">
	    	部件编号：<input type="text" id="parts_id" name="partsId"><br>
	    	部件名称：<input type="text" name="partsName"><br>
	    	部件图片：<input type="text" name="partsPicture"><br>
	    	部件描述：<input type="text" name="partsDecsription"><br>
	    	生产时间：<input type="text" name="productionTime" id="partsdate"><br>
	    	生产地点：<input type="text" name="productionArea"><br>
	    	属	于：<input type="text" id="parts_belongs" name="belongs"><br>
	    	<!-- 签名1：<input type="text" name="signatureOne"><br>
	    	签名时间1：<input type="text" name="firstSigntime"><br>
	    	签名2：<input type="text" name="signatureTwo"><br>
	    	签名时间2：<input type="text" name="secondSigntime"><br> -->
	    	<input type="button" onclick="entry_parts()" value="提交">
	    </form>
    </div>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#addparts").click(function(){
    			$("#parts_entry").slideToggle();
    		});
    	});
    </script>
    <script type="text/javascript">
    	$(document).ready(function(){
	    		var goods_num = "";
	    		for(var i=0;i<18;i++){
	    			goods_num += parseInt(Math.random()*9.9);
	    		}
	    		$("#goods_id").val("#G"+goods_num);
	    		$("#parts_belongs").val("#G"+goods_num);
	    		var parts_num = "";
	    		for(var i=0;i<11;i++){
	 				parts_num += parseInt(Math.random()*9.9);   		
	    		}
	    		$("#parts_id").val("#P"+parts_num);
	    	});
    </script>
    <script type="text/javascript">
    	jeDate({
			    dateCell:"#goodsdate",
			    skinCell:"jedateblue",
			    format:"YYYY-MM-DD hh:mm",
			    isinitVal:true,
			    isTime:true,
			    festival: true,
			    minDate:"2014-09-19 00:00:00"
			});
			jeDate({
			    dateCell:"#partsdate",
			    skinCell:"jedateblue",
			    format:"YYYY-MM-DD hh:mm",
			    isinitVal:true,
			    isTime:true,
			    festival: true,
			    minDate:"2014-09-19 00:00:00"
			});
	</script> 
	
	<!-- Modal -->
	<div class="modal fade" id="goodsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel">裁剪图片</h4>
	      </div>
	      <div class="modal-body"><!-- style="background:gainsboro;" -->
				<div class="container-fluid">
				  <div class="imageBox">
				    <div class="thumbBox"></div>
				    <div class="spinner" style="display: none">Loading...</div>
				  </div>
				  <!-- <div class="cropped"></div> -->
				</div>
	      </div>
	      <div class="modal-footer">
       		<div class="container-fluid">
	       		<div class="action"> 
				    <!-- <input type="file" id="file" style=" width: 200px">-->
				    <div class="new-contentarea tc"> <a href="javascript:void(0)" class="upload-img">
				      <label for="upload-file">上传图像</label>
				      </a>
				      <input type="file" class="" name="upload-file" id="upload-file" />
				    </div>
				    <input type="button" id="btnCrop"  class="Btnsty_peyton" value="裁切">
				    <input type="button" id="btnZoomIn" class="Btnsty_peyton" value="+"  >
				    <input type="button" id="btnZoomOut" class="Btnsty_peyton" value="-" >
			    </div>
		    </div>
		    <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Modal over -->
	<!-- 图片裁剪 -->
	<script type="text/javascript" src="${__static__}/cropbox/cropimg.js"></script>
	<script type="text/javascript">
		$(window).load(function() {
			var options =
			{
				thumbBox: '.thumbBox',
				spinner: '.spinner',
				imgSrc: '/CSCC/static/cropbox/avatar.png'
			}
			var cropper = $('.imageBox').cropbox(options);
			$('#upload-file').on('change', function(){
				var reader = new FileReader();
				reader.onload = function(e) {
					options.imgSrc = e.target.result;
					cropper = $('.imageBox').cropbox(options);
				}
				reader.readAsDataURL(this.files[0]);
				this.files = [];
			})
			$('#btnCrop').on('click', function(){
				var img = cropper.getDataURL();
				$("#goods_picture").val(img);
				$(".goodspic").html('<img src="'+img+'" align="absmiddle" class="img-rounded">');
				$('#goodsModal').modal('hide');/* bootstrap的模态框 */
				/* $('.cropped').html('');
				$('.cropped').append('<img src="'+img+'" align="absmiddle" style="width:180px;margin-top:4px;border-radius:180px;box-shadow:0px 0px 12px #7E7E7E;"><p>180px*180px</p>'); */
			})
			$('#btnZoomIn').on('click', function(){
				cropper.zoomIn();
			})
			$('#btnZoomOut').on('click', function(){
				cropper.zoomOut();
			})
		});
	</script>
  </body>
</html>
