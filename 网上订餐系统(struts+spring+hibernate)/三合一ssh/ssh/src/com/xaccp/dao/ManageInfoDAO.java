package com.xaccp.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xaccp.po.ManageInfo;

/**
 * Data access object (DAO) for domain model class ManageInfo.
 * @see com.xaccp.dao.ManageInfo
 * @author MyEclipse - Hibernate Tools
 */
public class ManageInfoDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(ManageInfoDAO.class);

	//property constants
	public static final String _MNAME = "MName";
	public static final String _MPASS = "MPass";
	public static final String _MAGE = "MAge";
	public static final String _MSEX = "MSex";
	public static final String _MTEL = "MTel";
	public static final String _MADDRESS = "MAddress";
	public static final String _MEMAIL = "MEmail";

	protected void initDao() {
		//do nothing
	}
    
    public void save(ManageInfo transientInstance) {
        log.debug("saving ManageInfo instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(ManageInfo persistentInstance) {
        log.debug("deleting ManageInfo instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public ManageInfo findById( java.lang.Integer id) {
        log.debug("getting ManageInfo instance with id: " + id);
        try {
            ManageInfo instance = (ManageInfo) getHibernateTemplate()
                    .get("com.xaccp.dao.ManageInfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(ManageInfo instance) {
        log.debug("finding ManageInfo instance by example");
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
      log.debug("finding ManageInfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from ManageInfo as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByMName(Object MName) {
		return findByProperty(_MNAME, MName);
	}
	
	public List findByMPass(Object MPass) {
		return findByProperty(_MPASS, MPass);
	}
	
	public List findByMAge(Object MAge) {
		return findByProperty(_MAGE, MAge);
	}
	
	public List findByMSex(Object MSex) {
		return findByProperty(_MSEX, MSex);
	}
	
	public List findByMTel(Object MTel) {
		return findByProperty(_MTEL, MTel);
	}
	
	public List findByMAddress(Object MAddress) {
		return findByProperty(_MADDRESS, MAddress);
	}
	
	public List findByMEmail(Object MEmail) {
		return findByProperty(_MEMAIL, MEmail);
	}
	
    public ManageInfo merge(ManageInfo detachedInstance) {
        log.debug("merging ManageInfo instance");
        try {
            ManageInfo result = (ManageInfo) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(ManageInfo instance) {
        log.debug("attaching dirty ManageInfo instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(ManageInfo instance) {
        log.debug("attaching clean ManageInfo instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static ManageInfoDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (ManageInfoDAO) ctx.getBean("ManageInfoDAO");
	}
	
	/**
	 * 查询所有管理员
	 * @return
	 */
	public List findAllManager(){
		return getHibernateTemplate().find("FROM ManageInfo");
	}
	
	/**
	 * 按用户名和密码查询管理员
	 * @param mi
	 * @return
	 */
	public List FindManagerByNameAndPass(ManageInfo mi){
		String hql="FROM ManageInfo as manager WHERE manager.MNane=? AND manager.MPass=?";
		String []args={mi.getMName(),mi.getMPass()};
		return getHibernateTemplate().find(hql,args);
	}
}