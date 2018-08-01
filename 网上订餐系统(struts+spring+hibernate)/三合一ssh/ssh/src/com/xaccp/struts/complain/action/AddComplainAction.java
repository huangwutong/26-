package com.xaccp.struts.complain.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xaccp.po.ComplainInfo;
import com.xaccp.po.UserInfo;
import com.xaccp.service.ComplainInfoService;

public class AddComplainAction extends Action {

	private ComplainInfoService complainService;
	
	public ComplainInfoService getComplainService() {
		return complainService;
	}

	public void setComplainService(ComplainInfoService complainService) {
		this.complainService = complainService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
//获得抱怨信息里面的内容
		String complainIdeal=request.getParameter("complainIdeal");
		UserInfo userInfo=(UserInfo) request.getSession().getAttribute("USERINFO");
		//添加投诉
		ComplainInfo complain=new ComplainInfo();
		complain.setCiIdea(complainIdeal);
		complain.setUserInfo(userInfo);
		complainService.saveComplain(complain);
		
		return mapping.findForward("toMemberCenter");
	}
}