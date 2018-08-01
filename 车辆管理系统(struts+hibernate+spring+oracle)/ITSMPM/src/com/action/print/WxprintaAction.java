package com.action.print;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JasperCompileManager;

import org.apache.struts2.ServletActionContext;

import com.java.Oilm;
import com.java.Serm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.utils.Constants;

public class WxprintaAction extends ActionSupport {
	 private static final long serialVersionUID = 1L;
	  private List myList;
	  public String execute() throws Exception {
			// TODO Auto-generated method stub
			HttpServletRequest re = ServletActionContext.getRequest();
			HttpSession session = re.getSession();
			myList=new ArrayList();
			List l=new ArrayList();
			if(session.getAttribute(Constants.reparprintlist)!=null){
				 l=(List)session.getAttribute(Constants.reparprintlist);
			}
			
			for(int i=0;i<l.size();i++){
				Serm serm=((Serm)l.get(i));
				SermBean sb=new SermBean();
				sb.setCarnum(serm.getCarbstb().getCarnum());
				sb.setSerdate(serm.getSerdate());
				sb.setSeremp(serm.getSeremp());
				sb.setSerje(serm.getSerje());
				sb.setSerron(serm.getSerron());
				sb.setSershop(serm.getSershop());
				sb.setSjtake(serm.getSjtake());
				sb.setYtake(serm.getYtake());
				myList.add(sb);
				
			}
			
		 ////////¹Ì¶¨Ð´·¨///////
			 try {
			      String reportSource;
			      reportSource=ServletActionContext.getServletContext().getRealPath("/jasper/sermprint.jrxml");
			      File parent = new File(reportSource).getParentFile();
			      JasperCompileManager.compileReportToFile(reportSource,
			        new File(parent, "compiled_sermprint.jasper").getAbsolutePath());
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
