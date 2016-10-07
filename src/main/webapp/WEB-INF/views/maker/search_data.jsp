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
  				url:"maker/search_data",
  				data:goods_id,
  				type:"post",
  				success:function(data){
  					var json_data = JSON.parse(data);
  					if(json_data.goods!=""||json_data.parts!=""){
	  					$.each(json_data.goods,function(index,item){
	  						$("#content").html(item.goods_id);
	  					});
	  					$.each(json_data.parts,function(index,item){
	  						$("#content").append("<br>"+item.parts_id);
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
  	<%-- ${z:u('maker/goodsdata_entry')}
    This is my JSP page. <br> --%>
            产品编号： <input type="text" id="goodsId" name="goodsId">
           <input type="button" onclick="search_data()" value="查询"><br>
           
    <div id="content">
		1    
    </div>
    <%-- <c:forEach var="goods" items="${goods}">
    	${goods.goods_id }
    	${goods.goods_name }
    </c:forEach> --%>
  </body>
</html>
