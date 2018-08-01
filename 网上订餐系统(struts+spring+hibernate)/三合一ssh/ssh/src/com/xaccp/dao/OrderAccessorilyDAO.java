package com.xaccp.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xaccp.po.OrderAccessorily;

/**
 * Data access object (DAO) for domain model class OrderAccessorily.
 * @see com.xaccp.dao.OrderAccessorily
 * @author MyEclipse - Hibernate Tools
 */
public class OrderAccessorilyDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(OrderAccessorilyDAO.class);

	//property constants
	public static final String OA_TOTALPRICE = "oaTotalprice";

	protected void initDao() {
		//do nothing
	}
    
    public void save(OrderAccessorily transientInstance) {
        log.debug("saving OrderAccessorily instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(OrderAccessorily persistentInstance) {
        log.debug("deleting OrderAccessorily instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public OrderAccessorily findById( java.lang.Integer id) {
        log.debug("getting OrderAccessorily instance with id: " + id);
        try {
            OrderAccessorily instance = (OrderAccessorily) getHibernateTemplate()
                    .get("com.xaccp.dao.OrderAccessorily", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(OrderAccessorily instance) {
        log.debug("finding OrderAccessorily instance by example");
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
      log.debug("finding OrderAccessorily instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from OrderAccessorily as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByOaTotalprice(Object oaTotalprice) {
		return findByProperty(OA_TOTALPRICE, oaTotalprice);
	}
	
    public OrderAccessorily merge(OrderAccessorily detachedInstance) {
        log.debug("merging OrderAccessorily instance");
        try {
            OrderAccessorily result = (OrderAccessorily) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(OrderAccessorily instance) {
        log.debug("attaching dirty OrderAccessorily instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(OrderAccessorily instance) {
        log.debug("attaching clean OrderAccessorily instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static OrderAccessorilyDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (OrderAccessorilyDAO) ctx.getBean("OrderAccessorilyDAO");
	}
	
	/**
	 * 查询所有定单附表
	 * @return
	 */
	public List findAllOrderAccessrily(){
		return getHibernateTemplate().find("FROM OrderAccessorily");
	}
}