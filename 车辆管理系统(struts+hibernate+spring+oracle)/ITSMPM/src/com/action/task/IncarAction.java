package com.action.task;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;
//查看收车系统信息
public class IncarAction extends ActionSupport {

	private TaskService taskService;
	private List message;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		//查看收车状态为否的所有记录
		List l=new ArrayList();
		l=taskService.getOutcmBywhincom("否");
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
