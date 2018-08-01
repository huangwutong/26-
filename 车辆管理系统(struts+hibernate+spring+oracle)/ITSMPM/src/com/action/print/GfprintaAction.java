package com.action.print;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JasperCompileManager;

import org.apache.struts2.ServletActionContext;

import com.java.Feesm;
import com.java.Insrm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.utils.Constants;

public class GfprintaAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	  private List myList;
	  public String execute() throws Exception {
			// TODO Auto-generated method stub
			HttpServletRequest re = ServletActionContext.getRequest();
			HttpSession session = re.getSession();
			myList=new ArrayList();
			List l=new ArrayList();
			if(session.getAttribute(Constants.feesmprintlist)!=null){
				 l=(List)session.getAttribute(Constants.feesmprintlist);
			}
			
			for(int i=0;i<l.size();i++){
				Feesm fm=((Feesm)l.get(i));
				FeesmBean sb=new FeesmBean();
			    sb.setCarnum(fm.getCarbstb().getCarnum());
			    sb.setDes(fm.getDes());
			    sb.setFeesdate(fm.getFeesdate());
			    sb.setFeesdep(fm.getFeesdep());
			    sb.setFeesemp(fm.getFeesemp());
			    sb.setFeesje(fm.getFeesje());
			    sb.setFeeskid(fm.getFeeskid());
			    sb.setFeeszq(fm.getFeeszq());
			    
				myList.add(sb);
				
			}
			
		 ////////¹Ì¶¨Ð´·¨///////
			 try {
			      String reportSource;
			      reportSource=ServletActionContext.getServletContext().getRealPath("/jasper/feesmprint.jrxml");
			      File parent = new File(reportSource).getParentFile();
			      JasperCompileManager.compileReportToFile(reportSource,
			        new File(parent, "compiled_feesmprint.jasper").getAbsolutePath());
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
