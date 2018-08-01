package com.accp.myoa.common;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;



public class OnLine implements ServletContextListener, HttpSessionListener {
	
	private ServletContext context=null;//上下文
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// TODO Auto-generated method stub
		System.out.println("上下文开启");
		context=event.getServletContext();//启动容器时获得上下文对象
		
	}

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		 //context.setAttribute("online", 0);
		
		
	}
	
	public int getOnLineUser(){
		
		return OnLineCount.getCount();
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		int count=OnLineCount.getCount();
		if(count>0){
			count--;
			
		}
		OnLineCount.setCount(count);
		
		//System.out.println("destroy"+count);
	}

}
