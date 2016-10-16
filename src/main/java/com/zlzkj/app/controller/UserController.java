package com.zlzkj.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zlzkj.app.model.User;
import com.zlzkj.app.service.UserService;
import com.zlzkj.app.util.MD5String;
import com.zlzkj.core.base.BaseController;

@Controller
public class UserController extends BaseController{
	@Autowired
	private UserService userService;
	
	//注册
	@RequestMapping(value={"user/register_page"})
	public String data_entry_page() {
		System.out.println("user/register_page");
		return "user/register";
	}
	@RequestMapping(value={"user/register"})
	public String data_entry(Model model,HttpServletRequest request,HttpServletResponse response,
			User user) {
		System.out.println("user/register");
		
		String password = user.getPassword();
		//MD5加密
		MD5String md5 = new MD5String();
		user.setPassword(md5.getMD5Str(password));
		
		userService.register(user);
		return "user/register";
	}
	//登录
	@RequestMapping(value={"user/login_page"})
	public String login_page() {
		System.out.println("user/login_page");
		return "user/login";
	}
	@RequestMapping(value={"user/login"})
	public String login(Model model,HttpServletRequest request,HttpServletResponse response,
			User user) {
		System.out.println("user/login");
		
		String account = user.getAccount();
		MD5String md5 = new MD5String();
		String password = md5.getMD5Str(user.getPassword());

		System.out.println("密码："+password);
		boolean islogin = userService.login(account,password,0);
		System.out.println(islogin);
		if(islogin){
			return "index/index";
		}else{
			return "user/login";
		}
	}
}