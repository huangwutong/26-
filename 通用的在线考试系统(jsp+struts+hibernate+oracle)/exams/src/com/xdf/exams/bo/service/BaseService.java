package com.xdf.exams.bo.service;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.xdf.exams.dao.hibernate.HibernateSessionFactory;

public abstract class BaseService {
	public Session getSession() {
		return HibernateSessionFactory.getSession();
	}
	
	public void beginTransaction() {
		Transaction t = getSession().getTransaction();
		if(t!=null)
			t.begin();
	}
	public void commitTransaction() {
		Transaction t = getSession().getTransaction();
		if(t!=null)
			t.commit();
	}
	public void rollbackTransaction() {
		Transaction t = getSession().getTransaction();
		if(t!=null)
			t.rollback();
	}
}
