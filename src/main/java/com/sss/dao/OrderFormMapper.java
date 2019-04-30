package com.sss.dao;

import com.sss.pojo.OrderForm;

import java.util.List;

public interface OrderFormMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OrderForm record);

    int insertSelective(OrderForm record);

    OrderForm selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrderForm record);

    int updateByPrimaryKey(OrderForm record);

    int getCounts(int uid);

    List<OrderForm> selectByUid(int uid, int start);
}