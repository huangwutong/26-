package com.xdf.exams.dao.hibernate;

import java.io.Serializable;

import org.hibernate.Session;

public class BaseDAO {
	public Session getSession() {
		return HibernateSessionFactory.getSession();
	}
	public void add(Object pojo) {
		getSession().save(pojo);
	}
	public void update(Object pojo) {
		getSession().update(pojo);		
	}	
	public void delete(Object pojo) {
		getSession().delete(pojo);
	}	
	public Object load(Class cls,Serializable id) {
		return getSession().load(cls,id);		
	}
}
