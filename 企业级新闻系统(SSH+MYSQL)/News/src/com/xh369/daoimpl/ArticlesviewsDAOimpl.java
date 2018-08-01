package com.xh369.daoimpl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import com.xh369.dto.Articlesviews;
import com.xh369.dto.ArticlesviewsId;
import org.hibernate.*;
import com.xh369.dao.ArticlesviewsDAO;
import com.xh369.actions.HibernateSessionFactory;

public class ArticlesviewsDAOimpl implements ArticlesviewsDAO{

    //按视图主键查询
    public Articlesviews findById(ArticlesviewsId id) {

        try {
            Session session = HibernateSessionFactory.getSession();
            Articlesviews instance = (Articlesviews) session.get("com.xh369.dto.Articlesviews", id);
            return instance;
        } catch (RuntimeException re) {
            throw re;
        }
    }

    //按视图实例类查询(采用Criteria编程)
    public List findByExample(Articlesviews instance) {

        try {
            Session session = HibernateSessionFactory.getSession();
            List results = session.createCriteria("com.xh369.dto.Articlesviews")
                                  .add(Example.create(instance))
                                  .list();
            return results;
        } catch (RuntimeException re) {
            throw re;
        }
    }

    //按视图编号查询
    public List findByPropertyId(String propertyName, Object value) {

        try {
         String hql = "from Articlesviews as articlesviews where articlesviews." + propertyName + "= ?";
         Session session = HibernateSessionFactory.getSession();
         List results = session.createQuery(hql)
                               .setParameter(0, value)
                               .list();
         return results;
      } catch (RuntimeException re) {
         throw re;
      }
    }

    //用于分页查询(其中int position_index, int pageSize分别为起始索引和页大小)
    public List findByProperty(Object[][] val, int position_index, int pageSize) {

        try {
         StringBuffer hql = new StringBuffer("from Articlesviews as articlesviews");
         if(Integer.parseInt(val[0][1].toString()) == 0 && !val[1][1].toString().equals("")) hql.append(" where lower(articlesviews." + val[1][0].toString() + ") like '%"+val[1][1].toString().toLowerCase()+"%'");
         if(Integer.parseInt(val[0][1].toString()) != 0 && !val[1][1].toString().equals("")) hql.append(" where articlesviews." + val[0][0].toString() + "=? or lower(articlesviews." + val[1][0].toString() +") like '%"+val[1][1].toString().toLowerCase()+"%'");
         if(Integer.parseInt(val[0][1].toString()) != 0 && val[1][1].toString().equals("")) hql.append(" where articlesviews." + val[0][0].toString() + "=?");
         if(!val[2][1].toString().equals("") && !val[3][1].toString().equals("")) hql.append(" where articlesviews." + val[2][0].toString() + "=? and articlesviews." + val[3][0].toString() + "=?");
         Session session = HibernateSessionFactory.getSession();
         Query query = session.createQuery(hql.toString());
         if(Integer.parseInt(val[0][1].toString()) != 0 && !val[1][1].toString().equals("")) query.setParameter(0, val[0][1], Hibernate.INTEGER);
         if(Integer.parseInt(val[0][1].toString()) != 0 && val[1][1].toString().equals("")) query.setParameter(0, val[0][1]);
         if(!val[2][1].toString().equals("") && !val[3][1].toString().equals("")) query.setParameter(0, val[2][1], Hibernate.STRING)
                                                                                        .setParameter(1, val[3][1]);
         if(position_index == 1){
             return query.setFirstResult(0)
                     .setMaxResults(pageSize)
                     .list();
         }else{
             return query.setFirstResult( (position_index - 1) * pageSize )
                     .setMaxResults(pageSize)
                     .list();
         }
      } catch (RuntimeException re) {
         throw re;
      }
    }

    //得到分页查询的总记录数
    public int getCount(Object[][] val) {

        try {
            StringBuffer hql = new StringBuffer("select count(*) from Articlesviews as articlesviews");
            if(Integer.parseInt(val[0][1].toString()) == 0 && !val[1][1].toString().equals("")) hql.append(" where lower(articlesviews." + val[1][0].toString() + ") like '%"+val[1][1].toString().toLowerCase()+"%'");
            if(Integer.parseInt(val[0][1].toString()) != 0 && !val[1][1].toString().equals("")) hql.append(" where articlesviews." + val[0][0].toString() + "=? or lower(articlesviews." + val[1][0].toString() +") like '%"+val[1][1].toString().toLowerCase()+"%'");
            if(Integer.parseInt(val[0][1].toString()) != 0 && val[1][1].toString().equals("")) hql.append(" where articlesviews." + val[0][0].toString() + "=?");
            if(!val[2][1].toString().equals("") && !val[3][1].toString().equals("")) hql.append(" where articlesviews." + val[2][0].toString() + "=? and articlesviews." + val[3][0].toString() + "=?");
            Session session = HibernateSessionFactory.getSession();
            Query query = session.createQuery(hql.toString());
            if(Integer.parseInt(val[0][1].toString()) != 0 && !val[1][1].toString().equals("")) query.setParameter(0, val[0][1], Hibernate.INTEGER);
            if(Integer.parseInt(val[0][1].toString()) != 0 && val[1][1].toString().equals("")) query.setParameter(0, val[0][1]);
            if(!val[2][1].toString().equals("") && !val[3][1].toString().equals("")) query.setParameter(0, val[2][1], Hibernate.STRING)
                                                                                           .setParameter(1, val[3][1]);
            return Integer.parseInt(
                                      query.list()
                                           .get(0)
                                           .toString());
        } catch (Exception ex) {
            ex.printStackTrace();
            return 0;
        }
    }
    
    //用于分页查询(其中int position_index, int pageSize分别为起始索引和页大小)
	public List findByProperty(int position_index, int pageSize) {
		
		try {
			String hql = "from Articlesviews as articlesviews";
			Session session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			if(position_index == 1){
	            return query.setFirstResult(0)
	                    .setMaxResults(pageSize)
	                    .list();
	        }else{
	            return query.setFirstResult( (position_index - 1) * pageSize )
	                    .setMaxResults(pageSize)
	                    .list();
	        }
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//得到分页查询的总记录数
	public int getCount() {
		
		 try {
	            String hql = "select count(*) from Articlesviews as articlesviews";
	            Session session = HibernateSessionFactory.getSession();
	            Query query = session.createQuery(hql);
	            return Integer.parseInt(
	                                      query.list()
	                                           .get(0)
	                                           .toString());
	        } catch (Exception ex) {
	            ex.printStackTrace();
	            return 0;
	        }
	}
}
