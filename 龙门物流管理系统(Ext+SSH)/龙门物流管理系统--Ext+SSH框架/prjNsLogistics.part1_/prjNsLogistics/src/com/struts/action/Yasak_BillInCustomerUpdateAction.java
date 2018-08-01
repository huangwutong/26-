/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.service.Yasak_BusinessService;
import com.struts.form.OptBranchInfoForm;
import com.struts.form.OptUserInfoForm;
import com.struts.form.Yasak_BillInfoForm;

/** 
 * MyEclipse Struts
 * Creation date: 08-24-2008
 * 
 * XDoclet definition:
 * @struts.action
 */
public class Yasak_BillInCustomerUpdateAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	private Yasak_BusinessService ybs;
	public Yasak_BusinessService getYbs() {
		return ybs;
	}
	public void setYbs(Yasak_BusinessService ybs) {
		this.ybs = ybs;
	}
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String billId = request.getParameter("billId");
		String sendId = request.getParameter("sendId");
		String receiveId = request.getParameter("receiveId");
		OptUserInfoForm ui = (OptUserInfoForm) request.getSession(true).getAttribute("loginer");
		String userId = ui.getUserid();
		OptBranchInfoForm bi = (OptBranchInfoForm) request.getSession(true).getAttribute("loginBranch");
		String receiveBranchId = bi.getBranchid();
		//============
		String billData = request.getParameter("billData");
		String billDataId = request.getParameter("billDataId");
		String sendBranchId = request.getParameter("sendBranchId");
		
		Yasak_BillInfoForm ybf = new Yasak_BillInfoForm();
		ybf.setBillId(billId);
		ybf.setSendId(sendId);
		ybf.setReceiveId(receiveId);
		ybf.setUserId(userId);
		ybf.setSendBranchId(sendBranchId);
		ybf.setBillData(billData);
		ybf.setBillDataId(billDataId);
		ybf.setReceiveBranchId(receiveBranchId);
		
		boolean bl = ybs.getBillbu().update(ybf);
		request.setAttribute("Yasak_updateInfo", bl);
		return mapping.findForward("updateok");
	}
}