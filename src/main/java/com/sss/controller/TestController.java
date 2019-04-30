package com.sss.controller;

import com.sss.pojo.ShopCar;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.controller
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/1/9 9:40
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/1/9    pc           v1.0.0               修改原因
 */
@Controller
public class TestController {

    @RequestMapping(value = "/test", method = {RequestMethod.POST,RequestMethod.GET})
    public String requestHandlerMethod(HttpServletRequest request, Model model){
        System.out.println("进入请求方法");
        Enumeration<String> names = request.getAttributeNames();
        HashMap<String, Object> map = new HashMap<>();
        System.out.println("开始打印request");
        while(names.hasMoreElements()){
            String name = names.nextElement();
           map.put(name,request.getAttribute(name));
            System.out.println(request.getAttribute(name));
        }

        System.out.println("开始打印Model中的数据");
        Map<String, Object> asMap = model.asMap();
        for(String str:asMap.keySet()){
            System.out.println(str+"------"+asMap.get(str));
        }
        return "index";
    }

    @ModelAttribute("str1")
    public ShopCar testModel1(){
        System.out.println("添加ModleAttribute");
        ShopCar shopCar = new ShopCar();
        return shopCar;
    }
    @ModelAttribute("str2")
    public String testModel2(){
        System.out.println("添加ModleAttribute");
        return "test2";
    }
}
