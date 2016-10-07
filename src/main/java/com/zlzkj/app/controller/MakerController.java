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
import com.zlzkj.app.model.MakerGoods;
import com.zlzkj.app.model.MakerParts;
import com.zlzkj.app.service.MakerGoodsService;
import com.zlzkj.app.service.MakerPartsService;
import com.zlzkj.app.service.SearchGoodsService;
import com.zlzkj.app.util.createImg;
import com.zlzkj.core.base.BaseController;
import com.zlzkj.core.sql.Row;

@Controller
public class MakerController extends BaseController{
	@Autowired
	private MakerGoodsService goodsService;
	@Autowired
	private MakerPartsService partsService;
	@Autowired
	private SearchGoodsService searchService;
	
	/*录入商品信息*/
	@RequestMapping(value={"maker/goodsdata_entry_page"})
	public String goodsdata_entry_page() {
		System.out.println("maker/goodsdata_entry_page");
		return "maker/goodsdata_entry";
	}
	@RequestMapping(value={"maker/goodsdata_entry"})
	public String goodsdata_entry(Model model,HttpServletRequest request,HttpServletResponse response,
			MakerGoods makergoods) throws IOException {
		System.out.println("maker/goodsdata_entry");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current_time = df.format(new Date());
		makergoods.setGoodsSignatureOne("Flying");
		makergoods.setGoodsFirstSigntime(current_time);
		makergoods.setGoodsStatus(0);
		/*保存url到数据库*/
		String goods_id = makergoods.getGoodsId();
		String img_name = goods_id.split("#")[1];
		System.out.println(img_name);
		String colormobi = "http://localhost:8080/CSCC_2/static/color_img/%23"+img_name+".jpg";
		makergoods.setColormobi(colormobi);
		/*保存图片到tomcat*/
		String path = request.getRealPath("/static/color_img");
		String savePath = path+"/"+goods_id+".jpg";//保存路径
//		System.out.println(savePath);
		/*生成彩码*/
		createImg cg = new createImg();
		cg.graphicsGeneration(goods_id, savePath);
		goodsService.goodsdata_entry(makergoods);
		
		PrintWriter out = response.getWriter();  
//		JSONObject jo = new JSONObject();
//		jo.put("colormobi_url",colormobi);
//		out.write(jo.toString());
		out.write(colormobi);
		return null;
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
		makerparts.setPartsSignatureOne("Flying");
		makerparts.setPartsFirstSigntime(current_time);
		makerparts.setPartsStatus(0);
		partsService.partsdata_entry(makerparts);
		return null;
	}
	/*批量录入商品*/
	@RequestMapping(value={"maker/volumedata_entry_page"})
	public String volumedata_entry_page() {
		System.out.println("maker/volumedata_entry_page");
		return "maker/volumedata_entry";
	}
	/*查询商品信息*/
	@RequestMapping(value={"maker/search_data_page"})
	public String search_data_page() {
		System.out.println("maker/search_data_page");
		return "maker/search_data";
	}
	@RequestMapping(value={"maker/search_data"})
	public String select_goods(Model model,HttpServletRequest request,HttpServletResponse response,
			MakerGoods makergoods) throws IOException {
			
			String goods_id = makergoods.getGoodsId();
			List<Row> goods_list = searchService.select_goods(goods_id);//产品信息
			List<Row> parts_list = searchService.select_parts(goods_id);//部件信息
//			System.out.println(goods_list);
			
			PrintWriter out = response.getWriter();  
			JSONObject jo = new JSONObject();
			jo.put("goods",goods_list);
			jo.put("parts",parts_list);
			out.write(jo.toString());
			return null;
		}
}