package com.plugin;

import java.util.Vector;

import javax.servlet.ServletException;

import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.service.CarmackBusinessService;

public class Carmark_PlugIn implements PlugIn {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void init(ActionServlet servlet, ModuleConfig arg1)
			throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Carmack插件正在启动中......");

		// 获取Spring容器上下文关系对象
		ApplicationContext ctx = new FileSystemXmlApplicationContext(servlet
				.getServletContext().getRealPath("")
				+ "/WEB-INF/Carmack_Spring.xml");

		//获取Carmack业务服务类
		CarmackBusinessService cbus = (CarmackBusinessService) ctx.getBean("carmackbusinessservice");
		
		//获取车辆型号集合信息
		Vector tmvc = cbus.getTruckmodelbu().findAll();
		System.out.println("车辆型号数据长度："+tmvc.size());
		
		//将集合信息设置到上下文关系中
		servlet.getServletContext().setAttribute("CarmackTMvc", tmvc);
		
		System.out.println("Carmack插件启动完毕......");
	}

}
