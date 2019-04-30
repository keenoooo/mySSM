package com.sss.service;

import com.sss.pojo.OrderForm;
import com.sss.tool.ServerResponse;

import java.util.List;

/**
 * Created by sss on 2019/5/13.
 */
public interface OrderFormService {
    int deleteByPrimaryKey(Long id);

    int insert(OrderForm record);

    int insertSelective(OrderForm record);

    OrderForm selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrderForm record);

    int updateByPrimaryKey(OrderForm record);

    int getCounts(int uid);

    List<OrderForm> selectByUid(int uid, int start);

    //path 支付二维码存放路径
    ServerResponse pay(Long id , int uid ,String path);
}
