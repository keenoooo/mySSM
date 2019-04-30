package com.sss.service.Impl;

import com.sss.bean.UserAddressBean;
import com.sss.dao.UserAddressMapper;
import com.sss.service.UserAddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.service.Impl
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/1/18 17:48
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/1/18    pc           v1.0.0               修改原因
 */
@Service
public class UserAddressServiceimpl implements UserAddressService {
    @Resource
    private UserAddressMapper userAddressMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return userAddressMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(UserAddressBean address) {
        return userAddressMapper.insert(address);
    }

    @Override
    public int insertSelective(UserAddressBean address) {
        return userAddressMapper.insertSelective(address);
    }

    @Override
    public UserAddressBean selectByPrimaryKey(Integer id) {
        return userAddressMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(UserAddressBean address) {
        return userAddressMapper.updateByPrimaryKey(address);
    }

    @Override
    public int updateByPrimaryKey(UserAddressBean address) {
        return userAddressMapper.updateByPrimaryKey(address);
    }

    @Override
    public int getCounts() {
        return userAddressMapper.getCounts();
    }

    @Override
    public List<UserAddressBean> selectAddressByUid(int uid) {
        return userAddressMapper.selectAddressByUid(uid);
    }
}
