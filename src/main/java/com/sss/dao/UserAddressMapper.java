package com.sss.dao;

import com.sss.bean.UserAddressBean;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.dao
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/1/18 17:05
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/1/18    pc           v1.0.0               修改原因
 */
public interface UserAddressMapper {
    UserAddressBean selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(UserAddressBean address);

    int updateByPrimaryKeySelective(UserAddressBean address);

    int deleteByPrimaryKey(Integer id );

    int insert(UserAddressBean address);

    int insertSelective(UserAddressBean record);

    @Select("select * from useraddress where uid=#{uid} and display=1 order by id desc")
    List<UserAddressBean> selectAddressByUid(Integer uid);

    int getCounts();

    List<UserAddressBean> getAllAddress();

}
