package com.zlzkj.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zlzkj.app.mapper.UserMapper;
import com.zlzkj.app.model.User;
import com.zlzkj.core.mybatis.SqlRunner;
import com.zlzkj.core.sql.Row;


@Service
@Transactional
public class UserService {
	@Autowired
	private UserMapper mapper;
	@Autowired
	private SqlRunner sqlRunner;

	public int userdata_entry(User user){
		return mapper.insertSelective(user);
	}
	
	public boolean login(String account,String password,int status){
		String sql = "select * from x_user where account='"+account+"' and password='"+password+"' and status="+status+"";
		List<Row> list = sqlRunner.select(sql);
		if(list.size()>0){
			return true;
		}else{
			return false;	
		}
	}
}
