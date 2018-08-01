package com.xaccp.struts.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.xaccp.po.UserInfo;
import com.xaccp.service.UserInfoService;
import com.xaccp.struts.form.UserInfoForm;

public class EditUserInfoAction extends Action {
	
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
		UserInfo userInfo=userInfoService.findUserById(userInfoForm.getUserId());
		//ActionForm-->PO
		userInfo.setUAddress(userInfoForm.getUaddress());
		userInfo.setUAge(userInfoForm.getUserAge());
		userInfo.setUEmail(userInfoForm.getUemail());
		userInfo.setUName(userInfoForm.getUserName());
		userInfo.setUPaperCode(userInfoForm.getPaperCode());
		userInfo.setUPass(userInfoForm.getUserPass1());
		userInfo.setURealName(userInfoForm.getRealName());
		userInfo.setUSex(userInfoForm.getUserSex());
		userInfo.setUTel(userInfoForm.getUserTel());
		
		request.getSession().setAttribute("USERINFO", userInfo);
		//ÐÞ¸ÄÓÃ»§
		userInfoService.updateUser(userInfo);
		
		return mapping.findForward("toMemberCenter");
	}
}