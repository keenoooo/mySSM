package com.sss.service;

import com.sss.pojo.AdminInformation;

import java.util.List;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.service
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/4/16 20:34
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/4/16    pc           v1.0.0               修改原因
 */
public interface AdminService {
    int deleteByPrimaryKey(Integer id);

    int insert(AdminInformation adminInformation);

    int insertSelective(AdminInformation adminInformation);

    AdminInformation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AdminInformation adminInformation);

    int updateByPrimaryKey(AdminInformation adminInformation);

    List<AdminInformation> selectAllAdmins(Integer sno);
}
