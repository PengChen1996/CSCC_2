package com.zlzkj.app.mapper;

import com.zlzkj.app.model.MakerGoods;

public interface MakerGoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MakerGoods record);

    int insertSelective(MakerGoods record);

    MakerGoods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MakerGoods record);

    int updateByPrimaryKeyWithBLOBs(MakerGoods record);

    int updateByPrimaryKey(MakerGoods record);
}