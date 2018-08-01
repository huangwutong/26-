package com.xh369.dao;

import java.util.List;
import com.xh369.dto.Articlesviews;
import com.xh369.dto.ArticlesviewsId;

public interface ArticlesviewsDAO{

    //按视图主键查询
    Articlesviews findById(ArticlesviewsId id);

    //按视图实例类查询(采用Criteria编程)
    List findByExample(Articlesviews instance);

    //按视图编号查询
    List findByPropertyId(String propertyName, Object value);

    //用于分页查询(其中int position_index, int pageSize分别为起始索引和页大小)
    List findByProperty(Object[][] val, int position_index, int pageSize);
    
    //用于分页查询(其中int position_index, int pageSize分别为起始索引和页大小)
    List findByProperty(int position_index, int pageSize);

    //得到分页查询的总记录数
    int getCount(Object[][] val);
    
    //得到分页查询的总记录数
    int getCount();
}
