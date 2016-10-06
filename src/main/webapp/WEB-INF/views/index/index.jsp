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
    
    <title>My JSP 'index.jsp' starting page</title>
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
  </head>
  
  <body style="background: #dadada;">
    <!--导航条-->
    <nav class="navbar navbar-inverse" style="border-radius: 0px;">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    Peng
                </a>
                <button class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <!--<form class="navbar-form navbar-left" role="search">-->
                <!--<div class="form-group">-->
                    <!--<input type="text" class="form-control" placeholder="搜索您感兴趣的内容...">-->
                <!--</div>-->
                <!--<button type="submit" class="btn btn-default">搜索</button>-->
            <!--</form>-->
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="index/index">首页</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">彩码生成 <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">彩码定制</a></li>
                            <li class="divider"></li>
                            <li><a href="#">彩码批量</a></li>
                        </ul>
                    </li>
                    <li><a href="#">商品彩码查询</a></li>
                    <li><a href="#">关于彩码</a></li>
                    <li><a href="#">客户端下载</a></li>
                </ul>
                    <span class="pull-right">
                    <button type="button" class="btn btn-default navbar-btn"><!--Sign in-->登录</button>
                    <button type="button" class="btn btn-success navbar-btn"><!--sign up-->注册</button>
                </span>
            </div>
        </div>
    </nav>
    <div class="container" id="content">
   		首页
    </div>
  </body>
</html>
