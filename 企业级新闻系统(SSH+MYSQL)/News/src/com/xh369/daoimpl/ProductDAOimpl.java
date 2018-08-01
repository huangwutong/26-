package com.xh369.daoimpl;

import com.xh369.dao.ProductDAO;
import com.xh369.dto.Product;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import java.util.*;
import com.xh369.dto.ProductBigClass;
import com.xh369.dto.ProductSmallClass;

public class ProductDAOimpl extends HibernateDaoSupport implements ProductDAO{

    //添加产品
    public boolean insertProduct(Product product){

        try {
            getHibernateTemplate().save(product);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //产品浏览
    public List getProduct(){

        try {
            String hql = "from Product as product";
            return getHibernateTemplate().find(hql);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    //产品修改(首先显示出原数据)
    public Product showProduct(Integer id){

        try {
            return (Product) getHibernateTemplate().load(Product.class, id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    //产品修改
    public boolean updateProduct(Product product){

        try {
            getHibernateTemplate().update(product);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    //产品删除
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

    //在栏目管理模块中显示一级分类,从而导航到二级分类
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

    //加载一级分类,按ID查询
    public ProductBigClass getProductBigClassByID(Integer id){

        try {
            return (ProductBigClass) getHibernateTemplate().load(ProductBigClass.class, id);
        } catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

    //加载二级分类,按ID查询
    public ProductSmallClass getProductSmallClassByID(Integer id){

        try {
            return (ProductSmallClass) getHibernateTemplate().load(ProductSmallClass.class, id);
        } catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
}
