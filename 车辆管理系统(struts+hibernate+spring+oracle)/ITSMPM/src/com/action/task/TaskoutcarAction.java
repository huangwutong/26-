package com.action.task;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;
//出车管理系统
public class TaskoutcarAction extends ActionSupport {
	private TaskService taskService;
	private List message;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		List l=new ArrayList();
		//查看通过且没派车的用车申请单
		l=taskService.getUcapliSp("通过","否");
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
