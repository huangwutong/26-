package com.xh369.daoimpl;

import org.springframework.orm.hibernate3.support.*;
import com.xh369.dao.ProductSmallClassDAO;
import java.util.List;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;
import java.util.Iterator;

public class ProductSmallClassDAOimpl extends HibernateDaoSupport implements ProductSmallClassDAO{

    //查询产品大类,从而导航到产品小类
    public List getProductBigClass(){

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

    //添加产品小类
    public boolean insertProductSmallClass(ProductSmallClass productSmallClass){

        try {
            getHibernateTemplate().save(productSmallClass);
            return true;
        } catch (Exception ex){
            ex.printStackTrace();
            return false;
        }
    }

    //加载产品大类(根据ID)
    public ProductBigClass getProductBigClassByID(Integer bigclassid){

        try {
            return ((ProductBigClass) getHibernateTemplate().load(ProductBigClass.class, bigclassid));
        } catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

    //删除产品小类
    public boolean delProductSmallClass(Integer id){

        try {
            ProductSmallClass productSmallClass = (ProductSmallClass) getHibernateTemplate().load(ProductSmallClass.class, id);
            getHibernateTemplate().delete(productSmallClass);
            return true;
        } catch (Exception ex){
            ex.printStackTrace();
            return false;
        }
    }
}
