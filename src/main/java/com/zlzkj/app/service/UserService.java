package com.zlzkj.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zlzkj.app.mapper.UserMapper;
import com.zlzkj.app.model.User;

@Service
@Transactional
public class UserService {
	@Autowired
	private UserMapper mapper;

	public int userdata_entry(User user){
		return mapper.insertSelective(user);
	}
}
