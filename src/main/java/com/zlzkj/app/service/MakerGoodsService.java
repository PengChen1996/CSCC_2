package com.zlzkj.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zlzkj.app.mapper.MakerGoodsMapper;
import com.zlzkj.app.model.MakerGoods;

@Service
@Transactional
public class MakerGoodsService {
	@Autowired
	private MakerGoodsMapper goodsmapper;
	
	public int goodsdata_entry(MakerGoods makergoods){
		return goodsmapper.insertSelective(makergoods);
	}
}
