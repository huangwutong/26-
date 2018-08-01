package com.ponyjava.common.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public abstract class SpringContextTests {
	private static ApplicationContext context;

	protected final Logger logger = LoggerFactory.getLogger(this.getClass());

	public synchronized ApplicationContext getContext() {
		if (context == null) {
			context = new ClassPathXmlApplicationContext(getConfigLocations());
		}
		return context;
	}

	public Object getBean(String name) {
		return getContext().getBean(name);
	}

	protected String[] getConfigLocations() {
		String[] config = new String[] { "test-applicationContext.xml", };
		return config;
	}

}
