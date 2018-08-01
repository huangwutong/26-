package com.plugin;

import javax.servlet.ServletException;

import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;
import org.springframework.context.*;
import org.springframework.context.support.*;
import com.service.*;

import java.util.*;

public class MosterPlugin implements PlugIn {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void init(ActionServlet servlet, ModuleConfig arg1)
			throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("插件正在启动...");
		//获取SPRING容器的上下文关系
		ApplicationContext ctx=new FileSystemXmlApplicationContext(servlet.getServletContext().getRealPath("")+"/WEB-INF/Moster_Spring.xml");

		System.out.println("获取spring容器的上下文关系完成....");
		//获取业务服务类对象
		MosterBuService mbs = (MosterBuService)ctx.getBean("mosterbuservice");
		//获取货票状态数据
		Vector vcbs = mbs.getMobillstatebuss().findAll();
		//将货票状态数据设置到上下文关系中
		servlet.getServletContext().setAttribute("mostervcbs", vcbs);

		System.out.println("货票状态数据："+vcbs.size());
		//获取公司数据
		Vector vcbi = mbs.getMobribuss().findAll();
		//将公司数据设置到上下文关系中
		servlet.getServletContext().setAttribute("mostervcbr", vcbi);
		System.out.println("公司数据："+vcbi.size());
		//获取用户数据
		Vector vcus = mbs.getMousinfobuss().findAll();
		//将用户数据设置到上下文关系中
		servlet.getServletContext().setAttribute("mostervcus", vcus);
		System.out.println("用户数据："+vcus.size());
		System.out.println("插件启动完成.......");
	}

}
