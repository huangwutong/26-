package com.po;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * UserInfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.po.UserInfo
 * @author MyEclipse Persistence Tools
 */

public class UserInfoDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(UserInfoDAO.class);
	// property constants
	public static final String USER_NAME = "userName";
	public static final String USER_RNAME = "userRname";
	public static final String USER_PASSWORD = "userPassword";
	public static final String USER_SEX = "userSex";
	public static final String USER_PHONE = "userPhone";
	public static final String USER_CARD_ID = "userCardId";
	public static final String USER_LOGIN_NUM = "userLoginNum";
	public static final String USER_LOGIN_DATA = "userLoginData";
	public static final String USER_REG_DATA = "userRegData";

	protected void initDao() {
		// do nothing
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

	public UserInfo findById(java.lang.Integer id) {
		log.debug("getting UserInfo instance with id: " + id);
		try {
			UserInfo instance = (UserInfo) getHibernateTemplate().get(
					"com.po.UserInfo", id);
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
			log.debug("find by example successful, result size: "
					+ results.size());
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

	public List findByUserName(Object userName) {
		return findByProperty(USER_NAME, userName);
	}

	public List findByUserRname(Object userRname) {
		return findByProperty(USER_RNAME, userRname);
	}

	public List findByUserPassword(Object userPassword) {
		return findByProperty(USER_PASSWORD, userPassword);
	}

	public List findByUserSex(Object userSex) {
		return findByProperty(USER_SEX, userSex);
	}

	public List findByUserPhone(Object userPhone) {
		return findByProperty(USER_PHONE, userPhone);
	}

	public List findByUserCardId(Object userCardId) {
		return findByProperty(USER_CARD_ID, userCardId);
	}

	public List findByUserLoginNum(Object userLoginNum) {
		return findByProperty(USER_LOGIN_NUM, userLoginNum);
	}

	public List findByUserLoginData(Object userLoginData) {
		return findByProperty(USER_LOGIN_DATA, userLoginData);
	}

	public List findByUserRegData(Object userRegData) {
		return findByProperty(USER_REG_DATA, userRegData);
	}

	public List findAll() {
		log.debug("finding all UserInfo instances");
		try {
			String queryString = "from UserInfo";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	/**
	 * 验证登陆是否成功
	 * @param Object 登陆持久化对象
	 * @return UserInfo 成功返回登陆对象，失败返回空
	 * */
	public UserInfo loginIsOK(Object ob){
		UserInfo ui=(UserInfo) ob;
		
		String hql="from UserInfo where UserName=? and UserPassword=?";
		Query qy=this.getSession(true).createQuery(hql);
		
		qy.setString(0, ui.getUserName());
		qy.setString(1, ui.getUserPassword());
		
		List li=qy.list();
		Iterator it = li.iterator();
		
		UserInfo newui=new UserInfo();
		if (it.hasNext()) {
			newui=(UserInfo) it.next();
			System.out.println();
			if (newui.getBranchInfo().getBranchId().equals(ui.getBranchInfo().getBranchId())||newui.getRoleInfo().getRoleId()==1005||newui.getRoleInfo().getRoleId()==1000) {
				return newui;
			}	
		}
		return null;	
	}
	
	/**
	 * 查询指定公司的所有员工
	 * @param int 公司编号
	 * @return List 员工集合
	 * */
	public List findByBranchID(int branchID){
		String hql = "from UserInfo where branchInfo=?";
		Query qy = this.getSession(true).createQuery(hql);
		
		qy.setInteger(0, branchID);
		
		List li = qy.list();
		
		return li;
	}

	public UserInfo merge(UserInfo detachedInstance) {
		log.debug("merging UserInfo instance");
		try {
			UserInfo result = (UserInfo) getHibernateTemplate().merge(
					detachedInstance);
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
}