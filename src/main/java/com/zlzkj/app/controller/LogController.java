package com.zlzkj.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

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
		log.setOpNum(""+op_num);//操作编号
		
		String op_type = request.getParameter("op_type");
//		System.out.println(op_type);
		log.setOpType(op_type);//操作类型
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String op_date = df.format(new Date());
		log.setOpDate(op_date);//操作时间
		
		log.setOpDesc("opDesc");//操作描述
		String op_user = request.getParameter("op_user");
		log.setOpUser(op_user);//操作人
		String oped_id= request.getParameter("oped_id");
		log.setOpedId(oped_id);//被操作编号
		log.setOpStatus(0);
		logService.add(log);
		return null;
	}
}
