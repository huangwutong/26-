package com.xh369.dao;

import com.xh369.dto.SmallClass;

public interface SmallClassDAO {

    //添加二级分类
    boolean addSmall(SmallClass smallClass);

    //修改二级分类
    boolean updateOnlySmallClass(SmallClass smallClass);

    //删除二级分类
    boolean deleteSmallClass(Integer id);

    //加载二级分类
    SmallClass loadSmallClass(Integer id);
}
