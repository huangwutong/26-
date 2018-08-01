package com.xh369.dao;

import java.util.List;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;

public interface ProductSmallClassDAO{

    //查询产品大类
    List getProductBigClass();

    //添加产品小类
    boolean insertProductSmallClass(ProductSmallClass productSmallClass);

    //加载产品大类(根据ID)
    ProductBigClass getProductBigClassByID(Integer bigclassid);

    //删除产品小类
    boolean delProductSmallClass(Integer id);
}
