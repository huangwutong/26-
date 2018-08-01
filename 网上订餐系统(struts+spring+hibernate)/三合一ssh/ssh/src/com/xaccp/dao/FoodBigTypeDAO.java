package com.xaccp.dao;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xaccp.po.FoodBigType;

/**
 * Data access object (DAO) for domain model class FoodBigType.
 * @see com.xaccp.dao.FoodBigType
 * @author MyEclipse - Hibernate Tools
 */
public class FoodBigTypeDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(FoodBigTypeDAO.class);

	//property constants
	public static final String FBT_NAME = "fbtName";

	protected void initDao() {
		//do nothing
	}
    
	public void delete(FoodBigType persistentInstance) {
        log.debug("deleting FoodBigType instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public FoodBigType findById( java.lang.Integer id) {
        log.debug("getting FoodBigType instance with id: " + id);
        try {
            FoodBigType instance = (FoodBigType) getHibernateTemplate()
                    .get("com.xaccp.dao.FoodBigType", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(FoodBigType instance) {
        log.debug("finding FoodBigType instance by example");
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
      log.debug("finding FoodBigType instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from FoodBigType as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByFbtName(Object fbtName) {
		return findByProperty(FBT_NAME, fbtName);
	}
	

    public void attachDirty(FoodBigType instance) {
        log.debug("attaching dirty FoodBigType instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(FoodBigType instance) {
        log.debug("attaching clean FoodBigType instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static FoodBigTypeDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (FoodBigTypeDAO) ctx.getBean("FoodBigTypeDAO");
	}
	
	/**
	 * 查询所有餐饮大分类
	 * @return
	 */
	public List findAllBigType(){
		return getHibernateTemplate().find("FROM FoodBigType");
	}
	
	/**
	 * 添加餐饮大分类
	 * @param fbt
	 */
	public void save(FoodBigType fbt){
		getHibernateTemplate().save(fbt);
	}
	
	/**
	 * 修改餐饮大分类
	 * @param fbt
	 */
	public void merge(FoodBigType fbt){
		getHibernateTemplate().merge(fbt);
	}
}