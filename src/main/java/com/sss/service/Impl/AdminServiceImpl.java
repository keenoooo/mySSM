package com.sss.service.Impl;

import com.sss.dao.AdminInformationMapper;
import com.sss.pojo.AdminInformation;
import com.sss.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Copyright: Copyright (c) 2019 Asiainfo-Linkage
 *
 * @ClassName: com.sss.service.Impl
 * @Description: 该类的功能描述
 * @version: v1.0.0
 * @author: pc
 * @date: 2019/4/16 20:42
 * <p>
 * Modification History:
 * Date         Author          Version            Description
 * ---------------------------------------------------------*
 * 2019/4/16    pc           v1.0.0               修改原因
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminInformationMapper mapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        mapper.deleteByPrimaryKey(id);
        return 0;
    }

    @Override
    public int insert(AdminInformation adminInformation) {
        mapper.insert(adminInformation);
        return 0;
    }

    @Override
    public int insertSelective(AdminInformation adminInformation) {
        return mapper.insertSelective(adminInformation);
    }

    @Override
    public AdminInformation selectByPrimaryKey(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(AdminInformation adminInformation) {
        return mapper.updateByPrimaryKeySelective(adminInformation);
    }

    @Override
    public int updateByPrimaryKey(AdminInformation adminInformation) {
        return mapper.updateByPrimaryKey(adminInformation);
    }

    @Override
    public List<AdminInformation> selectAllAdmins(Integer sno) {
        if (sno == 1) {
            return mapper.selectByNo(sno);
        } else if (sno == 2) {
            List<AdminInformation> list = mapper.selectByNo(sno);
            List<AdminInformation> list2 = mapper.selectByNo(sno - 1);
            for (AdminInformation adminInformation : list2) {
                list.add(adminInformation);
            }
            return list;
        } else {
            List<AdminInformation> list = mapper.selectByNo(sno);
            List<AdminInformation> list2 = mapper.selectByNo(sno - 1);
            List<AdminInformation> list3 = mapper.selectByNo(sno - 2);
            for (AdminInformation adminInformation : list2) {
                list.add(adminInformation);
            }
            for (AdminInformation adminInformation : list3) {
                list.add(adminInformation);
            }
            return list;
        }
    }


}
