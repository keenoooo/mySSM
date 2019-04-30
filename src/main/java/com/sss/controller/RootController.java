package com.sss.controller;

import com.sss.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.controller
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/4/8 20:58
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/4/8    pc           v1.0.0               修改原因
 */
@Controller
public class RootController {
    @Resource
    private UserInformationService userInformationService;
    @Resource
    private UserPasswordService userPasswordService;
    @Resource
    private UserCollectionService userCollectionService;
    @Resource
    private UserReleaseService userReleaseService;
    @Resource
    private BoughtShopService boughtShopService;
    @Resource
    private UserWantService userWantService;
    @Resource
    private ShopCarService shopCarService;
    @Resource
    private OrderFormService orderFormService;
    @Resource
    private GoodsOfOrderFormService goodsOfOrderFormService;
    @Resource
    private UserStateService userStateService;
    @Resource
    private ShopInformationService shopInformationService;
    @Resource
    private GoodsCarService goodsCarService;
    @Resource
    private SpecificeService specificeService;
    @Resource
    private ClassificationService classificationService;
    @Resource
    private AllKindsService allKindsService;
    @Resource
    private ShopContextService shopContextService;
    @Resource
    private UserAddressService userAddressService;

    @RequestMapping({"/root" ,"/admin"})
    public String rootIndexPage(HttpServletRequest request, Model model){
        return "root/index";
    }

    @RequestMapping("/rootmoduser")
    public String modifyUser(HttpServletRequest req ,Model model){
        return "root/modifyUser";
    }
}
