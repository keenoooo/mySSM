package com.sss.service;

import com.sss.bean.UserAddressBean;

import java.util.List;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.service
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/1/18 17:15
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/1/18    pc           v1.0.0               修改原因
 */
public interface UserAddressService {
    int deleteByPrimaryKey(Integer id);

    int insert(UserAddressBean address);

    int insertSelective(UserAddressBean address);

    UserAddressBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserAddressBean address);

    int updateByPrimaryKey(UserAddressBean address);

    int getCounts();

    List<UserAddressBean> selectAddressByUid(int uid);
}
