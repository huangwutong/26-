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

public class PreEditUserInfoAction extends Action {

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
		UserInfo userInfo=(UserInfo) request.getSession().getAttribute("USERINFO");
		System.out.println("当前用户．．．"+userInfo.getUId());
		System.out.println("当前用户．．．"+userInfo.getUAddress());
		//PO-->ActionForm
		userInfoForm.setUserId(userInfo.getUId());
		userInfoForm.setUserName(userInfo.getUName());
		userInfoForm.setRealName(userInfo.getURealName());
		userInfoForm.setPaperCode(userInfo.getUPaperCode());
		userInfoForm.setUaddress(userInfo.getUAddress());
		userInfoForm.setUemail(userInfo.getUEmail());
		userInfoForm.setUserAge(userInfo.getUAge());
		userInfoForm.setUserSex(userInfo.getUSex());
		userInfoForm.setUserTel(userInfo.getUTel());
		
		return mapping.findForward("ok");
	}
}