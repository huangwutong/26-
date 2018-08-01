package com.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.sql.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Outcm;

/**
 * A data access object (DAO) providing persistence and search support for Outcm
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.java.Outcm
 * @author MyEclipse Persistence Tools
 */

public class OutcmDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(OutcmDAO.class);
	// property constants
	public static final String OUTCNUM = "outcnum";
	public static final String DRIVER = "driver";
	public static final String UCEM = "ucem";
	public static final String OUTLOCA = "outloca";
	public static final String OUTCRON = "outcron";
	public static final String WHINCOM = "whincom";
	public static final String OUTDES = "outdes";

	protected void initDao() {
		// do nothing
	}

	public void save(Outcm transientInstance) {
		log.debug("saving Outcm instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Outcm persistentInstance) {
		log.debug("deleting Outcm instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Outcm findById(java.lang.Long id) {
		log.debug("getting Outcm instance with id: " + id);
		try {
			Outcm instance = (Outcm) getHibernateTemplate().get(
					"com.java.Outcm", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Outcm instance) {
		log.debug("finding Outcm instance by example");
		try {
//			返回一个对象为result类型
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
		log.debug("finding Outcm instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Outcm as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByOutcnum(Object outcnum) {
		return findByProperty(OUTCNUM, outcnum);
	}

	public List findByDriver(Object driver) {
		return findByProperty(DRIVER, driver);
	}

	public List findByUcem(Object ucem) {
		return findByProperty(UCEM, ucem);
	}

	public List findByOutloca(Object outloca) {
		return findByProperty(OUTLOCA, outloca);
	}

	public List findByOutcron(Object outcron) {
		return findByProperty(OUTCRON, outcron);
	}

	public List findByWhincom(Object whincom) {
		return findByProperty(WHINCOM, whincom);
	}

	public List findByOutdes(Object outdes) {
		return findByProperty(OUTDES, outdes);
	}

	public List findAll() {
		log.debug("finding all Outcm instances");
		try {
			String queryString = "from Outcm";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Outcm merge(Outcm detachedInstance) {
		log.debug("merging Outcm instance");
		try {
			Outcm result = (Outcm) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Outcm instance) {
		log.debug("attaching dirty Outcm instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Outcm instance) {
		log.debug("attaching clean Outcm instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	////wsw
	public List getByid(Long id,String str) {
		log.debug("finding all Outcm instances");
		try {
			String queryString = "from "+str+" as model where model.carbstb.carbstbid="+id+"";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	///
	public String saveOutcm(Long carbstbid,Long drivermid,Long ucapliid) throws SQLException {
		try {
			String procedure = "{call saveOutcm(?,?,?,?) }"; 
			Session s = getHibernateTemplate().getSessionFactory().openSession();
			s.beginTransaction().begin();
			Connection con=s.connection(); 
			CallableStatement cs=con.prepareCall(procedure);
			cs.setLong(1, carbstbid);
			cs.setLong(2, drivermid);
			cs.setLong(3, ucapliid);
			cs.registerOutParameter(4, Types.VARCHAR);
			cs.executeUpdate();
			String lo=cs.getString(4);
			s.close();
			System.out.println("aaaaaa+="+lo);
			return lo;
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}	
	//收车管理
	public String saveTaskincar(Long carbstbid, Long drivermid, 
			Long outcmid, Date sjincomdate) throws SQLException {
		try {
			 
			String procedure = "{call saveTaskincar(?,?,?,?,?) }"; 
			Session s = getHibernateTemplate().getSessionFactory().openSession();
			s.beginTransaction().begin();
			Connection con=s.connection(); 
			CallableStatement cs=con.prepareCall(procedure);
			cs.setLong(1, carbstbid);
			cs.setLong(2, drivermid);
			cs.setLong(3, outcmid);
			cs.setDate(4, sjincomdate);
			cs.registerOutParameter(5, Types.VARCHAR);
			cs.executeUpdate();
			String lo=cs.getString(5);
			s.close();
			System.out.println("aaaaaa+="+lo);
			return lo;
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}	
	//查看出车单时，必须是已经派车
	public List findAllBywhincom(String whcar) {
		log.debug("finding all Outcm instances");
		try {
			String queryString = "from Outcm as model where  model.ucapli.whcar='"+whcar+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List findByUcaId(Long id) {
		log.debug("finding all Outcm instances");
		try {
			String queryString = "from Outcm as model where  model.ucapli.ucapliid='"+id+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	

	public static OutcmDAO getFromApplicationContext(ApplicationContext ctx) {
		return (OutcmDAO) ctx.getBean("OutcmDAO");
	}
}