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
    
    <title>My JSP 'operate_record.jsp' starting page</title>
    
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
		function getmyrecords(current_page){
			var signature_two = '${sessionScope.user_info[0].account}';
			var data = {
				current_page:current_page,
				signature_two:signature_two,
				goods_status:2,		//选择未通过列表
			};
			$.ajax({
				url:"${z:u('operate/auditrecord')}",
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
					$.each(json_data.myrecordslist,function(index,item){
			          	var goodslist = "<tr>"+
						                    "<td>"+item.goods_id+"</td>"+
						                    "<td>"+item.goods_name+"</td>"+
						                    "<td>"+item.goods_price+"</td>"+
						                    "<td>"+item.goods_productionarea+"</td>"+
						                    "<td>"+item.goods_productiontime+"</td>"+
						                    "<td>"+
						                    	"<span title='点击查看' class='glyphicon glyphicon-hand-up' data-toggle='tooltip' data-placement='bottom'></span>&nbsp;&nbsp;"+
						                    	"<span title='修改' class='glyphicon glyphicon-edit' data-toggle='tooltip' data-placement='bottom'></span>&nbsp;&nbsp;"+
						                    	"<span title='重新审核' class='glyphicon glyphicon-repeat' data-toggle='tooltip' data-placement='bottom'></span>&nbsp;&nbsp;"+
						                    	"<span title='移除' onclick=audit('"+item.goods_id+"',-1,"+current_page+") class='glyphicon glyphicon-trash' data-toggle='tooltip' data-placement='bottom'></span>"+
						                    "</td>"+
				                		"</tr>";
						$("#goods_list").append(goodslist);
						/* 工具提示 */
						$(function () { $("[data-toggle='tooltip']").tooltip(); });
					});
					/* 分页 */
					
					var current = json_data.current_page;//当前页
					var total = json_data.total_page>0?(json_data.total_page):1;//总页数
					var pre = (current-1)>=1?(current-1):1;
					var next = (current+1)>total?total:(current+1);
					var pre_next = "<tr><td colspan='6'>"+
										"<ul class='pager' style='margin-left:66%;'>"+
										  "<li><a onclick='getmyrecords("+pre+")'><span class='glyphicon glyphicon-chevron-left'></span></a></li>"+
										  "<li>&nbsp;&nbsp;<a>"+current+"</a>/<a onclick='getmyrecords("+total+")'>"+total+"</a>&nbsp;&nbsp;</li>"+
										  "<li><a onclick='getmyrecords("+next+")'><span class='glyphicon glyphicon-chevron-right'></span></a></li>"+
										"</ul>"+
									"</td></tr>";
					$("#goods_list").append(pre_next);
				},
				error:function(){
					alert("error!");
				}
			});
		}
		
		//审核   -1是回收站1是通过 2是否决
		function audit(goods_id,goods_status,currentpage){
			if(goods_status=-1){
						var press = confirm("确定移除？");
						if(press){
							//alert("success");
						}else{
							return;
						}
					}
			var signature_two = '${sessionScope.user_info[0].account}';
			var data = {
				goods_id:goods_id,
				goods_status:goods_status,
				signature_two:signature_two,
			};
			$.ajax({
				url:"${z:u('operate/audit')}",
				data:data,
				type:"post",
				success:function(data){
					alert("success!");
					getmyrecords(currentpage);//刷新
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
    <%@ include file="../index/operatenav.jsp" %><!-- 操作中心导航条 -->
	<%@ include file="../index/foot.jsp" %>
	<script type="text/javascript">
		/* 审核第一页的内容 */
		window.onload = function(){
			getmyrecords(1);
			$("#aduit_reject").addClass("active");
		};
	</script>
  </body>
</html>
