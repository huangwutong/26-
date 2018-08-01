package com.action.task;

import java.sql.Date;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class SaveIncarAction extends ActionSupport {

	private Long carbstbid;
	private Long drivermid;
	private Long outcmid;
	private Date sjincomdate;
	private TaskService taskService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		String str = taskService.saveTaskincar(carbstbid,drivermid,outcmid,sjincomdate);
		if(str.equals("")||str.equals("0")){
			addActionError("数据保存失败！");
			return INPUT;
		}
		addActionMessage("数据保存成功！");
		return SUCCESS;
	}
	
	public Long getOutcmid() {
		return outcmid;
	}

	public void setOutcmid(Long outcmid) {
		this.outcmid = outcmid;
	}

	public Date getSjincomdate() {
		return sjincomdate;
	}

	public void setSjincomdate(Date sjincomdate) {
		this.sjincomdate = sjincomdate;
	}

	public Long getCarbstbid() {
		return carbstbid;
	}
	public void setCarbstbid(Long carbstbid) {
		this.carbstbid = carbstbid;
	}
	public Long getDrivermid() {
		return drivermid;
	}
	public void setDrivermid(Long drivermid) {
		this.drivermid = drivermid;
	}
	public TaskService getTaskService() {
		return taskService;
	}
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
}
