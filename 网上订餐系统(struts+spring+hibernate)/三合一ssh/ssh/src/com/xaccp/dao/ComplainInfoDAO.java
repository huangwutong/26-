package com.xaccp.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xaccp.po.ComplainInfo;

/**
 * Data access object (DAO) for domain model class ComplainInfo.
 * @see com.xaccp.dao.ComplainInfo
 * @author MyEclipse - Hibernate Tools
 */
public class ComplainInfoDAO extends HibernateDaoSupport {
//抱怨的信息
    private static final Log log = LogFactory.getLog(ComplainInfoDAO.class);

	//property constants
	public static final String CI_IDEA = "ciIdea";
	public static final String CI_IDENTITY = "ciIdentity";
	public static final String _UID = "UId";

	protected void initDao() {
		//do nothing
	}
    
    public void save(ComplainInfo transientInstance) {
        log.debug("saving ComplainInfo instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(ComplainInfo persistentInstance) {
        log.debug("deleting ComplainInfo instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public ComplainInfo findById( java.lang.Integer id) {
        log.debug("getting ComplainInfo instance with id: " + id);
        try {
            ComplainInfo instance = (ComplainInfo) getHibernateTemplate()
                    .get("com.xaccp.dao.ComplainInfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(ComplainInfo instance) {
        log.debug("finding ComplainInfo instance by example");
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
      log.debug("finding ComplainInfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from ComplainInfo as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByCiIdea(Object ciIdea) {
		return findByProperty(CI_IDEA, ciIdea);
	}
	
	public List findByCiIdentity(Object ciIdentity) {
		return findByProperty(CI_IDENTITY, ciIdentity);
	}
	
	public List findByUId(Object UId) {
		return findByProperty(_UID, UId);
	}
	
	//缓存我们提交的事物
    public ComplainInfo merge(ComplainInfo detachedInstance) {
        log.debug("merging ComplainInfo instance");
        try {
            ComplainInfo result = (ComplainInfo) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(ComplainInfo instance) {
        log.debug("attaching dirty ComplainInfo instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(ComplainInfo instance) {
        log.debug("attaching clean ComplainInfo instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static ComplainInfoDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (ComplainInfoDAO) ctx.getBean("ComplainInfoDAO");
	}
	
	public List findAllComplain(){
		return getHibernateTemplate().find("FROM ComplainInfo");
	}
}