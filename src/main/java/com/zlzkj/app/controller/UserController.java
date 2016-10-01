package com.zlzkj.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zlzkj.app.model.User;
import com.zlzkj.app.service.UserService;
import com.zlzkj.core.base.BaseController;

@Controller
public class UserController extends BaseController{
	@Autowired
	private UserService userService;
	
	@RequestMapping(value={"user/userdata_entry_page"})
	public String data_entry_page() {
		System.out.println("user/userdata_entry_page");
		return "user/userdata_entry";
	}
	
	@RequestMapping(value={"user/userdata_entry"})
	public String data_entry(Model model,HttpServletRequest request,HttpServletResponse response,
			User user) {
		System.out.println("user/userdata_entry");
		System.out.println(user.getAccount());
		user.getAccount();
		user.setPassword("111111");
		userService.userdata_entry(user);
		return "user/userdata_entry";
	}
}