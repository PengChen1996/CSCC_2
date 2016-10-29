package com.zlzkj.app.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.zlzkj.app.service.OperateService;
import com.zlzkj.core.base.BaseController;
import com.zlzkj.core.sql.Row;
@Controller
public class OperateController extends BaseController {
	@Autowired
	private OperateService operateService;
	
	//审核商品信息
	@RequestMapping(value={"operate/auditinfo_page"})
	public String data_entry_page() {
		
		System.out.println("operate/auditinfo_page");

		return "operate/auditinfo";
	}
	@RequestMapping(value={"operate/auditinfo"})
	public String data_entry(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		System.out.println("operate/auditinfo");
		int pagesize = 2;	//一页条数
		int current_page = Integer.parseInt(request.getParameter("current_page"));//当前页
		int start_num = (current_page-1)*pagesize;
		System.out.println("当前页："+current_page);
		System.out.println("第几条记录："+start_num);
		List<Row> allgoodslist = operateService.select_allgoods(start_num, pagesize, 0);
//		System.out.println(allgoodslist);
		
		int total_num = operateService.allgoods_total(0);//总条数
		int total_page = 0;
		if(total_num%pagesize==0){
			total_page = total_num/pagesize;
		}else{
			total_page = (total_num/pagesize)+1;
		}
		System.out.println("总页数："+total_page);
		
		PrintWriter out = response.getWriter();  
		JSONObject jo = new JSONObject();
		jo.put("allgoodslist",allgoodslist);
		jo.put("current_page",current_page);
		jo.put("total_page",total_page);
		out.write(jo.toString());
		
		return null;
	}
}
