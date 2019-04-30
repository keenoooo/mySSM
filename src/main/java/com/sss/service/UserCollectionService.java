package com.sss.service;

import com.sss.pojo.UserCollection;

import java.util.List;

/**
 * Created by sss on 2019/5/13.
 */
public interface UserCollectionService {
    int deleteByPrimaryKey(Integer id);

    int insert(UserCollection record);

    int insertSelective(UserCollection record);

    UserCollection selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserCollection record);

    int updateByPrimaryKey(UserCollection record);

    int getCounts(int uid);

    List<UserCollection> selectByUid(int uid, int start);
}
