package com.xaccp.dao;

import java.util.Date;
import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xaccp.po.OrderInfo;

/**
 * Data access object (DAO) for domain model class OrderInfo.
 * @see com.xaccp.dao.OrderInfo
 * @author MyEclipse - Hibernate Tools
 */
public class OrderInfoDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(OrderInfoDAO.class);

	//property constants
	public static final String _OCOUNT = "OCount";
	public static final String _OSTATE = "OState";

	protected void initDao() {
		//do nothing
	}
    
    public void save(OrderInfo transientInstance) {
        log.debug("saving OrderInfo instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(OrderInfo persistentInstance) {
        log.debug("deleting OrderInfo instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public OrderInfo findById( java.lang.Integer id) {
        log.debug("getting OrderInfo instance with id: " + id);
        try {
            OrderInfo instance = (OrderInfo) getHibernateTemplate()
                    .get("com.xaccp.dao.OrderInfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(OrderInfo instance) {
        log.debug("finding OrderInfo instance by example");
        try {
            List results = getHibernateTemplate().findByExample(instance);
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding OrderInfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from OrderInfo as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByOCount(Object OCount) {
		return findByProperty(_OCOUNT, OCount);
	}
	
	public List findByOState(Object OState) {
		return findByProperty(_OSTATE, OState);
	}
	
    public OrderInfo merge(OrderInfo detachedInstance) {
        log.debug("merging OrderInfo instance");
        try {
            OrderInfo result = (OrderInfo) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(OrderInfo instance) {
        log.debug("attaching dirty OrderInfo instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(OrderInfo instance) {
        log.debug("attaching clean OrderInfo instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static OrderInfoDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (OrderInfoDAO) ctx.getBean("OrderInfoDAO");
	}
	
	/**
	 * 查询所有的定单
	 * @return
	 */
	public List findAllOrder(){
		return getHibernateTemplate().find("FROM OrderInfo");
	}
	
	/**
	 *按企业查询定单 
	 * @param enterid
	 * @return
	 */
	public List findOrderByEnter(int enterid){
		String hql="FROM OrderInfo as order WHERE order.enterpriseInfo.EId=?";
		return getHibernateTemplate().find(hql,enterid);
	}
	
	/**
	 * 按用户查询定单
	 * @param uid
	 * @return
	 */
	public List findOrderByUser(int uid){
		String hql="FROM OrderInfo as order WHERE order.userInfo.UId=?";
		return getHibernateTemplate().find(hql,uid);
	}
}