package com.plugin;

import java.util.Vector;

import javax.servlet.ServletException;

import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.service.Yasak_BusinessService;

public class Yasak_MyPlugin implements PlugIn {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void init(ActionServlet servlet, ModuleConfig arg1)
			throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("插件正在启动........");
		//获取spring容器的上下文关系对象
		ApplicationContext ctx = new FileSystemXmlApplicationContext(servlet.getServletContext().getRealPath("")+"/WEB-INF/Yasak_Spring.xml");
		System.out.println("获取spring容器的上下文关系完成.........");
		//获取服务对象
		Yasak_BusinessService ybs=(Yasak_BusinessService) ctx.getBean("Yasak_BusinessService");
		//获取分公司仓库的数据
		Vector vcbranch = ybs.getBranchbu().findAll();
		System.out.println("分公司仓库数据------->"+vcbranch.size());
		//将分公司仓库数据设置的上下文关系中
		servlet.getServletContext().setAttribute("Yasak_vcbranch", vcbranch);
		System.out.println("插件启动完成........");
	}

}
