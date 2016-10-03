package com.zlzkj.app.mapper;

import com.zlzkj.app.model.MakerParts;

public interface MakerPartsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MakerParts record);

    int insertSelective(MakerParts record);

    MakerParts selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MakerParts record);

    int updateByPrimaryKeyWithBLOBs(MakerParts record);

    int updateByPrimaryKey(MakerParts record);
}