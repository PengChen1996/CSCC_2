package com.zlzkj.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zlzkj.app.model.MakerGoods;
import com.zlzkj.app.model.MakerParts;
import com.zlzkj.app.service.MakerGoodsService;
import com.zlzkj.app.service.MakerPartsService;
import com.zlzkj.core.base.BaseController;

@Controller
public class MakerController extends BaseController{
	@Autowired
	private MakerGoodsService goodsService;
	@Autowired
	private MakerPartsService partsService;
	
	/*录入商品信息*/
	@RequestMapping(value={"maker/goodsdata_entry_page"})
	public String goodsdata_entry_page() {
		System.out.println("maker/goodsdata_entry_page");
		return "maker/goodsdata_entry";
	}
	@RequestMapping(value={"maker/goodsdata_entry"})
	public String goodsdata_entry(Model model,HttpServletRequest request,HttpServletResponse response,
			MakerGoods makergoods) {
		System.out.println("maker/goodsdata_entry");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current_time = df.format(new Date());
		makergoods.setSignatureOne("Flying");
		makergoods.setFirstSigntime(current_time);
		makergoods.setStatus(0);
		goodsService.goodsdata_entry(makergoods);
		return "maker/goodsdata_entry";
	}
	/*录入部件信息*/
	@RequestMapping(value={"maker/partsdata_entry_page"})
	public String partsdata_entry_page() {
		System.out.println("maker/partsdata_entry_page");
		return "maker/partsdata_entry";
	}
	@RequestMapping(value={"maker/partsdata_entry"})
	public String partssdata_entry(Model model,HttpServletRequest request,HttpServletResponse response,
			MakerParts makerparts){
		System.out.println("maker/partsdata_entry");
//		InetAddress addr = InetAddress.getLocalHost();
//		String ip=addr.getHostAddress().toString();//获得本机IP
//		String address=addr.getHostName().toString();//获得本机名称
//		makerparts.setProductionArea(ip+"--"+address);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current_time = df.format(new Date());
		makerparts.setSignatureOne("Flying");
		makerparts.setFirstSigntime(current_time);
		makerparts.setStatus(0);
		partsService.partsdata_entry(makerparts);
		return null;
	}
}