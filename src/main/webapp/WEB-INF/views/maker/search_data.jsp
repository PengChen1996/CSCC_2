<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://zlzkj.com/tags" prefix="z" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'search_data.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${__static__}/bootstrap3/js/jquery2.1.4.js"></script> 
	<link rel="stylesheet" href="${__static__}/bootstrap3/css/bootstrap.css" type="text/css">
  	<script type="text/javascript" src="${__static__}/bootstrap3/js/bootstrap.js"></script>
  	<script type="text/javascript">
  		function search_data(){
  			var goods_id = {
  				goodsId:$("#goodsId").val()
  			};
  			$.ajax({
  				url:"${z:u('maker/search_data')}",
  				data:goods_id,
  				type:"post",
  				success:function(data){
  					var json_data = JSON.parse(data);
  					if(json_data.goods!=""||json_data.parts!=""){
  						var goods_info = "";
  						var parts_info = "";
  						$("#parts_content").html("");
	  					$.each(json_data.goods,function(index,item){
	  						goods_info = "<div class='media'>"+
											  "<a class='media-left' href='#'>"+
											    "<img src='"+item.goods_picture+"' style='width:270px;height:200px;'>"+
											  "</a>"+
											  "<div class='media-body'>"+
											    "<label>产品名称:</label>"+item.goods_name+
											    "<br><label>产品价格:</label>"+item.goods_price+
											    "<br><label>保质期:</label>"+item.goods_makingtime+
											    "<br><label>生产日期:</label>"+item.goods_productiontime+
											    "<br><label>生产厂商:</label>"+item.goods_productionarea+
											    "<br><label>描述：</label>"+
											    "<p style='height:40px;word-wrap: break-word;overflow: hidden;'>"+item.goods_description+"</p>"+
											  "</div>"+
											"</div>";
	  						$("#goods_content").html(goods_info);
	  					});
	  					$.each(json_data.parts,function(index,item){
	  						parts_info = "<div class='media'>"+
											  "<a class='media-left' href='#'>"+
											    "<img src='${__static__}/cropbox/001.jpg' style='width:270px;height:200px;'>"+
											  "</a>"+
											  "<div class='media-body'>"+
											    "<label>产品名称:</label>"+item.parts_name+
											    "<br><label>生产日期:</label>"+item.parts_productiontime+
											    "<br><label>生产厂商:</label>"+item.parts_productionarea+
											    "<br><label>描述：</label>"+
											    "<p style='height:40px;word-wrap: break-word;overflow: hidden;'>"+item.parts_description+"</p>"+
											  "</div>"+
											"</div>"+
											"<div class='col-sm-12' style='border-bottom:1px solid #ccc'></div>";
	  						$("#parts_content").append(parts_info);
	  					});
  					}
  					else{
  						$("#goods_content").html("未查询到数据！！！");
  					}
  				},
  				error:function(){
  					alert("error!");
  				}
  			});
  		}
  	</script>
  	
  </head>
  
  <body>
    <%@ include file="../index/base.jsp" %><!-- 导航条 -->
    <script>
    	$("#search_data").addClass("active");
    </script>
    
    <div class="container">
    	<div class="row">
    		<div class="col-sm-12">
    			<div class="col-sm-6">
    				<input type="text" class="form-control" id="goodsId" name="goodsId" placeholder="彩码查询">
    			</div>
    			<button type="button" class="btn btn-default" onclick="search_data()">彩码查询</button>
    		</div>
    	</div>
    </div>
    <br>
    <div class="container">
    	<div class="row">
    		<div class="col-sm-12">
    			<div class="col-sm-12">
	    			<span style="width:80px;height:28px;background:#eee;display:block;text-align:center;line-height:28px;">
	    				查询结果
	    			</span>
	    			<label style="margin-top:-24px;margin-left:90px;">查询结果仅供参考，以实际商品信息为准。</label>
	    			<div style="border-bottom:1px solid #eee"></div>
    			</div>
    		</div>
    	</div>
    </div>
    <br>
    <!-- 查询内容 -->
    <div class="container">
    	<div class="row">
    		<div class="col-sm-12">
    			<label class="col-sm-12 control-label">产品信息：</label>
	    		<div class="col-sm-12">
					<div id="goods_content" style="background:#eee">
				 		<div class="media">
						  <a class="media-left" href="#">
						    <img src="${__static__}/cropbox/001.jpg" style="width:270px;height:200px;">
						  </a>
						  <div class="media-body">
						    <h5 class="media-heading">产品名称:彩码</h5>
						    <h5 class="media-heading">产品价格：1000</h5>
						    <h5 class="media-heading">保质期：122</h5>
						    <h5 class="media-heading">生产日期：2016</h5>
						    <h5 class="media-heading">生产厂商：杭电</h5>
					    	描述：
					    	<p style="height:60px;word-wrap: break-word;overflow: hidden;">
						    	Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.						  
						  	</p>
						  </div>
						</div>
	    			</div>
				</div> 
    		</div>
    	</div>
    </div>
    <div class="container">
    	<div class="row">
    		<div class="col-sm-12">
    			<label class="col-sm-12 control-label">部件信息：</label>
	    		<div class="col-sm-12">
					<div id="parts_content" style="background:#eee">
				 		暂无介绍
	    			</div>
				</div> 
    		</div>
    	</div>
    </div>  
    <%-- <c:forEach var="goods" items="${goods}">
    	${goods.goods_id }
    	${goods.goods_name }
    </c:forEach> --%>
  </body>
</html>
