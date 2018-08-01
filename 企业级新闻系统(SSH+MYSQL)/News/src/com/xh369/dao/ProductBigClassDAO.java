package com.xh369.dao;

import com.xh369.dto.ProductBigClass;
import java.util.List;

public interface ProductBigClassDAO{

    //添加产品大类,且给其添加初始小类(即不指定小类)
    boolean insertProductBigClass(ProductBigClass productBigClass);

    //查询出一级产品分类与二级产品分类,通过一级产品分类导航到二级产品分类
    List getAllProductBigClass();

    //删除产品大类,且级联删除其小类
    boolean delProductBigClass(Integer id);
}
