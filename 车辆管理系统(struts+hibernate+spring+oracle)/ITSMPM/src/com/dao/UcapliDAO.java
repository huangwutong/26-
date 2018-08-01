package com.dao;

import java.util.Date;
import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.java.Ucapli;

public class UcapliDAO extends HibernateDaoSupport {
	private static final Log log = LogFactory.getLog(UcapliDAO.class);
	// property constants
	public static final String UCDEP = "ucdep";
	public static final String UCEMPNM = "ucempnm";
	public static final String PHONUM = "phonum";
	public static final String UCLOCA = "ucloca";
	public static final String THING = "thing";
	public static final String DTATION = "dtation";
	public static final String UCDES = "ucdes";
	public static final String APPSTATS = "appstats";
	public static final String WHCAR = "whcar";
	public static final String APPDES = "appdes";
	public static final String APPNM = "appnm";

	protected void initDao() {
		// do nothing
	}

	public void save(Ucapli transientInstance) {
		log.debug("saving Ucapli instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Ucapli persistentInstance) {
		log.debug("deleting Ucapli instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	//根据id获得ucapli对象
	public Ucapli findById(java.lang.Long id) {
		log.debug("getting Ucapli instance with id: " + id);
		try {
			Ucapli instance = (Ucapli) getHibernateTemplate().get(
					"com.java.Ucapli", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	//获得一个集合
	public List findByExample(Ucapli instance) {
		log.debug("finding Ucapli instance by example");
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
		log.debug("finding Ucapli instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Ucapli as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUcdep(Object ucdep) {
		return findByProperty(UCDEP, ucdep);
	}

	public List findByUcempnm(Object ucempnm) {
		return findByProperty(UCEMPNM, ucempnm);
	}

	public List findByPhonum(Object phonum) {
		return findByProperty(PHONUM, phonum);
	}

	public List findByUcloca(Object ucloca) {
		return findByProperty(UCLOCA, ucloca);
	}

	public List findByThing(Object thing) {
		return findByProperty(THING, thing);
	}

	public List findByDtation(Object dtation) {
		return findByProperty(DTATION, dtation);
	}

	public List findByUcdes(Object ucdes) {
		return findByProperty(UCDES, ucdes);
	}

	public List findByAppstats(Object appstats) {
		return findByProperty(APPSTATS, appstats);
	}

	public List findByWhcar(Object whcar) {
		return findByProperty(WHCAR, whcar);
	}

	public List findByAppdes(Object appdes) {
		return findByProperty(APPDES, appdes);
	}

	public List findByAppnm(Object appnm) {
		return findByProperty(APPNM, appnm);
	}

	public List findAll() {
		log.debug("finding all Ucapli instances");
		try {
			String queryString = "from Ucapli";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
  //立即执行，不会缓存我们的session
	public Ucapli merge(Ucapli detachedInstance) {
		log.debug("merging Ucapli instance");
		try {
			Ucapli result = (Ucapli) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Ucapli instance) {
		log.debug("attaching dirty Ucapli instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Ucapli instance) {
		log.debug("attaching clean Ucapli instance");
		try {
			//表示数据从缓存中读取，如果缓存中没有直接读取的数据，即对数据库进行操作
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
	//wsw查看审批与派车为条件的数据
	public List findAllBySp(String appstats,String whcar) {
		log.debug("finding all Ucapli instances");
		try {
			String queryString = "from Ucapli as model where model.appstats='"+appstats+"' and model.whcar='"+whcar+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	//驾驶员初始化
	public List findDri(String stats) {
		log.debug("finding all Ucapli instances");
		try {
			String queryString = "from Driverm as model where model.stats='"+stats+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	//车辆初始化
	public List findCar(String stats) {
		log.debug("finding all Ucapli instances");
		try {
			String queryString = "from Carbstb as model where model.carstats='"+stats+"'";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	
	

	public static UcapliDAO getFromApplicationContext(ApplicationContext ctx) {
		return (UcapliDAO) ctx.getBean("UcapliDAO");
	}
}