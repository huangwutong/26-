package com.action.task;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.java.Outcm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class TaskincarAction extends ActionSupport {
	private TaskService taskService;
	private List message;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		Outcm pr=new Outcm();
		if(a[0]!=null){
			//查询所有的出车的信息
			pr = taskService.QueryOutcmById(new Long(a[0].trim()));
		}
		List l=new ArrayList();
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
