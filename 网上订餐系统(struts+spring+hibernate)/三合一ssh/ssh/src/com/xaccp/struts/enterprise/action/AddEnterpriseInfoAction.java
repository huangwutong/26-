package com.xaccp.struts.enterprise.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.xaccp.po.EnterpriseInfo;
import com.xaccp.service.EnterpriseInfoService;
import com.xaccp.struts.form.EnterpriseForm;
import com.xaccp.util.MD5;

public class AddEnterpriseInfoAction extends Action {

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
		//PO
		EnterpriseInfo ei=new EnterpriseInfo();
		//获得验证码
		StringBuffer random=(StringBuffer) request.getSession().getAttribute("RandomCode");
		String  randCode=request.getParameter("randCode");
		if(!random.toString().equals(randCode)){
			ActionErrors ae=new ActionErrors();
			ae.add("randError",new ActionError("error"));
			saveErrors(request, ae);
			return mapping.getInputForward();
		}
		//加密
		MD5 md5=new MD5();
		ei.setEAddress(enterpriseForm.getEnterpriseAddress());
		ei.setECompanyName(enterpriseForm.getEnterpriseCompanyName());
		ei.setEEmail(enterpriseForm.getEnterpriseEmail());
		ei.setELinkMan(enterpriseForm.getEnterpriseLinkMan());
		ei.setEName(enterpriseForm.getEnterpriseName());
		ei.setEPass(md5.getMD5ofStr(enterpriseForm.getEnterprisePass()));
		ei.setETel(enterpriseForm.getEnterpriseTel());
		//添加企业
		enterService.saveEnterprise(ei);
		
		return mapping.findForward("ok");
	}
}