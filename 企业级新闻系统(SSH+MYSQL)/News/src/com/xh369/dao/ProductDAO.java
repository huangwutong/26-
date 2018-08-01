package com.xh369.dao;

import com.xh369.dto.Product;
import java.util.List;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;

public interface ProductDAO{

    //添加产品
    boolean insertProduct(Product product);

    //产品浏览
    List getProduct();

    //产品修改(首先显示出原数据)
    Product showProduct(Integer id);

    //产品修改
    boolean updateProduct(Product product);

    //产品删除
    boolean delProduct(Integer id);

    //在栏目管理模块中显示一级分类,从而导航到二级分类
    List getProductBigClass();

    //加载一级分类,按ID查询
    ProductBigClass getProductBigClassByID(Integer id);

    //加载二级分类,按ID查询
    ProductSmallClass getProductSmallClassByID(Integer id);
}
