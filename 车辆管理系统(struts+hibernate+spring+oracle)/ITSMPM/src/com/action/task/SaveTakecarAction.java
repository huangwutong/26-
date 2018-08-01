package com.action.task;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class SaveTakecarAction extends ActionSupport {

	private Long carbstbid;
	private Long drivermid;
	private Long ucapliid;
	private TaskService taskService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		//保存出车信息
		String str = taskService.saveOutcm(carbstbid,drivermid,ucapliid);
		if(str.equals("")||str.equals("0")){
			addActionError("数据保存失败！");
			return INPUT;
		} 
		addActionMessage("数据保存成功！");
		return SUCCESS;
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
	public Long getUcapliid() {
		return ucapliid;
	}
	public void setUcapliid(Long ucapliid) {
		this.ucapliid = ucapliid;
	}
	public TaskService getTaskService() {
		return taskService;
	}
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
	 

}
