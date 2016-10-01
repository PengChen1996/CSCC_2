<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'partsdata_entry.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${__static__}/jedate/jedate.js"></script>
	<link type="text/css" rel="stylesheet" href="${__static__}/jedate/skin/jedate.css">
  </head>
  
  <body>
    <form action="maker/partsdata_entry" method="post">
    	部件编号：<input type="text" name="partsId"><br>
    	部件名称：<input type="text" name="partsName"><br>
    	部件图片：<input type="text" name="partsPicture"><br>
    	部件描述：<input type="text" name="partsDecsription"><br>
    	生产时间：<input type="text" name="productionTime" id="indate"><br>
    	生产地点：<input type="text" name="productionArea"><br>
    	<!-- 属于<input type="text" name="belongs"><br>
    	签名1：<input type="text" name="signatureOne"><br>
    	签名时间1：<input type="text" name="firstSigntime"><br>
    	签名2：<input type="text" name="signatureTwo"><br>
    	签名时间2：<input type="text" name="secondSigntime"><br> -->
    	<input type="submit" value="提交">
    </form>
    <script type="text/javascript">
    	jeDate({
			    dateCell:"#indate",
			    skinCell:"jedateblue",
			    format:"YYYY-MM-DD hh:mm",
			    isinitVal:true,
			    isTime:true,
			    festival: true,
			    minDate:"2014-09-19 00:00:00"
			})
	</script> 
  </body>
</html>
