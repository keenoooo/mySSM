package com.sss.dao;

import com.sss.pojo.AdminInformation;

import java.util.List;

public interface AdminInformationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AdminInformation record);

    int insertSelective(AdminInformation record);

    AdminInformation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AdminInformation record);

    int updateByPrimaryKey(AdminInformation record);

    List<AdminInformation> selectByNo(int ano);
}