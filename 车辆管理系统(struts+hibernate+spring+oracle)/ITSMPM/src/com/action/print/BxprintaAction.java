package com.action.print;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.jasperreports.engine.JasperCompileManager;

import org.apache.struts2.ServletActionContext;

import com.java.Insrm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.utils.Constants;

public class BxprintaAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	  private List myList;
	  public String execute() throws Exception {
			// TODO Auto-generated method stub
			HttpServletRequest re = ServletActionContext.getRequest();
			HttpSession session = re.getSession();
			myList=new ArrayList();
			List l=new ArrayList();
			if(session.getAttribute(Constants.insrmprintlist)!=null){
				 l=(List)session.getAttribute(Constants.insrmprintlist);
			}
			
			for(int i=0;i<l.size();i++){
				Insrm insrm=((Insrm)l.get(i));
				InsrmBean sb=new InsrmBean();
			    sb.setCarnum(insrm.getCarbstb().getCarnum());
			    sb.setDes(insrm.getDes());
			    sb.setInscompy(insrm.getInscompy());
			    sb.setInsemp(insrm.getInsemp());
			    sb.setInsend(insrm.getInsend());
			    sb.setInsfy(insrm.getInsfy());
			    sb.setInskind(insrm.getInskind());
			    sb.setInsnum(insrm.getInsnum());
			    sb.setInsrmdate(insrm.getInsrmdate());
			    sb.setInsxm(insrm.getInsxm());
				myList.add(sb);
				
			}
			
		 ////////¹Ì¶¨Ð´·¨///////
			 try {
			      String reportSource;
			      reportSource=ServletActionContext.getServletContext().getRealPath("/jasper/insrmprint.jrxml");
			      File parent = new File(reportSource).getParentFile();
			      JasperCompileManager.compileReportToFile(reportSource,
			        new File(parent, "compiled_insrmprint.jasper").getAbsolutePath());
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
