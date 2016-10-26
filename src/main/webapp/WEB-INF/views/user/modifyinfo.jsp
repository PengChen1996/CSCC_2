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
	<script type="text/javascript">
		$(document).ready(function(){
			var gender = '${sessionScope.user_info[1].gender}';
			if(gender=="男"){
				$("input[name='gender']").get(0).checked=true;
			}
			else if(gender=="女"){
				$("input[name='gender']").get(1).checked=true;
			}
			else{
				$("input[name='gender']").get(2).checked=true;
			}
		});
	</script>
  </head>
  
  <body>
    <%@ include file="../index/base.jsp" %><!-- 导航条 -->
    <div class="container" style="margin-top:-20px;padding-left:0px;width:1000px;height:12px;background: #fdfdfe;border-left:1px solid #d5d5d5;border-right:1px solid #d5d5d5;">
    <!--填充下-->
	</div>
	<div class="container" style="padding-left:36px;padding-right:50px;width:1000px;background: #fdfdfe;border-left:1px solid #d5d5d5;border-right:1px solid #d5d5d5;">
	    <div class="row">
	        <div class="col-md-12">
	            <h3>个人设置</h3>
	            <ul id="my_tab" class="nav nav-tabs">
	                <li class="active">
	                    <a href="#a" data-toggle="tab">基本设置</a>
	                </li>
	                <li>
	                    <a href="#b" data-toggle="tab">绑定设置</a>
	                </li>
	            </ul>
	            <div class="tab-content">
	                <div class="tab-pane fade in active" id="a">
	                    <br>
	                    <form class="form-horizontal" role="form">
	                        <!--左边-->
	                        <div class="col-sm-6">
	                            <div class="form-group">
	                                <p class="col-sm-2 control-label">帐号:</p>
	                                <div class="col-sm-10">
	                                    <input type="text" class="form-control" value="${sessionScope.user_info[0].account }" placeholder="帐号">
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <p class="col-sm-2 control-label">介绍:</p>
	                                <div class="col-sm-10">
	                                    <textarea class="form-control" rows="6" placeholder="介绍">${sessionScope.user_info[1].introduction }</textarea>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <p class="col-sm-2 control-label">性别:</p>
	                                <div class="col-sm-10">
	                                    <label class="control-label">
	                                        <input name="gender" type="radio"> 男 &nbsp;&nbsp;&nbsp;
	                                    </label>
	                                    <label class="control-label">
	                                        <input name="gender" type="radio"> 女 &nbsp;&nbsp;&nbsp;
	                                    </label>
	                                    <label class="control-label">
	                                        <input name="gender" type="radio"> 保密
	                                    </label>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <p class="col-sm-2 control-label">生日:</p>
	                                <div class="col-sm-10">
	                                    <select class="btn btn-default">
	                                        <option>2016</option>
	                                        <option>2015</option>
	                                        <option>2014</option>
	                                        <option>2013</option>
	                                        <option>1012</option>
	                                    </select>&nbsp;&nbsp;年&nbsp;&nbsp;
	                                    <select class="btn btn-default">
	                                        <option>01</option>
	                                        <option>02</option>
	                                        <option>03</option>
	                                        <option>04</option>
	                                        <option>05</option>
	                                        <option>06</option>
	                                        <option>07</option>
	                                        <option>08</option>
	                                        <option>09</option>
	                                        <option>10</option>
	                                        <option>11</option>
	                                        <option>12</option>
	                                    </select>&nbsp;&nbsp;月&nbsp;&nbsp;
	                                    <select class="btn btn-default">
	                                        <option>01</option>
	                                        <option>02</option>
	                                        <option>03</option>
	                                        <option>04</option>
	                                        <option>05</option>
	                                        <option>06</option>
	                                        <option>07</option>
	                                        <option>08</option>
	                                        <option>09</option>
	                                        <option>10</option>
	                                        <option>11</option>
	                                        <option>12</option>
	                                    </select>&nbsp;&nbsp;日&nbsp;&nbsp;
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <p class="col-sm-2 control-label">地区:</p>
	                                <div class="col-sm-10">
	                                    <select class="btn btn-default">
	                                        <option>2016</option>
	                                        <option>2015</option>
	                                        <option>2014</option>
	                                        <option>2013</option>
	                                        <option>2012</option>
	                                    </select>&nbsp;&nbsp;省&nbsp;&nbsp;
	                                    <select class="btn btn-default"> <!--onmousedown="this.size=3;" onchange="this.size=1;"-->
	                                        <option>2016</option>
	                                        <option>2015</option>
	                                        <option>2014</option>
	                                        <option>2013</option>
	                                        <option>2012</option>
	                                    </select>&nbsp;&nbsp;市&nbsp;&nbsp;
	                                </div>
	                            </div>
	                            <br>
	                            <div class="form-group">
	                                <div class="col-sm-offset-2 col-sm-10">
	                                    <button type="submit" class="btn btn-primary">保 存</button>
	                                </div>
	                            </div>
	                        </div>
	                        <!--右边-->
	                        <div class="col-sm-6">
	                            <img src="${sessionScope.user_info[1].picture }" class="img-thumbnail" style="width:188px;height:188px;">
	                        </div>
	                    </form>
	                </div>
	
	                <div class="tab-pane fade" id="b">
	                    <br>
	                    <div class="col-sm-12">
	                        <ul class="list-group">
	                            <li class="list-group-item" style="padding:20px 20px 20px 20px; background: #f9f9f9;">
	                                <img src="${__static__}/img/phone.png" style="width:60px;height:60px;">
	                                <span>&nbsp;&nbsp;手机</span>
	                                <button class="btn btn-default btn-sm pull-right" style="margin-top:15px;">
	                                    <span class="glyphicon glyphicon-plus"></span> 绑 定
	                                </button>
	                            </li>
	                            <li class="list-group-item" style="padding:20px 20px 20px 20px; background: #f9f9f9;">
	                                <img src="${__static__}/img/phone.png" style="width:60px;height:60px;">
	                                <span>&nbsp;&nbsp;手机</span>
	                                <button class="btn btn-default btn-sm pull-right" style="margin-top:15px;">
	                                    <span class="glyphicon glyphicon-plus"></span> 绑 定
	                                </button>
	                            </li>
	                            <li class="list-group-item" style="padding:20px 20px 20px 20px; background: #f9f9f9;">
	                                <img src="${__static__}/img/phone.png" style="width:60px;height:60px;">
	                                <span>&nbsp;&nbsp;手机</span>
	                                <button class="btn btn-default btn-sm pull-right" style="margin-top:15px;">
	                                    <span class="glyphicon glyphicon-plus"></span> 绑 定
	                                </button>
	                            </li>
	                            <li class="list-group-item" style="padding:20px 20px 20px 20px; background: #f9f9f9;">
	                                <img src="${__static__}/img/phone.png" style="width:60px;height:60px;">
	                                <span>&nbsp;&nbsp;手机</span>
	                                <button class="btn btn-default btn-sm pull-right" style="margin-top:15px;">
	                                    <span class="glyphicon glyphicon-plus"></span> 绑 定
	                                </button>
	                            </li>
	                        </ul>
	                    </div>
	                    <br><br>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<%@ include file="../index/foot.jsp" %>
  </body>
</html>
