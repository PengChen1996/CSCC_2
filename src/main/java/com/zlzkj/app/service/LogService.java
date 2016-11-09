package com.zlzkj.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zlzkj.app.mapper.LogMapper;
import com.zlzkj.app.model.Log;
import com.zlzkj.core.mybatis.SqlRunner;
import com.zlzkj.core.sql.Row;

@Service
@Transactional
public class LogService {
	@Autowired
	private SqlRunner sqlRunner;
	@Autowired
	private LogMapper logmapper;
	
	public int add(Log log){
		return logmapper.insertSelective(log);
	}
	public String getop_num(){
		String sql = "select max(op_num) from x_log";
		List<Row> list = sqlRunner.select(sql);
		String op_num;
		if(list.get(0)!=null){
			op_num = list.get(0).getString("max(op_num)");
			System.out.println(list);
		}
		else{
			op_num = "0";
		}
		return op_num;
	}
}
