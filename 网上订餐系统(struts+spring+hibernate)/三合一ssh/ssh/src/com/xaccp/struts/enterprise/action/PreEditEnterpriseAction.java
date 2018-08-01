package com.xaccp.struts.enterprise.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xaccp.po.EnterpriseInfo;
import com.xaccp.struts.form.EnterpriseForm;

public class PreEditEnterpriseAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//ActionForm
		EnterpriseForm enterpriseForm = (EnterpriseForm) form;
		// 获得企业信息
		EnterpriseInfo enterpriseInfo=(EnterpriseInfo) request.getSession().getAttribute("ENTERPRISEINFO");
		//PO-->ActionForm
		enterpriseForm.setEnterpriseAddress(enterpriseInfo.getEAddress());
		enterpriseForm.setEnterpriseCompanyName(enterpriseInfo.getECompanyName());
		enterpriseForm.setEnterpriseEmail(enterpriseInfo.getEEmail());
		enterpriseForm.setEnterpriseLinkMan(enterpriseInfo.getELinkMan());
		enterpriseForm.setEnterpriseName(enterpriseInfo.getEName());
		enterpriseForm.setEnterpriseTel(enterpriseInfo.getETel());
		enterpriseForm.setEnterId(enterpriseInfo.getEId());
		
		return mapping.findForward("ok");
	}
}