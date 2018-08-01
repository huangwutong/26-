package com.action.task;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.Ucapli;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;
//审批的表格
public class CarspseleAction extends ActionSupport {
	private TaskService taskService;
	private List message;
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Ucapli pr=new Ucapli();
		if(a[0]!=null){
			//获得所有的用户信息
			pr = taskService.QueryUcapliById(new Long(a[0].trim()));
			 
		} 
		List l= new ArrayList();
		l.add(pr);
		setMessage(l);
		return SUCCESS;
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
