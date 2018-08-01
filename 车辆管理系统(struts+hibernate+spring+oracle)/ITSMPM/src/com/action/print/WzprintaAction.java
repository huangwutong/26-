package com.action.print;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JasperCompileManager;

import org.apache.struts2.ServletActionContext;

import com.java.Violm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.utils.Constants;

public class WzprintaAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	  private List myList;
	  public String execute() throws Exception {
			// TODO Auto-generated method stub
			HttpServletRequest re = ServletActionContext.getRequest();
			HttpSession session = re.getSession();
			myList=new ArrayList();
			List l=new ArrayList();
			if(session.getAttribute(Constants.violmprintlist)!=null){
				 l=(List)session.getAttribute(Constants.violmprintlist);
			}
			
			for(int i=0;i<l.size();i++){
				Violm fm=((Violm)l.get(i));
				ViolmBean sb=new ViolmBean();
			    sb.setCarnum(fm.getCarbstb().getCarnum());
			    sb.setDriver(fm.getDriver());
			    sb.setFineje(fm.getFineje());
			    sb.setPoints(fm.getPoints());
			    sb.setVioldate(fm.getVioldate());
			    sb.setVioldes(fm.getVioldes());
			    sb.setViolemp(fm.getViolemp());
			    sb.setViolkind(fm.getViolkind());
			    sb.setViolloca(fm.getViolloca());
				myList.add(sb);
				
			}
			
		 ////////¹Ì¶¨Ð´·¨///////
			 try {
			      String reportSource;
			      reportSource=ServletActionContext.getServletContext().getRealPath("/jasper/violmprint.jrxml");
			      File parent = new File(reportSource).getParentFile();
			      JasperCompileManager.compileReportToFile(reportSource,
			        new File(parent, "compiled_violmprint.jasper").getAbsolutePath());
			    }catch (Exception q) {
			      q.printStackTrace();
			      return ERROR;
			    }
			    //session.removeAttribute("message");
			    return SUCCESS;
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
}
