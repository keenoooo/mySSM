package com.sss.service;

import com.sss.pojo.UserRelease;

import java.util.List;

/**
 * Created by sss on 2017/5/13.
 */
public interface UserReleaseService {
    int deleteByPrimaryKey(Integer id);

    int insert(UserRelease record);

    int insertSelective(UserRelease record);

    UserRelease selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserRelease record);

    int updateByPrimaryKey(UserRelease record);

    int getCounts(int uid);

    List<UserRelease> selectByUid(int uid, int start);

    List<UserRelease> selectUserProductByUid(int uid);
}
