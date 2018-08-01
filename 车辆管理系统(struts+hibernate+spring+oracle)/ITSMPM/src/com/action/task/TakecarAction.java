package com.action.task;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.Ucapli;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class TakecarAction extends ActionSupport {

	private TaskService taskService;
	private List message;
	//司机选择
	private List driverselect;
	//汽车选择
	private List carselect;
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		//查询Ucapli用车申请表，初始化驾驶员，初始化车辆，必须是可用状态下的
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Ucapli pr=new Ucapli();
		if(a[0]!=null){
			pr = taskService.QueryUcapliById(new Long(a[0].trim()));
			 
		} 
		List l= new ArrayList();
		l.add(pr);
		setMessage(l);
		
		driverselect=taskService.DriverSelect("可用");
		carselect=taskService.CarSelect("可用");
		return SUCCESS;
	}
	
	public List getDriverselect() {
		return driverselect;
	}
	public void setDriverselect(List driverselect) {
		this.driverselect = driverselect;
	}
	public List getCarselect() {
		return carselect;
	}
	public void setCarselect(List carselect) {
		this.carselect = carselect;
	}

	public TaskService getTaskService() {
		return taskService;
	}
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
	public List getMessage() {
		return message;
	}
	public void setMessage(List message) {
		this.message = message;
	}
}
