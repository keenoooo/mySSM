package com.sss.service;

import com.sss.pojo.Specific;

import java.util.List;

/**
 * Created by sss on 2019/5/13.
 */
public interface SpecificeService {
    int deleteByPrimaryKey(Integer id);

    int insert(Specific record);

    int insertSelective(Specific record);

    Specific selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Specific record);

    int updateByPrimaryKey(Specific record);

    List<Specific> selectByCid(int cid);
}
