package com.zlzkj.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zlzkj.core.base.BaseController;

@Controller
public class IndexController extends BaseController{
	
	@RequestMapping(value={"index/index"})
	public String data_entry_page() {
		System.out.println("index");
		return "index/index";
	}
}
