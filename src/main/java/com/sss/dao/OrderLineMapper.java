package com.sss.dao;

import com.alipay.api.domain.OrderItem;
import com.sss.pojo.OrderLine;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderLineMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderLine record);

    int insertSelective(OrderLine record);

    OrderLine selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderLine record);

    int updateByPrimaryKey(OrderLine record);

    //根据用户的Id和订单号获取订单详情
    List<OrderLine> getByOrderNoUserId(@Param("orderNo") Long orderNo, @Param("userId") Integer userId);

    //根据用户的Id和订单号获取订单详情(管理员查询)
    List<OrderLine> getAllByOrderNo(Long orderNo);

    //批量插入订单中的商品信息
    void batchInsert(@Param("orderLineList") List<OrderLine> orderLineList);
}