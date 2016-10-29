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
}
