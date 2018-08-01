package com.action.print;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JasperCompileManager;

import org.apache.struts2.ServletActionContext;

import com.java.Mainm;
import com.java.Serm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.utils.Constants;

public class ByprintaAction  extends ActionSupport {
	private static final long serialVersionUID = 1L;
	  private List myList;
	  public String execute() throws Exception {
			// TODO Auto-generated method stub
			HttpServletRequest re = ServletActionContext.getRequest();
			HttpSession session = re.getSession();
			myList=new ArrayList();
			List l=new ArrayList();
			if(session.getAttribute(Constants.mainmprintlist)!=null){
				 l=(List)session.getAttribute(Constants.mainmprintlist);
			}
			
			for(int i=0;i<l.size();i++){
				Mainm mainm=((Mainm)l.get(i));
				MainmBean sb=new MainmBean();
				sb.setCarnum(mainm.getCarbstb().getCarnum());
				sb.setMades(mainm.getMades());
				sb.setMaindate(mainm.getMaindate());
				sb.setMainemp(mainm.getMainemp());
				sb.setMainkind(mainm.getMainkind());
				sb.setMamile(mainm.getMamile());
				sb.setMaxm(mainm.getMaxm());
				sb.setMje(mainm.getMje());
				sb.setMloca(mainm.getMloca());
				myList.add(sb);
				
			}
			
		 ////////¹Ì¶¨Ð´·¨///////
			 try {
			      String reportSource;
			      reportSource=ServletActionContext.getServletContext().getRealPath("/jasper/mainmprint.jrxml");
			      File parent = new File(reportSource).getParentFile();
			      JasperCompileManager.compileReportToFile(reportSource,
			        new File(parent, "compiled_mainmprint.jasper").getAbsolutePath());
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
