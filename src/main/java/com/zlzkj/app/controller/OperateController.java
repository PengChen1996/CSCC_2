package com.zlzkj.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zlzkj.core.base.BaseController;
@Controller
public class OperateController extends BaseController {
	
	@RequestMapping(value={"operate/auditinfo_page"})
	public String data_entry_page() {
		System.out.println("operate/auditinfo_page");
		return "operate/auditinfo";
	}
}
