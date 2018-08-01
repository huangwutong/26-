package com.xaccp.dao;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xaccp.po.EnterpriseInfo;

/**
 * Data access object (DAO) for domain model class EnterpriseInfo.
 * @see com.xaccp.dao.EnterpriseInfo
 * @author MyEclipse - Hibernate Tools
 */
public class EnterpriseInfoDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(EnterpriseInfoDAO.class);

	//property constants
	public static final String _ENAME = "EName";
	public static final String _EPASS = "EPass";
	public static final String _ECOMPANY_NAME = "ECompanyName";
	public static final String _ELINK_MAN = "ELinkMan";
	public static final String _ETEL = "ETel";
	public static final String _EADDRESS = "EAddress";
	public static final String _EEMAIL = "EEmail";

	protected void initDao() {
		//do nothing
	}
    
    public void save(EnterpriseInfo transientInstance) {
        log.debug("saving EnterpriseInfo instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(EnterpriseInfo persistentInstance) {
        log.debug("deleting EnterpriseInfo instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public EnterpriseInfo findById( java.lang.Integer id) {
        log.debug("getting EnterpriseInfo instance with id: " + id);
        try {
            EnterpriseInfo instance = (EnterpriseInfo) getHibernateTemplate()
                    .get("com.xaccp.dao.EnterpriseInfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(EnterpriseInfo instance) {
        log.debug("finding EnterpriseInfo instance by example");
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
      log.debug("finding EnterpriseInfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from EnterpriseInfo as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByEName(Object EName) {
		return findByProperty(_ENAME, EName);
	}
	
	public List findByEPass(Object EPass) {
		return findByProperty(_EPASS, EPass);
	}
	
	public List findByECompanyName(Object ECompanyName) {
		return findByProperty(_ECOMPANY_NAME, ECompanyName);
	}
	
	public List findByELinkMan(Object ELinkMan) {
		return findByProperty(_ELINK_MAN, ELinkMan);
	}
	
	public List findByETel(Object ETel) {
		return findByProperty(_ETEL, ETel);
	}
	
	public List findByEAddress(Object EAddress) {
		return findByProperty(_EADDRESS, EAddress);
	}
	
	public List findByEEmail(Object EEmail) {
		return findByProperty(_EEMAIL, EEmail);
	}
	
    public EnterpriseInfo merge(EnterpriseInfo detachedInstance) {
        log.debug("merging EnterpriseInfo instance");
        try {
        	//修改企业
            EnterpriseInfo result = (EnterpriseInfo) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(EnterpriseInfo instance) {
        log.debug("attaching dirty EnterpriseInfo instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(EnterpriseInfo instance) {
        log.debug("attaching clean EnterpriseInfo instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static EnterpriseInfoDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (EnterpriseInfoDAO) ctx.getBean("EnterpriseInfoDAO");
	}
	
	/**
	 * 查询所有企业
	 * @return
	 */
	public List findAllEnterprise(){
		return getHibernateTemplate().find("FROM EnterpriseInfo");
	} 
	/**
	 * 按企业的用户名和密码进行查找
	 * @param ei
	 * @return
	 */
	public List findEntepriseByNameAndPass(EnterpriseInfo ei){
		String hql="FROM EnterpriseInfo as enter WHERE enter.EName=? AND enter.EPass=?";
		String []args={ei.getEName(),ei.getEPass()};
		return getHibernateTemplate().find(hql,args);
	}
}