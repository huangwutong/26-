package com.action.print;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JasperCompileManager;

import org.apache.struts2.ServletActionContext;

import com.java.Annum;
import com.java.Feesm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.utils.Constants;

public class NjprintaAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	  private List myList;
	  public String execute() throws Exception {
			// TODO Auto-generated method stub
			HttpServletRequest re = ServletActionContext.getRequest();
			HttpSession session = re.getSession();
			myList=new ArrayList();
			List l=new ArrayList();
			if(session.getAttribute(Constants.annumprintlist)!=null){
				 l=(List)session.getAttribute(Constants.annumprintlist);
			}
			
			for(int i=0;i<l.size();i++){
				Annum fm=((Annum)l.get(i));
				AnnumBean sb=new AnnumBean();
			    sb.setCarnum(fm.getCarbstb().getCarnum());
			    sb.setAndep(fm.getAndep());
			    sb.setAndes(fm.getAndes());
			    sb.setAnemp(fm.getAnemp());
			    sb.setAnenda(fm.getAnenda());
			    sb.setAnfy(fm.getAnfy());
			    sb.setAnnumdate(fm.getAnnumdate());
			    sb.setAnum(fm.getAnum());
				myList.add(sb);
				
			}
			
		 ////////¹Ì¶¨Ð´·¨///////
			 try {
			      String reportSource;
			      reportSource=ServletActionContext.getServletContext().getRealPath("/jasper/annumprint.jrxml");
			      File parent = new File(reportSource).getParentFile();
			      JasperCompileManager.compileReportToFile(reportSource,
			        new File(parent, "compiled_annumprint.jasper").getAbsolutePath());
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
