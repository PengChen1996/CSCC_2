package com.zlzkj.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zlzkj.core.mybatis.SqlRunner;
import com.zlzkj.core.sql.Row;
@Service
@Transactional
public class OperateService {
	@Autowired
	private SqlRunner sqlRunner;
	
	//审核操作
	public List<Row> select_allgoods(int start,int pagesize,int goods_status){
		//start是从第几条开始 	desc倒序   asc正序
		String sql = "select * from x_goods where goods_status="+goods_status+""
				+ " ORDER BY id desc limit "+start+","+pagesize+"";
		List<Row> list = sqlRunner.select(sql);
		return list;
	}
	public int allgoods_total(int goods_status){
		int total=0;
		String sql = "select count(*) as total from x_goods where goods_status="+goods_status;
		total = sqlRunner.select(sql).get(0).getInt("total");
		return total;
	}
	//我的审核操作列表（-1回收站，1通过审核，2未通过审核）
	public List<Row> select_myrecords(int start,int pagesize,String signature_two,int goods_status){
		//start是从第几条开始 	desc倒序   asc正序
		String sql = "select * from x_goods where goods_status="+goods_status+" and goods_signature_two='"+signature_two+"'"
				+ " ORDER BY id desc limit "+start+","+pagesize+"";
		List<Row> list = sqlRunner.select(sql);
		return list;
	}
	public int myrecords_total(String signature_two,int goods_status){
		int total=0;
		String sql = "select count(*) as total from x_goods where goods_status="+goods_status+" and goods_signature_two='"+signature_two+"'";
		total = sqlRunner.select(sql).get(0).getInt("total");
		return total;
	}
	//通过审核
	public int audit_pass(String goods_id,int goods_status,String signature_two,String second_signtime){
		String sql = "update x_goods set goods_status = "+goods_status+","
				+ "goods_signature_two='"+signature_two+"',"
				+ "goods_second_signtime='"+second_signtime+"' where goods_id='"+goods_id+"'";
		sqlRunner.update(sql);
		return 0;
	}
}
