package com.service.utils;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.dao.OutcmDAO;
import com.dao.XxuserDAO;

public class Test {
	public static void main(String[] arg) throws SQLException, ParseException{
		 
	      ApplicationContext ctx = new FileSystemXmlApplicationContext("WebRoot/WEB-INF/applicationContext.xml"); 
	      XxuserDAO xxuserDAO=getFromApplicationContext(ctx);
	      //Xxuser xxuser=new Xxuser();
	      List l=new ArrayList();
	      //l=xxuserDAO.findBynmpass("¿Ì¿Ì", new Long(123));
	      l=xxuserDAO.findByTab("Xxuser", "name", "admin");
	      //SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd"); 
	     // String d = sf.format(xxuser.getBegintm());
	      System.out.println(l.size()+"====");
		}
	public static XxuserDAO getFromApplicationContext(ApplicationContext ctx) {
		return (XxuserDAO) ctx.getBean("XxuserDAO");
	}
}
