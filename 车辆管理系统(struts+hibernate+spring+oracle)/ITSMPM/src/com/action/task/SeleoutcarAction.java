package com.action.task;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;
//查看出车单
public class SeleoutcarAction extends ActionSupport {

	private TaskService taskService;
	private List message;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		List l=new ArrayList(); 
		//查看出车单时，必须是已经派车
		l=taskService.getOutcmAllBywhincom("是");
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
