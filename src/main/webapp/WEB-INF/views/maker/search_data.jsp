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
	  					$.each(json_data.goods,function(index,item){
	  						goods_info = item.goods_id+"<br><img src="+item.goods_picture+" style='width:270px;'>";
	  						goods_info += "<img src="+item.colormobi+" style='width:200px;'>";
	  						$("#goods_content").html(goods_info);
	  					});
	  					$.each(json_data.parts,function(index,item){
	  						$("#parts_content").append("<br>"+item.parts_id);
	  					});
  					}
  					else{
  						$("#content").html("未查询到数据！！！");
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
    <!-- 查询内容 -->
    <div class="container">
    	<div class="row">
    		<div class="col-sm-12">
    			<label class="col-sm-12 control-label">产品信息：</label>
	    		<div id="goods_content">
					产品    
		    	</div>
    		</div>
    	</div>
    </div>
    <div class="container">
    	<div class="row">
    		<div class="col-sm-12">
    			<label class="col-sm-12 control-label">部件信息：</label>
	    		<div id="parts_content">
					部件   
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
