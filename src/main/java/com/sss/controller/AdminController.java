package com.sss.controller;

import com.sss.pojo.AdminInformation;
import com.sss.service.Impl.AdminServiceImpl;
import com.sss.tool.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.controller
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/4/16 21:09
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/4/16    pc           v1.0.0               修改原因
 */
@Controller
public class AdminController {

    @Resource
    private AdminServiceImpl adminService;

    @RequestMapping(value = "/root",method = RequestMethod.POST)
    public String loginPage(){
        return "root/admin";
    }

    public String login(HttpServletRequest request, @RequestParam String adminNaem,
                        @RequestParam String password, @RequestParam String token,Model model){
        if(StringUtils.getInstance().isNullOrEmpty(token)){
            return "redirect:root/index";
        }
        if(StringUtils.getInstance().isNullOrEmpty(adminNaem) && StringUtils.getInstance().isNullOrEmpty(password)){
           return  "redirect:root/index";
        }
        if(adminVaild(adminNaem,password,request))
            return "root/index";
            return "redirect:root/index";
    }

    public boolean adminVaild(String name,String password,HttpServletRequest req){
        //adminSV.selectAllAdmins();
        return true;
    }
}
