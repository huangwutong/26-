/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.struts.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.service.*;
import com.struts.form.OptBranchInfoForm;
/** 
 * MyEclipse Struts
 * Creation date: 08-13-2008
 * 
 * XDoclet definition:
 * @struts.action
 */
public class CarmackTruckInfoListAction extends Action {
	/*
	 * Generated Methods
	 */
	private CarmackBusinessService bs;
	public CarmackBusinessService getBs()
	{
		return bs;
	}
	public void  setBs(CarmackBusinessService bs)
	{
		this.bs=bs;
	}
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		//获取分页参数
		String start = request.getParameter("start");
		String limit = request.getParameter("limit");
		if (start == null) {
			start = "0";
		}
		if (limit == null) {
			limit = "10";
		}
		//将分页参数重新放置到域中
		request.setAttribute("start", start);
		request.setAttribute("limit", limit);
				
		Vector truckinfovc=bs.getTruckinfobu().findAll();
		
		request.setAttribute("truckInfovc",truckinfovc);
		return mapping.findForward("tilist");
	}
}