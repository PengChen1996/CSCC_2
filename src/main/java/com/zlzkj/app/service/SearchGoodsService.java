package com.zlzkj.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zlzkj.core.mybatis.SqlRunner;
import com.zlzkj.core.sql.Row;
@Service
@Transactional
public class SearchGoodsService {
	@Autowired
	private SqlRunner sqlRunner;
	
	public List<Row> select_goods(String goods_id){
		String sql = "select * from x_goods where goods_id='"+goods_id+"'";
		List<Row> list = sqlRunner.select(sql);
		return list;
	}
	public List<Row> select_parts(String parts_belongs){
		String sql = "select * from x_parts where parts_belongs='"+parts_belongs+"'";
		List<Row> list = sqlRunner.select(sql);
		return list;
	}
}
