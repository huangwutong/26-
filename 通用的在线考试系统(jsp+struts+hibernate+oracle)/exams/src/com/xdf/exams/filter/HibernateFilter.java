package com.xdf.exams.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.hibernate.HibernateException;

import com.xdf.exams.dao.hibernate.HibernateSessionFactory;


public class HibernateFilter implements Filter {
	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
				
		try {
			chain.doFilter(req,resp);
		} finally {
			try {
				HibernateSessionFactory.closeSession();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
		}
	}

	public void init(FilterConfig config) throws ServletException {
	}
}
