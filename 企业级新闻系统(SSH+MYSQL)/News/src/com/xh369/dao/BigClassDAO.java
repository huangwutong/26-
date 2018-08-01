package com.xh369.dao;

import com.xh369.dto.BigClass;

public interface BigClassDAO {

    //一级分类添加
    boolean articleBigClassAdd(BigClass bigClass);

    //查询出所要添加的二级分类所在的一级分类
    BigClass addSmallClass(Integer bigclassid);

    //修改一级分类页面
    boolean updateOnlyBigClass(BigClass bigClass);

    //删除一级分类
    boolean deleteBigClass(Integer id);

    //加载一级分类
    BigClass loadBigClass(Integer id);
}
