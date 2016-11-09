package com.zlzkj.app.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	//操作中心
	@RequestMapping(value={"operate/operate_center_page"})
	public String operate_center_page() {
		
		System.out.println("operate/operate_center_page");
		return "operate/operate_center";
	}
	//审核商品信息
	@RequestMapping(value={"operate/auditinfo_page"})
	public String auditinfo_page() {
		
		System.out.println("operate/auditinfo_page");

		return "operate/auditinfo";
	}
	@RequestMapping(value={"operate/auditinfo"})
	public String auditinfo(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
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
	//审核记录列表    只能看见自己审核的
	//通过审核1
	@RequestMapping(value={"operate/auditrecord_page"})
	public String auditrecord_page() {
		
		System.out.println("operate/auditrecord_page");

		return "operate/auditrecord";
	}
	//未通过审核2
	@RequestMapping(value={"operate/audit_reject_page"})
	public String auditreject_page() {
		
		System.out.println("operate/audit_reject_page");

		return "operate/audit_reject";
	}
	//未通过审核-1
	@RequestMapping(value={"operate/audit_trash_page"})
	public String audittrash_page() {
		
		System.out.println("operate/audit_trash_page");

		return "operate/audit_trash";
	}
	@RequestMapping(value={"operate/auditrecord"})
	public String auditrecord(Model model,HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		System.out.println("operate/auditrecord");
		String signature_two = request.getParameter("signature_two");
		int goods_status = Integer.parseInt(request.getParameter("goods_status"));//选择通过还是未通过列表
		int pagesize = 2;	//一页条数
		int current_page = Integer.parseInt(request.getParameter("current_page"));//当前页
		int start_num = (current_page-1)*pagesize;
		System.out.println("当前页："+current_page);
		System.out.println("第几条记录："+start_num);
		List<Row> myrecordslist = operateService.select_myrecords(start_num, pagesize, signature_two,goods_status);
//		System.out.println(myrecordslist);
		
		int total_num = operateService.myrecords_total(signature_two,goods_status);//总条数
		int total_page = 0;
		if(total_num%pagesize==0){
			total_page = total_num/pagesize;
		}else{
			total_page = (total_num/pagesize)+1;
		}
		System.out.println("总页数："+total_page);
		
		PrintWriter out = response.getWriter();  
		JSONObject jo = new JSONObject();
		jo.put("myrecordslist",myrecordslist);
		jo.put("current_page",current_page);
		jo.put("total_page",total_page);
		out.write(jo.toString());
		
		return null;
	}
	//审核  -1是回收站1是通过 2是否决 
	@RequestMapping(value={"operate/audit"})
	public String audit(Model model,HttpServletRequest request,HttpServletResponse response){
		
		System.out.println("operate/audit");
		
		String goods_id = request.getParameter("goods_id");
		int goods_status = Integer.parseInt(request.getParameter("goods_status"));//执行操作
		String signature_two = request.getParameter("signature_two");//操作人
		System.out.println("改变的编号："+goods_id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df.format(new Date());//操作时间
		operateService.audit_pass(goods_id, goods_status,signature_two,time);
		
		return null;
	}
	
}
