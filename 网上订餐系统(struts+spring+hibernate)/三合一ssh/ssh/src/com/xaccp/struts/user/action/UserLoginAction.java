package com.xaccp.struts.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.xaccp.po.UserInfo;
import com.xaccp.service.UserInfoService;
import com.xaccp.struts.form.UserInfoForm;

public class UserLoginAction extends Action {

	private UserInfoService userInfoService;
	
	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//ActionForm
		UserInfoForm userInfoForm = (UserInfoForm) form;
		// PO
		UserInfo ui=new UserInfo();
		ui.setUName(userInfoForm.getUserName());
		ui.setUPass(userInfoForm.getUserPass1());
		
		UserInfo userInfo= userInfoService.findUserByNameAndPass(ui);
		if(userInfo==null){
			ActionErrors ae=new ActionErrors();
			ae.add("userinfo",new ActionError("user.error"));
			saveErrors(request,ae);
			return mapping.getInputForward();
			
		}
		request.getSession().setAttribute("USERINFO",userInfo);
		return mapping.findForward("ok");
	}
}