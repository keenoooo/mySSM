package com.sss.service;

import com.sss.pojo.ShopPicture;

import java.util.List;

/**
 * Created by sss on 2019/5/12.
 */
public interface ShopPictureService {
    int deleteByPrimaryKey(Integer id);

    int insert(ShopPicture record);

    int insertSelective(ShopPicture record);

    ShopPicture selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ShopPicture record);

    int updateByPrimaryKey(ShopPicture record);

    ShopPicture selectBySidOnlyOne(Integer sid);

    List<ShopPicture> selectBySid(Integer sid);
}
