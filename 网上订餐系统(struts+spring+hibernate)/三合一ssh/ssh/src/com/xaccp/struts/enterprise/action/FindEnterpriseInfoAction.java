package com.xaccp.struts.enterprise.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xaccp.po.EnterpriseInfo;

public class FindEnterpriseInfoAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		EnterpriseInfo enterpriseInfo=(EnterpriseInfo) request.getSession().getAttribute("ENTERPRISEINFO");
		
		request.setAttribute("EnterpriseInfo", enterpriseInfo);
		
		return mapping.findForward("ok");
	}
}