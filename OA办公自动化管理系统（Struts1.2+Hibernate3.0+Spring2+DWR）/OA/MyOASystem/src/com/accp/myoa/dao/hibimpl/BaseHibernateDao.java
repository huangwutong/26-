package com.accp.myoa.dao.hibimpl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

@SuppressWarnings("unchecked")
public class BaseHibernateDao extends HibernateDaoSupport {
	public List findByPage(final String hql,final int firstResult,final int pageSize) {
		return getHibernateTemplate().executeFind(
		    new HibernateCallback() {
				public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
					Query query = session.createQuery(hql);
					if (firstResult!=-1&&pageSize!=0) {
						query.setFirstResult(firstResult);
						query.setMaxResults(pageSize);
					}
					return query.list();
				}
		    }
		);
	}
	
	public List findByPage(final String hql,final Object param,final int firstResult,final int pageSize) {
		return getHibernateTemplate().executeFind(
		    new HibernateCallback() {
				public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
					Query query = session.createQuery(hql);
					query.setParameter(0, param);
					query.setFirstResult(firstResult);
					query.setMaxResults(pageSize);
					return query.list();
				}
		    }
		);
	}
	
	public List findByPage(final String hql,final Object[] params,final int firstResult,final int pageSize) {
		return getHibernateTemplate().executeFind(
		    new HibernateCallback() {
				public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
					Query query = session.createQuery(hql);
					for(int i = 0; i < params.length; i++) {
						query.setParameter(i, params[i]);
					}
					if (firstResult!=-1&&pageSize!=0) {
						query.setFirstResult(firstResult);
						query.setMaxResults(pageSize);
					}
					return query.list();
				}
		    }
		);
	}
	
	public int getCount(final String hql) {
		return (Integer)getHibernateTemplate().execute(
		    new HibernateCallback() {
				public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
					Query query = session.createQuery("select count(*) " + hql);
					return query.uniqueResult();
				}
		    }
		);
	}
}
