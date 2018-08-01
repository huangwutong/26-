package com.xh369.daoimpl;

import org.springframework.orm.hibernate3.support.*;
import com.xh369.dao.ProductSmallClassDAO;
import java.util.List;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;
import java.util.Iterator;

public class ProductSmallClassDAOimpl extends HibernateDaoSupport implements ProductSmallClassDAO{

    //��ѯ��Ʒ����,�Ӷ���������ƷС��
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

    //��Ӳ�ƷС��
    public boolean insertProductSmallClass(ProductSmallClass productSmallClass){

        try {
            getHibernateTemplate().save(productSmallClass);
            return true;
        } catch (Exception ex){
            ex.printStackTrace();
            return false;
        }
    }

    //���ز�Ʒ����(����ID)
    public ProductBigClass getProductBigClassByID(Integer bigclassid){

        try {
            return ((ProductBigClass) getHibernateTemplate().load(ProductBigClass.class, bigclassid));
        } catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

    //ɾ����ƷС��
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
