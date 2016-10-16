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
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <style>
        @-webkit-keyframes pic_1 {
            0% { opacity: 1;}
            15% { opacity: 1;}
            25% { opacity: 0;}
            90% { opacity: 0;}
            100% { opacity: 1;}
        }
        @-webkit-keyframes pic_2 {
            0% { opacity: 0;}
            15% { opacity: 0;}
            25% { opacity: 1;}
            40% { opacity: 1;}
            50% { opacity: 0;}
            100% { opacity: 0;}
        }
        @-webkit-keyframes pic_3 {
            0% { opacity: 0;}
            40% { opacity: 0;}
            50% { opacity: 1;}
            65% { opacity: 1;}
            75% { opacity: 0;}
            100% { opacity: 0;}

        }
        @-webkit-keyframes pic_4 {
            0% { opacity: 0;}
            65% { opacity: 0;}
            75% { opacity: 1;}
            90% { opacity: 1;}
            100% { opacity: 0;}
        }

        @-moz-keyframes pic_1 {
            0% { opacity: 1;}
            15% { opacity: 1;}
            25% { opacity: 0;}
            90% { opacity: 0;}
            100% { opacity: 1;}
        }
        @-moz-keyframes pic_2 {
            0% { opacity: 0;}
            15% { opacity: 0;}
            25% { opacity: 1;}
            40% { opacity: 1;}
            50% { opacity: 0;}
            100% { opacity: 0;}
        }
        @-moz-keyframes pic_3 {
            0% { opacity: 0;}
            40% { opacity: 0;}
            50% { opacity: 1;}
            65% { opacity: 1;}
            75% { opacity: 0;}
            100% { opacity: 0;}
        }
        @-moz-keyframes pic_4 {
            0% { opacity: 0;}
            65% { opacity: 0;}
            75% { opacity: 1;}
            90% { opacity: 1;}
            100% { opacity: 0;}
        }
        /*  动画绑定 */
        #first {
            -webkit-animation: pic_1 24s infinite;
            -moz-animation: pic_1 24s infinite;
        }
        #second {
            -webkit-animation: pic_2 24s infinite;
            -moz-animation: pic_2 24s infinite;
        }
        #third{
            -webkit-animation: pic_3 24s infinite;
            -moz-animation: pic_3 24s infinite;
        }
        #fourth{
            -webkit-animation: pic_4 24s infinite;
            -moz-animation: pic_4 24s infinite;
        }
        /* 鼠标悬停暂停动画*/
        /*#slide:hover li {*/
        /*-webkit-animation-play-state: paused;*/
        /*-moz-animation-play-state: paused;*/
        /*}*/

        /****  主框架   ****/
        *{ margin: 0; padding: 0;list-style: none;}
        #container {
            width: 100%;
            height: 100%;
            position: absolute;
            top:0px;
            left:0px;
            overflow: hidden;
        }
        ul {
            width: 100%;
            height: 100%;
            opacity: 0.8;
        }
        li {
            position: absolute;
            top: 0px;
            left: 0px;
        }
        .login_box{
            width: 30%;
            z-index: 10;
            position: absolute;
            top: 14%;
            left: 60%;
            /*background: red;*/
        }
    </style>
    <link rel="stylesheet" href="${__static__}/bootstrap3/css/bootstrap.css"/>
    <%-- <link rel="stylesheet" href="${__static__}/bootstrap3/css/bootstrapValidator.css"/> --%>
    <script type="text/javascript" src="${__static__}/bootstrap3/js/jquery2.1.4.js"></script>
    <script type="text/javascript" src="${__static__}/bootstrap3/js/bootstrap.js"></script>
    <%-- <script type="text/javascript" src="${__static__}/bootstrap3/js/bootstrapValidator.js"></script> --%>
  </head>
  
  <body>
    <%-- <form action="${z:u('user/login')}">
    	账号：<input type="text" name="account"><br>
    	密码：<input type="password" name="password"><br>
    	<input type="submit" value="提交">
    </form> --%>
     <div id="container">
        <ul>
            <li id="first"><img src="${__static__}/img/001.jpg" class="img-responsive"></li>
            <li id="second"><img src="${__static__}/img/002.jpg" class="img-responsive"></li>
            <li id="third"><img src="${__static__}/img/003.jpg" class="img-responsive"></li>
            <li id="fourth"><img src="${__static__}/img/004.jpg" class="img-responsive"></li>
        </ul>
        <div class="login_box">
            <div class="container">
                <div class="row">
                    <div class="col-md-4" style="background:#f9fdbc; opacity: 0.9">
                        <form role="form" action="${z:u('user/login')}" method="post">
                            <br>
                            <label>帐号登录</label>
                            <br><br>
                            <div class="form-group">
                                <label >帐号</label>
                                <input type="text" class="form-control" name="account"  placeholder="输入用户名/邮箱/手机号">
                            </div>
                            <div class="form-group">
                                <label >密码</label>
                                <input type="password" class="form-control" name="password" placeholder="输入密码">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" checked ='checked'> 记住密码
                                </label>
                                <label class="pull-right">
                                    <a href="">忘记密码</a>
                                </label>
                            </div>
                            <br>
                            <button type="submit" style="background: #fd8e2b" class="btn btn-default col-md-12">登录</button>
                            <br><hr>
                            <div class="checkbox">
                                <label>
                                    	还没有帐号？
                                </label>
                                <label>
                                    <a>立即注册</a>
                                </label>
                            </div>
                            <br>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>
