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

  </head>
  
  <body>
    <form action="maker/goodsdata_entry" method="post">
    	产品编号：<input type="text" name="goodsId"><br>
    	产品名称：<input type="text" name="goodsName"><br>
    	产品图片：<input type="text" name="goodsPicture"><br>
    	产品价格：<input type="text" name="goodsPrice"><br>
    	产品构成：<input type="text" name="goodsMaterial"><br>
    	产品描述：<input type="text" name="goodsDescription"><br>
    	制作时间：<input type="text" name="makingTime"><br>
    	生产时间：<input type="text" name="productionTime"><br>
    	生产地点：<input type="text" name="productionArea"><br>
    	保质期：<input type="text" name="qualityGuarantee"><br>
    	<input type="submit" value="提交">
    </form>
  </body>
</html>
