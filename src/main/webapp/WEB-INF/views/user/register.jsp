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
    
    <title>My JSP 'userdata_entry.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${__static__}/bootstrap3/css/bootstrap.css"/>
    <link rel="stylesheet" href="${__static__}/bootstrap3/css/bootstrapValidator.css"/>
    <script type="text/javascript" src="${__static__}/bootstrap3/js/jquery2.1.4.js"></script>
    <script type="text/javascript" src="${__static__}/bootstrap3/js/bootstrap.js"></script>
    <script type="text/javascript" src="${__static__}/bootstrap3/js/bootstrapValidator.js"></script>
  </head>
  
  <body>
    <div class="container">
	    <form id="form_reg" action="${z:u('user/register')}" method="post" class="form-horizontal">
	    	<div class="form-group">
	            <label class="col-lg-3 control-label">账号：</label>
	            <div class="col-lg-5">
	                <input type="text" class="form-control" name="account">
	            </div>
	        </div>
	    	<div class="form-group">
	            <label class="col-lg-3 control-label">密码：</label>
	            <div class="col-lg-5">
	                <input type="password" class="form-control" name="password">
	            </div>
	        </div>
	        <div class="form-group">
	            <label class="col-lg-3 control-label">确认密码：</label>
	            <div class="col-lg-5">
	                <input type="password" class="form-control" name="repassword">
	            </div>
	        </div>
	        <div class="form-group">
	            <label class="col-lg-3 control-label">邮箱：</label>
	            <div class="col-lg-5">
	                <input type="text" class="form-control" name="mail">
	            </div>
	        </div>
	    	<div class="form-group">
	            <div class="col-lg-9 col-lg-offset-3">
	                <button type="submit" class="btn btn-primary">提交</button>
	            </div>
	        </div>
	    </form>
    </div>
    <script type="text/javascript">
	    $(document).ready(function() {
        /**
         * 下面是进行插件初始化
         * 你只需传入相应的键值对
         * */
        $('#form_reg').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {/*验证*/
                account: {/*键名和input name值对应*/
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {/*非空提示*/
                            message: '用户名不能为空'
                        },
                        regexp: {/* 只需加此键值对 */
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '只能是数字和字母_.'
                        },
                        stringLength: {/*长度提示*/
                            min: 6,
                            max: 30,
                            message: '用户名长度必须在6到30之间'
                        }/*最后一个没有逗号*/
                    }
                },
                password: {
                    message:'密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '用户名长度必须在6到30之间'
                        },
                        identical: {//相同
                            field: 'password',/* 对应input name值 */
                            message: '两次密码不一致'
                        },
                        different: {//不能和用户名相同
                            field: 'account',
                            message: '不能和用户名相同'
                        },
                        regexp: {/* 只需加此键值对 */
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '只能是数字和字母_.'
                        },
                    }
                },
                repassword: {
                    message:'密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        identical: {//相同
                            field: 'password',/* 对应input name值 */
                            message: '两次密码不一致'
                        },
                        
                    }
                },
                mail: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '邮箱格式错误'
                        }
                    }
                }
            }
        });
    });
    </script>
  </body>
</html>
