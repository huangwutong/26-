package com.xh369.daoimpl;

import com.xh369.dao.ProductsviewsDAO;
import com.xh369.dto.Productsviews;
import com.xh369.dto.ProductsviewsId;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.xh369.actions.HibernateSessionFactory;

public class ProductsviewsDAOimpl extends HibernateDaoSupport implements ProductsviewsDAO{

    //按视图主键查询
    public Productsviews findById(ProductsviewsId id){

        try {
            Productsviews instance = (Productsviews) getHibernateTemplate().get("com.xh369.dto.Articlesviews", id);
            return instance;
        } catch (RuntimeException re) {
            throw re;
        }
    }

    //按视图实例类查询(采用Criteria编程)
    public List findByExample(Productsviews instance){
        return null;
    }

    //按视图编号查询
    public List findByPropertyId(String propertyName, Object value){
        return null;
    }

    //用于分页查询(其中int position_index, int pageSize分别为起始索引和页大小)
    public List findByProperty(Object[][] val, int position_index, int pageSize){
        return null;
    }

    //得到分页查询的总记录数
    public int getCount(){
       
    	try {
    		String hql = "select count(*) from Productsviews as productsviews";
	        return Integer.parseInt(getHibernateTemplate().find(hql)
	        																 .get(0)
	        																 .toString()
	                                         );
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
    }
    
    //用于分页查询(其中int position_index, int pageSize分别为起始索引和页大小)
	public List getByProperty(int position_index, int pageSize) {
		
		 try {
	         String hql = "from Productsviews as productsviews";
	         int count = this.getCount();
	         if(count < pageSize *  position_index){
	        	 pageSize = count - ( position_index - 1 ) *  pageSize;
	         }
	         if(position_index == 1){
	        	 return getHibernateTemplate().find(hql)
					   									   .subList(0, pageSize);
	         }else{
	        	return getHibernateTemplate().find(hql)
				   									      .subList( ( position_index - 1 ) *  pageSize, pageSize);
	         }
	      } catch (RuntimeException re) {
	         throw re;
	      }
	}
}
