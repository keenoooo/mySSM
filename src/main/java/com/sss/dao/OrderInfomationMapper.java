package com.sss.dao;

import com.sss.pojo.OrderInfomation;

public interface OrderInfomationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(OrderInfomation record);

    int insertSelective(OrderInfomation record);

    OrderInfomation selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrderInfomation record);

    int updateByPrimaryKey(OrderInfomation record);

}