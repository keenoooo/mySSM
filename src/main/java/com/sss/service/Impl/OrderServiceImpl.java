package com.sss.service.Impl;

import com.alipay.api.AlipayResponse;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.alipay.demo.trade.config.Configs;
import com.alipay.demo.trade.model.ExtendParams;
import com.alipay.demo.trade.model.GoodsDetail;
import com.alipay.demo.trade.model.builder.AlipayTradePrecreateRequestBuilder;
import com.alipay.demo.trade.model.result.AlipayF2FPrecreateResult;
import com.alipay.demo.trade.service.AlipayTradeService;
import com.alipay.demo.trade.service.impl.AlipayTradeServiceImpl;
import com.alipay.demo.trade.utils.ZxingUtils;
import com.sss.dao.OrderInfomationMapper;
import com.sss.dao.OrderLineMapper;
import com.sss.dao.PayInfoMapper;
import com.sss.pojo.OrderInfomation;
import com.sss.pojo.OrderLine;
import com.sss.pojo.PayInfo;
import com.sss.service.OrderInformationService;
import com.sss.tool.*;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.service.Impl
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/4/18 14:48
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/4/18    pc           v1.0.0               修改原因
 */
@Service
public class OrderServiceImpl implements OrderInformationService {
    private static final Logger logger = LoggerFactory.getLogger(OrderServiceImpl.class);
    @Resource
    private OrderInfomationMapper orderInfomationMapper;
    @Resource
    private OrderLineMapper orderLineMapper;
    @Resource
    private GoodsCarServiceImpl goodsCarService;
    @Resource
    private PayInfoMapper payInfoMapper;

    @Override
    public ServerResponse pay(Integer uid, Long orderNo) {
        String path = PropertiesUtil.getProperty("qrpath");
        HashMap<String, String> resultMap = new HashMap<>();
        OrderInfomation order = orderInfomationMapper.selectByPrimaryKey(orderNo);
        if(order == null){
            return ServerResponse.createByErrorMessage("该用户没有此订单。");
        }
        resultMap.put("orderNo",String.valueOf(orderNo));
        // (必填) 商户网站订单系统中唯一订单号，64个字符以内，只能包含字母、数字、下划线，
        // 需保证商户系统端不能重复，建议通过数据库sequence生成，
        String outTradeNo = order.getId().toString();

        // (必填) 订单标题，粗略描述用户的支付目的。如“xxx品牌xxx门店当面付扫码消费”
        String subject = new StringBuilder().append("C2C校园二手商城扫码支付").append(outTradeNo).toString();

        // (必填) 订单总金额，单位为元，不能超过1亿元
        // 如果同时传入了【打折金额】,【不可打折金额】,【订单总金额】三者,则必须满足如下条件:【订单总金额】=【打折金额】+【不可打折金额】
        String totalAmount = order.getPayment().toString();

        // (可选) 订单不可打折金额，可以配合商家平台配置折扣活动，如果酒水不参与打折，则将对应金额填写至此字段
        // 如果该值未传入,但传入了【订单总金额】,【打折金额】,则该值默认为【订单总金额】-【打折金额】
        String undiscountableAmount = "0";

        // 卖家支付宝账号ID，用于支持一个签约账号下支持打款到不同的收款账号，(打款到sellerId对应的支付宝账号)
        // 如果该字段为空，则默认为与支付宝签约的商户的PID，也就是appid对应的PID
        String sellerId = "";

        // 订单描述，可以对交易或商品进行一个详细地描述，比如填写"购买商品2件共15.00元"
        String body = new StringBuilder().append("订单").append(outTradeNo).append("购买商品共").append(totalAmount).append("元").toString();

        // 商户操作员编号，添加此参数可以为商户操作员做销售统计
        String operatorId = "test_operator_id";

        // (必填) 商户门店编号，通过门店号和商家后台可以配置精准到门店的折扣信息，详询支付宝技术支持
        String storeId = "test_store_id";

        // 业务扩展参数，目前可添加由支付宝分配的系统商编号(通过setSysServiceProviderId方法)，详情请咨询支付宝技术支持
        ExtendParams extendParams = new ExtendParams();
        extendParams.setSysServiceProviderId("2088100200300400500");

        // 支付超时，定义为120分钟
        String timeoutExpress = "120m";

        // 商品明细列表，需填写购买商品详细信息，
        List<GoodsDetail> goodsDetailList = new ArrayList<GoodsDetail>();

        List<OrderLine> orderLineList= orderLineMapper.getByOrderNoUserId(orderNo,uid);
        for (OrderLine orderLine : orderLineList){
            // 创建一个商品信息，参数含义分别为商品id（使用国标）、名称、单价（单位为分）、数量，如果需要添加商品类别，详见GoodsDetail
            GoodsDetail goods = GoodsDetail.newInstance(orderLine.getSid().toString(), orderLine.getSname(),
                    BigDecimalUtil.mul(orderLine.getTotalPrice().doubleValue(),
                            new Double(100).doubleValue()).longValue(), orderLine.getQuantity());
            // 创建好一个商品后添加至商品明细列表
            goodsDetailList.add(goods);
        }



//            // 创建一个商品信息，参数含义分别为商品id（使用国标）、名称、单价（单位为分）、数量，如果需要添加商品类别，详见GoodsDetail
//            GoodsDetail goods1 = GoodsDetail.newInstance("goods_id001", "xxx小面包", 1000, 1);
//            // 创建好一个商品后添加至商品明细列表
//            goodsDetailList.add(goods1);


        // 继续创建并添加第一条商品信息，用户购买的产品为“黑人牙刷”，单价为5.00元，购买了两件
//            GoodsDetail goods2 = GoodsDetail.newInstance("goods_id002", "xxx牙刷", 500, 2);
//            goodsDetailList.add(goods2);

        // 创建扫码支付请求builder，设置请求参数
        AlipayTradePrecreateRequestBuilder builder = new AlipayTradePrecreateRequestBuilder()
                .setSubject(subject).setTotalAmount(totalAmount).setOutTradeNo(outTradeNo)
                .setUndiscountableAmount(undiscountableAmount).setSellerId(sellerId).setBody(body)
                .setOperatorId(operatorId).setStoreId(storeId).setExtendParams(extendParams)
                .setTimeoutExpress(timeoutExpress)
                .setNotifyUrl(PropertiesUtil.getProperty("alipay.callback.url"))//支付宝服务器主动通知商户服务器里指定的页面http路径,根据需要设置
                //.setNotifyUrl("http://kxkc7h.natappfree.cc/order/alipay_callback.do")
                .setGoodsDetailList(goodsDetailList);


        /** 一定要在创建AlipayTradeService之前调用Configs.init()设置默认参数
         *  Configs会读取classpath下的zfbinfo.properties文件配置信息，如果找不到该文件则确认该文件是否在classpath目录
         */
        Configs.init("zfbinfo.properties");

        /** 使用Configs提供的默认参数
         *  AlipayTradeService可以使用单例或者为静态成员对象，不需要反复new
         */
        AlipayTradeService tradeService = new AlipayTradeServiceImpl.ClientBuilder().build();

        AlipayF2FPrecreateResult result = tradeService.tradePrecreate(builder);

        switch (result.getTradeStatus()) {
            case SUCCESS:
                logger.info("支付宝预下单成功: )");

                AlipayTradePrecreateResponse response = result.getResponse();
                dumpResponse(response);

                //检查是否存在上传文件夹，如果不存在就赋予创建文件夹权限
                File folder = new File(path);
                if(!folder.exists()){
                    folder.setWritable(true);
                    folder.mkdirs();
                }

                // 需要修改为运行机器上的路径  C:\  /Users/sudo/Desktop
                String qrpath = String.format(path+"/qr-%s.png",response.getOutTradeNo());

                String qrFileName = String.format("/qr-%s.png",response.getOutTradeNo());

                ZxingUtils.getQRCodeImge(response.getQrCode(),256,qrpath);

                File targetFile = new File(path,qrFileName);
                try {
                     targetFile.createNewFile();
                } catch (IOException e) {
                    targetFile.deleteOnExit();
                    try {
                        targetFile.createNewFile();
                    } catch (IOException e1) {
                        e1.printStackTrace();
                    }
                }
                //try {
                //    //将生成的二维码上传到FTP服务器上
                //    FTPUtil.uploadFile(Lists.newArrayList(targetFile));
                //} catch (IOException e) {
                //    logger.info("上传二维码异常",e);
                //}
                //
                //
                //logger.info("qrpath:" + qrpath);
                //String qrUrl = PropertiesUtil.getProperty("ftp.server.http.prefix")+targetFile.getName();
                resultMap.put("qrUrl",path+qrFileName);
                return ServerResponse.createBySuccess(resultMap);

            case FAILED:
                logger.error("支付宝预下单失败!!!");
                return ServerResponse.createByErrorMessage("支付宝预下单失败!!!");

            case UNKNOWN:
                logger.error("系统异常，预下单状态未知!!!");
                return ServerResponse.createByErrorMessage("系统异常，预下单状态未知!!!");

            default:
                logger.error("不支持的交易状态，交易返回异常!!!");
                return ServerResponse.createByErrorMessage("不支持的交易状态，交易返回异常!!!");
        }

    }

    // 简单打印应答
    private void dumpResponse(AlipayResponse response) {
        if (response != null) {
            logger.info(String.format("code:%s, msg:%s", response.getCode(), response.getMsg()));
            if (StringUtils.isNotEmpty(response.getSubCode())) {
                logger.info(String.format("subCode:%s, subMsg:%s", response.getSubCode(),
                        response.getSubMsg()));
            }
            logger.info("body:" + response.getBody());
        }
    }

    @Override
    public ServerResponse alipayCallback(Map<String, String> params) {
        //        System.out.println("支付宝回调");
        Long orderNo = Long.parseLong(params.get("out_trade_no"));
        String tradeNo= params.get("trade_no");
        String tradeStatus = params.get("trade_status");

        OrderInfomation order = orderInfomationMapper.selectByPrimaryKey(orderNo);

        if(order == null){
            return  ServerResponse.createByErrorMessage("非该商场的订单，回调忽略");

        }
        if(order.getPaystate()>= Const.OrderStatusEnum.PAID.getCode()){
            return ServerResponse.createBySuccess("支付宝重复调用");
        }
        String su="TRADE_SUCCESS";
        if(su.equals(tradeStatus)){
//            System.out.println("开始更新为支付完成状态");
            order.setPaymentTime(DateTimeUtil.strToDate(params.get("gmt_payment")));
            order.setPaystate(Const.OrderStatusEnum.PAID.getCode());

            orderInfomationMapper.updateByPrimaryKeySelective(order);
        }

        PayInfo payInfo =new PayInfo();
        payInfo.setUid(order.getUid());
        payInfo.setOdno(order.getId());
        payInfo.setPaystate(String.valueOf(Const.PayPlatformEnum.ALIPAY.getCode()));
        payInfo.setPayno(tradeNo);
        payInfo.setPaystate(tradeStatus);

        payInfoMapper.insert(payInfo);
        return ServerResponse.createBySuccess();
    }

    @Override
    public ServerResponse createOrder(OrderInfomation orderInfomation) {
        return null;
    }

    @Override
    public ServerResponse<String> cancel(Integer uid, Long orderNo) {
        return null;
    }

    @Override
    public ServerResponse getOrderById(Long orderNo) {
        return null;
    }

    @Override
    public ServerResponse getOrderByUseridAndOrderId(Integer uid, Long orderNo) {
        return null;
    }

    @Override
    public ServerResponse getOrderLineByOrderNo(Long orderNo) {
        return null;
    }
}
