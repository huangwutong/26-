package com.action.print;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JasperCompileManager;
import org.apache.struts2.ServletActionContext;

import com.java.Oilm;
import com.opensymphony.xwork2.ActionSupport;
import com.service.utils.Constants;

public class OilprintaAction extends ActionSupport {
	 private static final long serialVersionUID = 1L;
	  private List myList;
	  public String execute() throws Exception {
			// TODO Auto-generated method stub
			HttpServletRequest re = ServletActionContext.getRequest();
			HttpSession session = re.getSession();
			myList=new ArrayList();
			List l=new ArrayList();
			if(session.getAttribute(Constants.oilprintlist)!=null){
				 l=(List)session.getAttribute(Constants.oilprintlist);
			}
			
			for(int i=0;i<l.size();i++){
				Oilm oil=((Oilm)l.get(i));
				OilmBean ob=new OilmBean();
				 ob.setAmount(oil.getAmount());
				 ob.setCarnum(oil.getCarbstb().getCarnum());
				 ob.setGasnm(oil.getGasnm());
				 ob.setHandnm(oil.getHandnm());
				 ob.setLastmile(oil.getLastmile());
				 ob.setLastoil(oil.getLastoil());
				 ob.setLasttrav(oil.getLasttrav());
				 ob.setNowmile(oil.getNowmile());
				 ob.setOcount(oil.getOcount());
				 ob.setOilcnum(oil.getOilcnum());
				 ob.setOildate(oil.getOildate());
				 ob.setOildes(oil.getOildes());
				 ob.setOilkind(oil.getOilkind());
				 ob.setOprice(oil.getOprice());
				 myList.add(ob);
				
			}
			
		 ////////¹Ì¶¨Ð´·¨///////
			 try {
			      String reportSource;
			      reportSource=ServletActionContext.getServletContext().getRealPath("/jasper/oilprint.jrxml");
			      File parent = new File(reportSource).getParentFile();
			      JasperCompileManager.compileReportToFile(reportSource,
			        new File(parent, "compiled_oilprint.jasper").getAbsolutePath());
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
