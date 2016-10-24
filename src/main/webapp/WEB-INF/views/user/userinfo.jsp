<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userinfo.jsp' starting page</title>
    
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
  </head>
  
  <body>
    <%@ include file="../index/base.jsp" %><!-- 导航条 -->
    <div class="container" style="margin-top:-20px;padding-left:0px;width:1000px;height:36px;background: #fdfdfe;border-left:1px solid #d5d5d5;border-right:1px solid #d5d5d5;">
        <!--填充下-->
    </div>
    <div class="container" style="padding-left:20px;padding-right:50px;width:1000px;background: #fdfdfe;border-left:1px solid #d5d5d5;border-right:1px solid #d5d5d5;">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">
                    <img src="${sessionScope.user_info[1].picture }" class="img-thumbnail" style="width: 188px;height:188px;">
                </div>
                <div class="col-md-9" style="border-bottom: 1px solid #d5d5d5;">
                    <h3 >
                        ${sessionScope.user_info[0].account }
                        <a href="${z:u('user/modifyinfo_page')}" class="btn btn-default btn-xs pull-right">编辑个人资料</a>
                    </h3>
                </div>
                <div class="col-md-9">
                    <p class="text-left"></p>
                    <p class="text-left">性别：${sessionScope.user_info[1].gender }</p>
                    <p class="text-left">年龄：${sessionScope.user_info[1].birth }</p>
                    <p class="text-left">邮箱：${sessionScope.user_info[1].mail }</p>
                    <p class="text-left">所在地区：${sessionScope.user_info[1].address_first }</p>
                    <p class="text-left">个人介绍：${sessionScope.user_info[1].introduction }</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid" style="border-top:1px solid #d5d5d5;">
        <div class="container">
            q
        </div>
    </div>
  </body>
</html>
