package com.xaccp.struts.enterprise.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xaccp.po.EnterpriseInfo;
import com.xaccp.service.EnterpriseInfoService;
import com.xaccp.struts.form.EnterpriseForm;

public class EditEnterpriseInfoAction extends Action {

	private EnterpriseInfoService enterService;
	
	public EnterpriseInfoService getEnterService() {
		return enterService;
	}

	public void setEnterService(EnterpriseInfoService enterService) {
		this.enterService = enterService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//ActionForm
		EnterpriseForm enterpriseForm = (EnterpriseForm) form;
		// PO
		EnterpriseInfo enter=(EnterpriseInfo) request.getSession().getAttribute("ENTERPRISEINFO");
		//ActionForm-->PO
		enter.setEAddress(enterpriseForm.getEnterpriseAddress());
		enter.setECompanyName(enterpriseForm.getEnterpriseCompanyName());
		enter.setEEmail(enterpriseForm.getEnterpriseEmail());
		enter.setELinkMan(enterpriseForm.getEnterpriseLinkMan());
		enter.setEName(enterpriseForm.getEnterpriseName());
		enter.setETel(enterpriseForm.getEnterpriseTel());
		
		request.getSession().setAttribute("ENTERPRISEINFO", enter);
		//修改企业信息
		enterService.updateEnterprise(enter);
		
		return mapping.findForward("toEnterpriseCenter");
	}
}