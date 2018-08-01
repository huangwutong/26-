package com.xaccp.dao;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xaccp.po.UserInfo;

/**
 * Data access object (DAO) for domain model class UserInfo.
 * @see com.xaccp.dao.UserInfo
 * @author MyEclipse - Hibernate Tools
 */
public class UserInfoDAO extends HibernateDaoSupport {

    private static final Log log = LogFactory.getLog(UserInfoDAO.class);

	//property constants
	public static final String _UNAME = "UName";
	public static final String _UPASS = "UPass";
	public static final String _UREAL_NAME = "URealName";
	public static final String _UPAPER_CODE = "UPaperCode";
	public static final String _UAGE = "UAge";
	public static final String _USEX = "USex";
	public static final String _UTEL = "UTel";
	public static final String _UADDRESS = "UAddress";
	public static final String _UEMAIL = "UEmail";

	protected void initDao() {
		//do nothing
	}
    
    public void save(UserInfo transientInstance) {
        log.debug("saving UserInfo instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(UserInfo persistentInstance) {
        log.debug("deleting UserInfo instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public UserInfo findById( java.lang.Integer id) {
        log.debug("getting UserInfo instance with id: " + id);
        try {
            UserInfo instance = (UserInfo) getHibernateTemplate()
                    .get("com.xaccp.dao.UserInfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(UserInfo instance) {
        log.debug("finding UserInfo instance by example");
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
      log.debug("finding UserInfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from UserInfo as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByUName(Object UName) {
		return findByProperty(_UNAME, UName);
	}
	
	public List findByUPass(Object UPass) {
		return findByProperty(_UPASS, UPass);
	}
	
	public List findByURealName(Object URealName) {
		return findByProperty(_UREAL_NAME, URealName);
	}
	
	public List findByUPaperCode(Object UPaperCode) {
		return findByProperty(_UPAPER_CODE, UPaperCode);
	}
	
	public List findByUAge(Object UAge) {
		return findByProperty(_UAGE, UAge);
	}
	
	public List findByUSex(Object USex) {
		return findByProperty(_USEX, USex);
	}
	
	public List findByUTel(Object UTel) {
		return findByProperty(_UTEL, UTel);
	}
	
	public List findByUAddress(Object UAddress) {
		return findByProperty(_UADDRESS, UAddress);
	}
	
	public List findByUEmail(Object UEmail) {
		return findByProperty(_UEMAIL, UEmail);
	}
	
    public UserInfo merge(UserInfo detachedInstance) {
        log.debug("merging UserInfo instance");
        try {
            UserInfo result = (UserInfo) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(UserInfo instance) {
        log.debug("attaching dirty UserInfo instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(UserInfo instance) {
        log.debug("attaching clean UserInfo instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static UserInfoDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (UserInfoDAO) ctx.getBean("UserInfoDAO");
	}
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public List findAllUser(){
		return getHibernateTemplate().find("FROM UserInfo");
	}
	
	/**
	 * 按用户名和密码查询用户
	 * @param ui
	 * @return
	 */
	public List findUserByNameAndPass(UserInfo ui){
		String hql="FROM UserInfo as user WHERE user.UName=? AND user.UPass=?";
		String []args={ui.getUName(),ui.getUPass()};
		return getHibernateTemplate().find(hql,args);
	}
}