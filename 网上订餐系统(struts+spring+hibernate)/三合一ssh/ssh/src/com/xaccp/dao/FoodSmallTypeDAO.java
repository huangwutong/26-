package com.xaccp.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xaccp.po.FoodSmallType;

/**
 * Data access object (DAO) for domain model class FoodSmallType.
 * @see com.xaccp.dao.FoodSmallType
 * @author MyEclipse - Hibernate Tools
 */
//商品的小分类
public class FoodSmallTypeDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(FoodSmallTypeDAO.class);

	//property constants
	public static final String FST_NAME = "fstName";

	protected void initDao() {
		//do nothing
	}
    
    public void save(FoodSmallType transientInstance) {
        log.debug("saving FoodSmallType instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(FoodSmallType persistentInstance) {
        log.debug("deleting FoodSmallType instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public FoodSmallType findById( java.lang.Integer id) {
        log.debug("getting FoodSmallType instance with id: " + id);
        try {
            FoodSmallType instance = (FoodSmallType) getHibernateTemplate()
                    .get("com.xaccp.dao.FoodSmallType", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(FoodSmallType instance) {
        log.debug("finding FoodSmallType instance by example");
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
      log.debug("finding FoodSmallType instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from FoodSmallType as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByFstName(Object fstName) {
		return findByProperty(FST_NAME, fstName);
	}
	//修改小商品信息
    public FoodSmallType merge(FoodSmallType detachedInstance) {
        log.debug("merging FoodSmallType instance");
        try {
            FoodSmallType result = (FoodSmallType) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(FoodSmallType instance) {
        log.debug("attaching dirty FoodSmallType instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(FoodSmallType instance) {
        log.debug("attaching clean FoodSmallType instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static FoodSmallTypeDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (FoodSmallTypeDAO) ctx.getBean("FoodSmallTypeDAO");
	}
	
	/**
	 * 查询所有餐饮小分类
	 * @return
	 */
	public List findAllSmallType(){
		return getHibernateTemplate().find("FRMO FoodSmallType");
	}
}