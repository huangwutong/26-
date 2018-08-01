package com.xh369.daoimpl;

import org.springframework.orm.hibernate3.support.*;
import com.xh369.dao.ProductBigClassDAO;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;
import java.util.*;

public class ProductBigClassDAOimpl extends HibernateDaoSupport implements ProductBigClassDAO{

    //��Ӳ�Ʒ����,�Ҹ�����ӳ�ʼС��(����ָ��С��)
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

    //��ѯ��һ����Ʒ�����������Ʒ����,ͨ��һ����Ʒ���ർ����������Ʒ����
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

    //ɾ����Ʒ����,�Ҽ���ɾ����С��
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

