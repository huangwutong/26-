package com.action.login;

import java.lang.reflect.Field;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.action.print.MainmBean;
import com.opensymphony.xwork2.ActionSupport;
import com.service.utils.Constants;

public class ExitloginAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest re=ServletActionContext.getRequest();
		HttpSession session = re.getSession();
		if(session.getAttribute(Constants.COMPSID)!=null){
			session.removeAttribute(Constants.COMPSID);
		}
		if(session.getAttribute(Constants.SHOWMESSAGE)!=null){
			session.removeAttribute(Constants.SHOWMESSAGE);
		}
		if(session.getAttribute(Constants.oilprintlist)!=null){
			session.removeAttribute(Constants.oilprintlist);
		}
		if(session.getAttribute(Constants.reparprintlist)!=null){
			session.removeAttribute(Constants.reparprintlist);
		}
		if(session.getAttribute(Constants.mainmprintlist)!=null){
			session.removeAttribute(Constants.mainmprintlist);
		}
		
		return SUCCESS;
	}
	


}
