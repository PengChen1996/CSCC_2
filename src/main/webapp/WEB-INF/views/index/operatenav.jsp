<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'operatenav.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		#operate_list a{
		    padding-left: 36px;
		    font-family: "Microsoft YaHei";
		    font-size: 14px;
		}
	</style>
  </head>
  
  <body>
	<div class="container" style="margin-top:-20px;padding-left:0px;width:1000px;background: #fdfdfe;border-left:1px solid #d5d5d5;border-right:1px solid #d5d5d5;">
    <!--填充下-->
	    <br>
	    <div class="row">
	        <div class="col-md-12"style="width:1000px;margin-left:15px;border-bottom: 1px solid #d5d5d5;">
	            <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作中心</h3>
	        </div>
	    </div>
	</div>
	<div class="container" style="padding-left:0px;padding-right:0px;width:1000px;background: #fdfdfe;border-left:1px solid #d5d5d5;border-right:1px solid #d5d5d5;">
	    <div class="row">
	        <div class="col-md-3">
	            <div id="operate_list" class="list-group" style="width:200px;">
	                <a href="#" class="list-group-item active" style="border-radius: 0;"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;彩码查看</a>
	                <a href="#" class="list-group-item "><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;彩码查询</a>
	                <a href="#" class="list-group-item"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;操作日志</a>
	                <a class="list-group-item"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;操作日志</a>
	                <a onclick="getgoodsinfo()" class="list-group-item" style="border-radius: 0;"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;操作日志</a>
	            </div>
	        </div>
	        <br>
	        <div id="operate_content" class="col-md-9" style="margin-left: -25px;min-height: 400px;">
	            <!--<ol class="breadcrumb" style="width: 796px;margin-left: -30px;margin-top: -20px;">-->
	                <!--<li><a href="#">Home</a></li>-->
	                <!--<li><a href="#">Library</a></li>-->
	                <!--<li class="active">Data</li>-->
	            <!--</ol>-->
	            <!-- <table class="table table-bordered">
	                <tr style="background: #f6f6f8;">
	                    <th>#</th>
	                    <th>1</th>
	                    <th>1</th>
	                    <th>1</th>
	                </tr>
	                <tr>
	                    <td>2</td>
	                    <td>2</td>
	                    <td>2</td>
	                    <td>2</td>
	                </tr>
	            </table> -->
	        </div>
	    </div>
	</div>
	<script>
	    $(document).ready(function(){
	        $("#operate_list a").click(function(){
	            $(this).siblings().removeClass("active");
	            $(this).addClass("active");
	        });
	    });
	</script>
  </body>
</html>
