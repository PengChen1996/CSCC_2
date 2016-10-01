package com.zlzkj.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zlzkj.app.mapper.MakerPartsMapper;
import com.zlzkj.app.model.MakerParts;

@Service
@Transactional
public class MakerPartsService {
	@Autowired
	private MakerPartsMapper partsmapper;
	
	public int partsdata_entry(MakerParts makerparts){
		return partsmapper.insertSelective(makerparts);
	}
}
