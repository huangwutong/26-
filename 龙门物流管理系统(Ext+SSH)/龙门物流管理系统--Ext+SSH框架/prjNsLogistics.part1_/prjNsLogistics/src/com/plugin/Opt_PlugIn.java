package com.plugin;

import java.util.Vector;

import javax.servlet.ServletException;

import org.apache.struts.action.ActionServlet;
import org.apache.struts.action.PlugIn;
import org.apache.struts.config.ModuleConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.*;

import com.service.CarmackBusinessService;
import com.service.OptBuService;

public class Opt_PlugIn implements PlugIn {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void init(ActionServlet servlet, ModuleConfig arg1)
			throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Opt插件正在启动中......");
		
		//获取Spring容器上下文关系对象
		ApplicationContext ctx=new FileSystemXmlApplicationContext(servlet.getServletContext().getRealPath("")+"/WEB-INF/Opt_Spring.xml");
		
		//获取Opt业务服务类
		OptBuService obus=(OptBuService) ctx.getBean("OptBuService");
		
		//获取分公司、部门、权限角色等集合信息
		Vector depvc = obus.getDepbuss().findAll();
		System.out.println("部门数据长度："+depvc.size());
		Vector branchvc=obus.getBranchbuss().findAll();
		System.out.println("分公司数据长度："+branchvc.size());
		Vector rolevc = obus.getRolebuss().findAll();
		System.out.println("权限角色数据长度："+rolevc.size());
		Vector drivervc = obus.getDriverbuss().findAll();
		System.out.println("司机数据长度："+drivervc.size());
		Vector truckvc = obus.getTruckbuss().findAll();
		System.out.println("车辆数据长度："+truckvc.size());
	
		//将集合信息设置到上下文关系中
		servlet.getServletContext().setAttribute("Optdepvc", depvc);
		servlet.getServletContext().setAttribute("Optbranchvc", branchvc);
		servlet.getServletContext().setAttribute("Optrolevc", rolevc);
		servlet.getServletContext().setAttribute("Optdrivervc", drivervc);
		servlet.getServletContext().setAttribute("Opttruckvc", truckvc);
		
		System.out.println("Opt插件启动完毕......");
	}

}
