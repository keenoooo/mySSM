package com.sss.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.demo.trade.config.Configs;
import com.sss.pojo.OrderForm;
import com.sss.pojo.OrderInfomation;
import com.sss.pojo.UserInformation;
import com.sss.service.Impl.OrderFormServiceImpl;
import com.sss.service.Impl.OrderServiceImpl;
import com.sss.tool.Const;
import com.sss.tool.ResponseCode;
import com.sss.tool.ServerResponse;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.controller.webSocket
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/4/17 15:08
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/4/17    pc           v1.0.0               修改原因
 */
@Controller
@RequestMapping("/order/")
public class OrderController {
    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Resource
    private OrderServiceImpl orderServiceImpl;

    @RequestMapping("pay")
    public ServerResponse pay(@RequestParam Long orderNo , HttpServletRequest request , HttpSession session){
        UserInformation user = (UserInformation) session.getAttribute(Const.CURR_USER);
        if(user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),ResponseCode.NEED_LOGIN.getDesc());
        }

        return orderServiceImpl.pay(user.getId() ,orderNo);
    }

    @RequestMapping("AlipayCallback")
    public Object alipayCallback(HttpServletRequest request){
        HashMap<String, String> params = new HashMap<>();
        Map retmap = request.getParameterMap();
        for(Iterator it = retmap.keySet().iterator(); it.hasNext();){
            String name = (String) it.next();
            String[] value = (String[]) retmap.get(name);
            String val = "";
            for(int i = 0; i<value.length; i++){
                val = (i==value.length) ? val+value[i]+"," : val+value[i] ;
            }
            params.put(name,val);
        }

        logger.info("支付宝回调, sign:{},trade_status:{},参数:{}",params.get("sign"),params.get("trade_status"),params.toString());

        params.remove("sign_type");

        try {
            boolean alipayRSACheckedV2 = AlipaySignature.rsaCheckV2(params, Configs.getAlipayPublicKey(),"utf-8", Configs.getSignType());
            if(!alipayRSACheckedV2){
                return ServerResponse.createByErrorMessage("非法请求，验证不通过");
            }
        } catch (AlipayApiException e) {
            logger.info("支付宝回调异常",e);
        }

        //TODO  验证各种数据
        ServerResponse serverResponse = orderServiceImpl.alipayCallback(params);
        if(serverResponse.isSuccess()){
            return Const.AlipayCallback.RESPONSE_SUCCESS;
        }
        return Const.AlipayCallback.RESPONSE_FAILED;

    }
}
