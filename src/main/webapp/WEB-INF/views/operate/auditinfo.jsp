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
    
    <title>My JSP 'audit_info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${__static__}/bootstrap3/css/bootstrap.css"/>
    <script type="text/javascript" src="${__static__}/bootstrap3/js/jquery2.1.4.js"></script>
    <script type="text/javascript" src="${__static__}/bootstrap3/js/bootstrap.js"></script>
  	<style>
		#operate_list a{
		    padding-left: 36px;
		    font-family: "Microsoft YaHei";
		    font-size: 14px;
		}
		#goods_list span{
			cursor:pointer;
		}
	</style>
	<script type="text/javascript">
		function getgoodsinfo(current_page){
			var data = {
				current_page:current_page
			}
			$.ajax({
				url:"${z:u('operate/auditinfo')}",
				data:data,
				type:"post",
				success:function(data){
					var json_data = JSON.parse(data);
					//alert(json_data.allgoodslist);
					var goodslist_title = "<tr style='background: #f6f6f8;'>"+
						                    "<th>#</th>"+
						                    "<th>名称</th>"+
						                    "<th>价格</th>"+
						                    "<th>产商</th>"+
						                    "<th>生产日期</th>"+
						                    "<th>操作</th>"+
						                  "</tr>";
					$("#goods_list").html(goodslist_title);
					$.each(json_data.allgoodslist,function(index,item){
			          	var goodslist = "<tr>"+
						                    "<td>"+item.goods_id+"</td>"+
						                    "<td>"+item.goods_name+"</td>"+
						                    "<td>"+item.goods_price+"</td>"+
						                    "<td>"+item.goods_productionarea+"</td>"+
						                    "<td>"+item.goods_productiontime+"</td>"+
						                    "<td>"+
						                    	"<span title='确认审核' class='glyphicon glyphicon-hand-up' data-toggle='tooltip' data-placement='bottom'></span>&nbsp;&nbsp;"+
						                    	"<span title='查看' class='glyphicon glyphicon-list-alt' data-toggle='tooltip' data-placement='bottom'></span>&nbsp;&nbsp;"+
						                    	"<span title='修改' class='glyphicon glyphicon-wrench' data-toggle='tooltip' data-placement='bottom'></span>&nbsp;&nbsp;"+
						                    	"<span title='删除' class='glyphicon glyphicon-trash' data-toggle='tooltip' data-placement='bottom'></span>"+
						                    "</td>"+
				                		"</tr>";
						$("#goods_list").append(goodslist);
						/* 工具提示 */
						$(function () { $("[data-toggle='tooltip']").tooltip(); });
					});
					/* 分页 */
					var current = json_data.current_page;//当前页
					var total = json_data.total_page;//总页数
					var pre = (current-1)>=1?(current-1):1;
					var next = (current+1)>total?total:(current+1);
					var pre_next = "<tr><td colspan='6'>"+
										"<ul class='pager' style='margin-left:66%;'>"+
										  "<li><a onclick='getgoodsinfo("+pre+")'><span class='glyphicon glyphicon-chevron-left'></span></a></li>"+
										  "<li>&nbsp;&nbsp;<a>"+current+"</a>/<a onclick='getgoodsinfo("+total+")'>"+total+"</a>&nbsp;&nbsp;</li>"+
										  "<li><a onclick='getgoodsinfo("+next+")'><span class='glyphicon glyphicon-chevron-right'></span></a></li>"+
										"</ul>"+
									"</td></tr>";
					$("#goods_list").append(pre_next);
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
	                <a onclick="getgoodsinfo(1)" class="list-group-item" style="border-radius: 0;"><span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp;操作日志</a>
	            </div>
	        </div>
	        <br>
	        <div class="col-md-9" style="margin-left: -25px;min-height: 400px;">
	            <!--<ol class="breadcrumb" style="width: 796px;margin-left: -30px;margin-top: -20px;">-->
	                <!--<li><a href="#">Home</a></li>-->
	                <!--<li><a href="#">Library</a></li>-->
	                <!--<li class="active">Data</li>-->
	            <!--</ol>-->
	            <table id="goods_list" class="table table-striped">
	                <!-- <tr style="background: #f6f6f8;">
	                    <th>#</th>
	                    <th>名称</th>
	                    <th>1</th>
	                    <th>1</th>
	                    <th>1</th>
	                    <th>1</th>
	                </tr> -->
	                <!-- <tr>
	                    goodslist
	                </tr> -->
	                <!-- <nav>
					  <ul class="pager">
					    <li><a href="#">Previous</a></li>
					    <li><a href="#">Next</a></li>
					  </ul>
					</nav> -->
	            </table>
	        </div>
	    </div>
	</div>
	<%@ include file="../index/foot.jsp" %>
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
