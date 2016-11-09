package com.zlzkj.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zlzkj.app.model.Log;
import com.zlzkj.app.service.LogService;
import com.zlzkj.core.base.BaseController;
@Controller
public class LogController extends BaseController{
	@Autowired
	private LogService logService;
	
	@RequestMapping(value={"/log"})
	public String log(Model model,HttpServletRequest request,HttpServletResponse response,
			Log log) {
		System.out.println("/log");
		int op_num = Integer.parseInt(logService.getop_num())+1;
		System.out.println("op_num:"+op_num);
		log.setOpNum(""+op_num);
		log.setOpType("opType");
		log.setOpDate("opDate");
		log.setOpDesc("opDesc");
		log.setOpUser("opUser");
		log.setOpedId("opedId");
		log.setOpStatus(0);
		logService.add(log);
		return null;
	}
}
