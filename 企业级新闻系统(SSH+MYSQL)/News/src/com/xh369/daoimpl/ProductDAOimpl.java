package com.xh369.daoimpl;

import com.xh369.dao.ProductDAO;
import com.xh369.dto.Product;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import java.util.*;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;

public class ProductDAOimpl extends HibernateDaoSupport implements ProductDAO{

    //��Ӳ�Ʒ
    public boolean insertProduct(Product product){

        try {
            getHibernateTemplate().save(product);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //��Ʒ���
    public List getProduct(){

        try {
            String hql = "from Product as product";
            return getHibernateTemplate().find(hql);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    //��Ʒ�޸�(������ʾ��ԭ����)
    public Product showProduct(Integer id){

        try {
            return (Product) getHibernateTemplate().load(Product.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    //��Ʒ�޸�
    public boolean updateProduct(Product product){

        try {
            getHibernateTemplate().update(product);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //��Ʒɾ��
    public boolean delProduct(Integer id){

        try {
            Product product = (Product) getHibernateTemplate().load(Product.class, id);
            getHibernateTemplate().delete(product);
            return true;
        } catch (Exception ex){
            ex.printStackTrace();
            return false;
        }
    }

    //����Ŀ����ģ������ʾһ������,�Ӷ���������������
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

    //����һ������,��ID��ѯ
    public ProductBigClass getProductBigClassByID(Integer id){

        try {
            return (ProductBigClass) getHibernateTemplate().load(ProductBigClass.class, id);
        } catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

    //���ض�������,��ID��ѯ
    public ProductSmallClass getProductSmallClassByID(Integer id){

        try {
            return (ProductSmallClass) getHibernateTemplate().load(ProductSmallClass.class, id);
        } catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
}
