package com.xaccp.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xaccp.po.Credit;

/**
 * Data access object (DAO) for domain model class Credit.
 * @see com.xaccp.dao.Credit
 * @author MyEclipse - Hibernate Tools
 */
public class CreditDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(CreditDAO.class);

	//property constants
	public static final String _UCOUNT = "UCount";

	protected void initDao() {
		//do nothing
	}
    
    public void save(Credit transientInstance) {
        log.debug("saving Credit instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Credit persistentInstance) {
        log.debug("deleting Credit instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Credit findById( java.lang.Integer id) {
        log.debug("getting Credit instance with id: " + id);
        try {
            Credit instance = (Credit) getHibernateTemplate()
                    .get("com.xaccp.dao.Credit", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Credit instance) {
        log.debug("finding Credit instance by example");
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
      log.debug("finding Credit instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Credit as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByUCount(Object UCount) {
		return findByProperty(_UCOUNT, UCount);
	}
	
    public Credit merge(Credit detachedInstance) {
        log.debug("merging Credit instance");
        try {
            Credit result = (Credit) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Credit instance) {
        log.debug("attaching dirty Credit instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Credit instance) {
        log.debug("attaching clean Credit instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static CreditDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (CreditDAO) ctx.getBean("CreditDAO");
	}
	
	/**
	 * 查询所有积分
	 * @return
	 */
	public List findAllCredit(){
		return getHibernateTemplate().find("FROM Credit");
	}
	
	/**
	 * 查询我的积分
	 * @param uid
	 * @return
	 */
	public List findMyCedit(int uid){
		String hql="FROM Credit as credit WHERE credit.userinfo.UId=?"+uid;
		
		return getHibernateTemplate().find(hql);
	}
}