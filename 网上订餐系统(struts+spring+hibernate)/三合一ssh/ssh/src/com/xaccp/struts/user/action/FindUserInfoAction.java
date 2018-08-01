package com.xaccp.struts.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xaccp.po.UserInfo;

public class FindUserInfoAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		UserInfo userInfo=(UserInfo) request.getSession().getAttribute("USERINFO");
		
		request.setAttribute("UserInfo", userInfo);
		
		return mapping.findForward("ok");
	}
}