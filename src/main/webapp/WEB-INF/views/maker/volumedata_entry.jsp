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
	<script type="text/javascript" src="${__static__}/bootstrap3/js/jquery2.1.4.js"></script> 
	<link rel="stylesheet" href="${__static__}/bootstrap3/css/bootstrap.css" type="text/css">
  	<script type="text/javascript" src="${__static__}/bootstrap3/js/bootstrap.js"></script>
  	<script type="text/javascript">
  		function volume(){
  			$("#volume_model").modal("hide");
  			entry_goods();
  			var volume_num = $("#volume_num").val()-1;
  			for(var i=0;i<volume_num;i++){
  				var goods_num = "";
	    		for(var j=0;j<18;j++){
	    			goods_num += parseInt(Math.random()*9.9);
	    		}
	    		$("#goods_id").val("#G"+goods_num);
    			$("#parts_belongs").val("#G"+goods_num);
  				entry_goods();
  			}
  			alert("success！");
  		}
  		function entry_goods(){
  			$.ajax({
  				url:"maker/goodsdata_entry",
  				data:$("#form_goods").serialize(),
  				type:"post",
  				success:function(){
  					/* alert("success"); */ 
  				},
  				error:function(){
  					alert("error");
  				}
  			});
  		}
  		function entry_parts(){
  			var parts = {
  				partsId:$("#parts_id").val(),
  				partsName:$("#parts_name").val(),
  				partsPicture:$("#parts_picture").val(),
  				partsDescription:$("#parts_description").val(),
  				partsProductiontime:$("#parts_production_time").val(),
  				partsProductionarea:$("#parts_production_area").val(),
  				partsBelongs:$("#parts_belongs").val(),
  			}
	  		$.ajax({
	  			url:"maker/partsdata_entry",
  				data:parts,
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
	    <form class="form-horizontal" id="form_goods" method="post" enctype="multipart/form-data">
	    	<div class="col-sm-4">
		    	<div class="form-group">
		    		<label class="col-sm-4 control-label"><!-- 产品图片 --></label>
				    <div class="col-sm-8">
					    <div class="goodspic">
				   		<img alt="图片" src="${__static__}/cropbox/001.jpg" class="img-rounded" style="width:270px;height:200px;">
					   	</div>
					   	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#goodsModal" style="width:270px;">
							上传图片
						</button>
					</div>
			  	</div>
	    	</div>
	    	<div class="col-sm-8">
	    		<div class="form-group" style="display:none;">
				    <label class="col-sm-1 control-label">产品图片</label>
				    <div class="col-sm-7">
				    	<input type="text" class="form-control" id="goods_picture" name="goodsPicture" placeholder="产品图片">
				    </div>
			  	</div>
		    	<div class="form-group">
				    <label class="col-sm-1 control-label">编号</label>
				    <div class="col-sm-7">
				    	<input type="text" class="form-control" id="goods_id" name="goodsId" placeholder="产品编号" readonly>
				    </div>
			  	</div>
		    	<div class="form-group">
				    <label class="col-sm-1 control-label">名称</label>
				    <div class="col-sm-7">
				    	<input type="text" class="form-control" name="goodsName" placeholder="产品名称">
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-1 control-label">价格</label>
				    <div class="col-sm-7">
				    	<input type="text" class="form-control" name="goodsPrice" placeholder="产品价格">
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-1 control-label">保质期</label>
				    <div class="col-sm-7">
				    	<input type="text" class="form-control" name="goodsQualityGuarantee" placeholder="保质期">
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-1 control-label">生产期</label>
				    <div class="col-sm-7">
				    	<input type="text" class="form-control" id="goodsdate" name="goodsProductiontime" placeholder="生产时间" readonly>
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-1 control-label">生产商</label>
				    <div class="col-sm-7">
				    	<input type="text" class="form-control" name="goodsProductionarea" placeholder="生产厂商">
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-1 control-label">构成</label>
				    <div class="col-sm-6">
				    	<input type="text" class="form-control" id="goods_material" name="goodsMaterial" placeholder="产品构成" readonly>
				    </div>
				    <div class="col-sm-1">
				    	<button type="button" id="addparts" class="btn btn-info" title="添加部件">+</button>
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-1 control-label"><!-- 产品构成 --></label>
				    <div class="col-sm-7">
				    	<div id="parts_entry" class="thumbnail" style="display:none;">
				    		<div class="form-group">
					    		<label class="col-sm-3 control-label">部件编号：</label>
					    		<div class="col-sm-9">
							    	<input type="text" class="form-control" id="parts_id" name="partsId" placeholder="部件编号" readonly>
							    </div>
						    </div>
						    <div class="form-group">
							    <label class="col-sm-3 control-label">部件名称：</label>
					    		<div class="col-sm-9">
							    	<input type="text" class="form-control" id="parts_name" name="partsName" placeholder="部件名称">
							    </div>
						    </div>
						    <div class="form-group">
							    <label class="col-sm-3 control-label">部件图片：</label>
					    		<div class="col-sm-9">
							    	<input type="text" class="form-control" id="parts_picture" name="partsPicture" placeholder="部件图片">
							    </div>
							</div>
						    <div class="form-group">
							    <label class="col-sm-3 control-label">生产日期：</label>
					    		<div class="col-sm-9">
							    	<input type="text" class="form-control" id="parts_production_time" name="partsProductiontime" placeholder="生产日期" readonly>
							    </div>
						    </div>
						    <div class="form-group">
							    <label class="col-sm-3 control-label">生产厂商：</label>
					    		<div class="col-sm-9">
							    	<input type="text" class="form-control" id="parts_production_area" name="partsProductionarea" placeholder="生产厂商">
							    </div>
							</div>
							<div class="form-group">
							    <label class="col-sm-3 control-label">部件描述：</label>
					    		<div class="col-sm-9">
					    			<textarea class="form-control" id="parts_description" name="partsDescription" placeholder="部件描述" rows="5"></textarea>
							    </div>
						    </div>
							<div class="form-group" style="display:none">
							    <label class="col-sm-3 control-label">属	于：</label>
					    		<div class="col-sm-9">
							    	<input type="text" class="form-control" id="parts_belongs" name="partsBelongs" readonly>
							    </div>
						    </div>
						    <div class="form-group">
							    <label class="col-sm-3 control-label"><!-- 提交 --></label>
							    <div class="col-sm-9">
							    	<!-- <input type="text" class="form-control" id="parts_belongs" name="belongs" placeholder="部件编号"> -->
							    	<button type="button" onclick="entry_parts()" class="btn btn-info">提交</button>
							    </div>
					    	</div>
					    	<!-- 签名1：<input type="text" name="signatureOne"><br>
					    	签名时间1：<input type="text" name="firstSigntime"><br>
					    	签名2：<input type="text" name="signatureTwo"><br>
					    	签名时间2：<input type="text" name="secondSigntime"><br> -->
					    </div>
				    </div>
			  	</div>
			  	<div class="form-group">
				    <label class="col-sm-1 control-label">描述</label>
				    <div class="col-sm-7">
				    	<textarea class="form-control" name="goodsDescription" rows="5" placeholder="产品描述"></textarea>
				    </div>
			  	</div>
			  	<div class="form-group">
				    <div class="col-sm-offset-1 col-sm-7">
				    	<!-- <button type="button" class="btn btn-primary" onclick="entry_goods()">提交</button> -->
				    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#volume_model">批量</button>
				    </div>
			  	</div>
	    	</div>
	    </form>
	    </div>
	    <br>
    </div>
    <!-- 输入批量数目模态框 -->
    <div class="modal fade bs-example-modal-sm" id="volume_model" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
			<div class="modal-header">
			  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			  <h4 class="modal-title">输入批量数目</h4>
			</div>
			<div class="modal-body">
	        	<input type="text" id="volume_num" class="form-control" placeholder="请输入批量数目">
	        </div>
	        <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary" onclick="volume()">确定</button>
		    </div>
	    </div>
	  </div>
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
			    dateCell:"#parts_production_time",
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
