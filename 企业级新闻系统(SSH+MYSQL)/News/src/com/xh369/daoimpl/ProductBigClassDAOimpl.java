package com.xh369.daoimpl;

import org.springframework.orm.hibernate3.support.*;
import com.xh369.dao.ProductBigClassDAO;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;
import java.util.*;

public class ProductBigClassDAOimpl extends HibernateDaoSupport implements ProductBigClassDAO{

    //添加产品大类,且给其添加初始小类(即不指定小类)
    public boolean insertProductBigClass(ProductBigClass productBigClass){

        try {
            getHibernateTemplate().save(productBigClass);
            ProductSmallClass productSmallClass = new ProductSmallClass();
            productSmallClass.setSmallclassname("no small");
            productSmallClass.setProductbigclass(productBigClass);
            getHibernateTemplate().save(productSmallClass);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //查询出一级产品分类与二级产品分类,通过一级产品分类导航到二级产品分类
    public List getAllProductBigClass(){

        try {
            String hql = "from ProductBigClass as productBigClass";
            List aList = getHibernateTemplate().find(hql);
            Iterator it = aList.iterator();
            while(it.hasNext()){
                ProductBigClass productBigClass = (ProductBigClass) it.next();
                getHibernateTemplate().initialize(productBigClass.getProductsmallclass());
            }
            return aList;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    //删除产品大类,且级联删除其小类
    public boolean delProductBigClass(Integer id){

        try {
            ProductBigClass productBigClass = (ProductBigClass) getHibernateTemplate().load(ProductBigClass.class, id);
            getHibernateTemplate().delete(productBigClass);
            return true;
        } catch (Exception ex){
            ex.printStackTrace();
            return false;
        }
    }
}

