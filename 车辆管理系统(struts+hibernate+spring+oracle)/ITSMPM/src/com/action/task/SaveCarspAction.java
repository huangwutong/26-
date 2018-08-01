package com.action.task;

import com.java.Ucapli;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class SaveCarspAction extends ActionSupport {
	private Long ucapliid;
	private String appstats;
	private String appdes;
	private String appnm;
	
	private TaskService taskService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Ucapli uca=new Ucapli();
		uca = taskService.QueryUcapliById(ucapliid);
		System.out.println("uca======="+uca.getIndate());
		Ucapli uca1=new Ucapli();
		uca1.setUcdep(uca.getUcdep());
		uca1.setUcempnm(uca.getUcempnm());
		uca1.setPhonum(uca.getPhonum());
		uca1.setUcloca(uca.getUcloca());
		uca1.setUcdate(uca.getUcdate());
		uca1.setIndate(uca.getIndate());
		uca1.setThing(uca.getThing());
		uca1.setDtation(uca.getDtation());
		uca1.setUcdes(uca.getUcdes());
		uca1.setUcapliid(uca.getUcapliid());
		uca1.setAppstats(appstats.trim());
		uca1.setWhcar(uca.getWhcar());
		uca1.setAppdes(appdes.trim());
		uca1.setAppnm(appnm.trim());
		taskService.upUca(uca1);
		addActionMessage("数据保存成功！");
		return SUCCESS;
	}
	public Long getUcapliid() {
		return ucapliid;
	}
	public void setUcapliid(Long ucapliid) {
		this.ucapliid = ucapliid;
	}
	public String getAppstats() {
		return appstats;
	}
	public void setAppstats(String appstats) {
		this.appstats = appstats;
	}
	public String getAppdes() {
		return appdes;
	}
	public void setAppdes(String appdes) {
		this.appdes = appdes;
	}
	public String getAppnm() {
		return appnm;
	}
	public void setAppnm(String appnm) {
		this.appnm = appnm;
	}
	public TaskService getTaskService() {
		return taskService;
	}
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
	
}
