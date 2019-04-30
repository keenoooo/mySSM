package com.sss.service.Impl;

import com.sss.dao.UserPasswordMapper;
import com.sss.pojo.UserPassword;
import com.sss.service.UserPasswordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Maibenben on 2019/4/27.
 */
@Service("userPasswordService")
public class UserPasswordServiceImpl implements UserPasswordService{
    @Resource
    private
    UserPasswordMapper userPasswordMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(UserPassword record) {
        return userPasswordMapper.insert(record);
    }

    @Override
    public int insertSelective(UserPassword record) {
        return userPasswordMapper.insertSelective(record);
    }

    @Override
    public UserPassword selectByPrimaryKey(Integer id) {
        return userPasswordMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(UserPassword record) {
        return userPasswordMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(UserPassword record) {
        return userPasswordMapper.updateByPrimaryKey(record);
    }

    @Override
    public UserPassword selectByUid(Integer uid) {
        return this.userPasswordMapper.selectByUid(uid);
    }
}
