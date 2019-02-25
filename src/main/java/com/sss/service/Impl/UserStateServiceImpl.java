package com.sss.service.Impl;

import com.sss.dao.UserStateMapper;
import com.sss.pojo.UserState;
import com.sss.service.UserStateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by sss on 2017/5/13.
 */
@Service
public class UserStateServiceImpl implements UserStateService {
    @Resource
    private UserStateMapper userStateMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(UserState record) {
        return userStateMapper.insert(record);
    }

    @Override
    public int insertSelective(UserState record) {
        return userStateMapper.insertSelective(record);
    }

    @Override
    public UserState selectByPrimaryKey(Integer id) {
        return userStateMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(UserState record) {
        return userStateMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(UserState record) {
        return userStateMapper.updateByPrimaryKey(record);
    }

    @Override
    public UserState selectByUid(int uid) {
        return userStateMapper.selectByUid(uid);
    }
}
