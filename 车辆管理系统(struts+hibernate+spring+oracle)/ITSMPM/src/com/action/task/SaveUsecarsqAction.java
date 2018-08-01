package com.action.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.java.Ucapli;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class SaveUsecarsqAction extends ActionSupport {
	private String ucdep;
	private String ucempnm;
	private String phonum;
	private String ucloca;
	private Date ucdate;
	private Date indate;
	private String thing;
	private String dtation;
	private String ucdes;
	private String appstats;
	private TaskService taskService;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Ucapli uca=new Ucapli();
		uca.setUcdep(ucdep.trim());
		uca.setUcempnm(ucempnm.trim());
		uca.setPhonum(phonum.trim());
		uca.setUcloca(ucloca.trim());
		uca.setUcdate(ucdate);
		uca.setIndate(indate);
		uca.setThing(thing.trim());
		uca.setDtation(dtation.trim());
		uca.setUcdes(ucdes.trim());
		uca.setAppstats(appstats.trim());
		uca.setWhcar("否");
		taskService.saveUca(uca);
		addActionMessage("数据保存成功！");
		return SUCCESS;
	}
	
	
	@Override
	public void validate() {
		// TODO Auto-generated method stub
		if(ucempnm==null || ucempnm.trim().equals("")){
			addActionError("用车人必须录入！");
		}
		if(phonum==null || phonum.trim().equals("")){
			addActionError("用车人联系电话必录！");
		}
		if(ucloca==null || ucloca.trim().equals("")){
			addActionError("出发地点必录！");
		}
		if(ucdate==null){
			addActionError("出车时间必录！");
		}
		if(indate==null){
			addActionError("收车时间必录！");
		}
		if(ucdate!=null && indate!=null){
			SimpleDateFormat sf= new SimpleDateFormat("yyyy-MM-dd");
			String b = sf.format(ucdate);
			String e = sf.format(indate);
				if(b.toString().trim().compareTo(e.toString().trim())>0)//出车时间在收车时间之后，那就提示错误
				{
					addActionError("出车时间必须在收车时间之前！");
				}
			
		  }
		if(thing==null || thing.trim().equals("")){
			addActionError("事由必录！");
		}
		if(dtation==null || dtation.trim().equals("")){
			addActionError("目的地必录！");
		}
		
	}
	

	public String getAppstats() {
		return appstats;
	}
	public void setAppstats(String appstats) {
		this.appstats = appstats;
	}
	public String getUcdep() {
		return ucdep;
	}
	public void setUcdep(String ucdep) {
		this.ucdep = ucdep;
	}
	public String getUcempnm() {
		return ucempnm;
	}
	public void setUcempnm(String ucempnm) {
		this.ucempnm = ucempnm;
	}
	public String getPhonum() {
		return phonum;
	}
	public void setPhonum(String phonum) {
		this.phonum = phonum;
	}
	public String getUcloca() {
		return ucloca;
	}
	public void setUcloca(String ucloca) {
		this.ucloca = ucloca;
	}
	public Date getUcdate() {
		return ucdate;
	}
	public void setUcdate(Date ucdate) {
		this.ucdate = ucdate;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}
	public String getThing() {
		return thing;
	}
	public void setThing(String thing) {
		this.thing = thing;
	}
	public String getDtation() {
		return dtation;
	}
	public void setDtation(String dtation) {
		this.dtation = dtation;
	}
	public String getUcdes() {
		return ucdes;
	}
	public void setUcdes(String ucdes) {
		this.ucdes = ucdes;
	}
	public TaskService getTaskService() {
		return taskService;
	}
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}

}
