package com.action.print;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.jasperreports.engine.JasperCompileManager;

import org.apache.struts2.ServletActionContext;

import com.java.Outcm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.task.TaskService;

public class OutcmprintAction extends ActionSupport {
	//默认的序列号
	 private static final long serialVersionUID = 1L;
	  private List myList;
	  private TaskService taskService;
	  
	public TaskService getTaskService() {
		return taskService;
	}
	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}
	public List getMyList() {
		return myList;
	}
	public void setMyList(List myList) {
		this.myList = myList;
	}
	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re = ServletActionContext.getRequest();
		String[] a =re.getParameterValues("Id");
		System.out.println(a[0]);
		//首先将数据存放在一个pr对象里
		Outcm pr=new Outcm();
		if(a[0]!=null){
			pr = taskService.QueryOutcmById(new Long(a[0].trim()));
		} 
		
		OutcmBean ob=new OutcmBean();
		ob.setCarnum(pr.getCarbstb().getCarnum());
		ob.setDrivnm(pr.getDriverm().getDrivnm());
		ob.setDtation(pr.getUcapli().getDtation());
		ob.setIndate(pr.getUcapli().getIndate());
		ob.setPhonum(pr.getUcapli().getPhonum());
		ob.setThing(pr.getUcapli().getThing());
		ob.setUcdate(pr.getUcapli().getUcdate());
		ob.setUcempnm(pr.getUcapli().getUcempnm());
		ob.setUcloca(pr.getUcapli().getUcloca());
		myList=new ArrayList();
		
		myList.add(ob);
		
		
		////////固定写法///////
		 try {
		      String reportSource;
		      reportSource=ServletActionContext.getServletContext().getRealPath("/jasper/outcmprint.jrxml");
		      File parent = new File(reportSource).getParentFile();
		      JasperCompileManager.compileReportToFile(reportSource,
		        new File(parent, "compiled_outcmprint.jasper").getAbsolutePath());
		    }catch (Exception q) {
		      q.printStackTrace();
		      return ERROR;
		    }
		    //session.removeAttribute("message");
		    return SUCCESS;
	}

}
