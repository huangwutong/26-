package com.xaccp.struts.enterprise.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xaccp.service.EnterpriseInfoService;

public class EditEnterprisePassAction extends Action {

	private EnterpriseInfoService enterService;
	
	public EnterpriseInfoService getEnterService() {
		return enterService;
	}

	public void setEnterService(EnterpriseInfoService enterService) {
		this.enterService = enterService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}
}