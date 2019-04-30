package com.sss.service;

import com.sss.pojo.OrderInfomation;
import com.sss.tool.ServerResponse;

import java.util.Map;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.service
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/4/18 14:04
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/4/18    pc           v1.0.0               修改原因
 */
public interface OrderInformationService {
    //支付宝接口实现
    ServerResponse pay(Integer uid ,Long orderNo );
    //支付宝回调接口
    ServerResponse alipayCallback(Map<String,String> params);
    //创建订单
    ServerResponse createOrder(OrderInfomation orderInfomation);
    //取消订单
    ServerResponse<String> cancel(Integer uid, Long orderNo);
    //根据订单编号获取订单
    ServerResponse getOrderById(Long orderNo);
    //根据用户id和订单编号查询订单
    ServerResponse getOrderByUseridAndOrderId(Integer uid, Long orderNo);
    //根据订单编号查询订单项详情
    ServerResponse getOrderLineByOrderNo(Long orderNo);
    //管理员后台查询订单接口



}
