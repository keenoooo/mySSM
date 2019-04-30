package com.sss.tool;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.tool
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/4/17 15:51
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/4/17    pc           v1.0.0               修改原因
 */
public class Const {

    public static final String TOKEN = "token";
    public static final String CURR_USER = "userInformation";
    public static final String UID = "uid";
    public static final String LOGIN_ERR= "login_error";
    public static final String PHONE = "userPhone";
    public static final String ADDRESS = "userAddress";
    public static final String RESULT = "result";

    public interface AlipayCallback{
        String TRADE_STATUS_WAIT_BUYER_PAY="WAIT_BUYER_PAY";
        String TRADE_STATUS_TRADE_SUCCESS="TRADE_SUCCESS";

        String RESPONSE_SUCCESS = "success";
        String RESPONSE_FAILED = "failed";
    }

    public enum OrderStatusEnum {
        CURRECT(-1,"在途订单"),
        CANCELED(0, "已取消"),
        NO_PAY(10, "未支付"),
        PAID(20, "已付款"),
        SHIPPED(40, "已发货"),
        ORDER_SUCCESS(50, "订单完成"),
        OEDER_CLOSE(60, "订单关闭");

        OrderStatusEnum(int code, String value) {
            this.code = code;
            this.value = value;
        }

        private String value;
        private int code;

        public String getValue() {
            return value;
        }

        public int getCode() {
            return code;
        }


        public static OrderStatusEnum codeOf(int code) {
            for (OrderStatusEnum orderStatusEnum : values()) {
                if (orderStatusEnum.getCode() == code) {
                    return orderStatusEnum;
                }
            }
            throw new RuntimeException("没有找到对应的枚举");
        }
    }

    public enum PayPlatformEnum{

        WHITCASH(0,"货到付款"),
        ALIPAY(1,"支付宝");

        private int code;
        private String value;

        PayPlatformEnum(int code, String value){
            this.code = code;
            this.value = value;
        }

        public int getCode(){
            return code;
        }

        public String getValue(){
            return value;
        }

        public static PayPlatformEnum codeOf(int code) {
            for (PayPlatformEnum payStatusEnum : values()) {
                if (payStatusEnum.getCode() == code) {
                    return payStatusEnum;
                }
            }
            throw new RuntimeException("没有找到对应的枚举");
        }
    }
}
