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
import com.service.*;
import com.struts.form.*;

/** 
 * MyEclipse Struts
 * Creation date: 08-13-2008
 * 
 * XDoclet definition:
 * @struts.action
 */
public class CarmackTruckInfoAddAction extends Action {
	/*
	 * Generated Methods
	 */
	private CarmackBusinessService bs;
	public CarmackBusinessService getBs()
	{
		return bs;
	}
	public void setBs(CarmackBusinessService bs)
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
		
		String truckNum=request.getParameter("TruckNum");
		String truckEngineNum=request.getParameter("TruckEngineNum");
		String truckRunNum=request.getParameter("TruckRunNum");
		String truckInsuranceNum=request.getParameter("TruckInsuranceNum");
		String tMID=request.getParameter("TMID");
		String truckColor=request.getParameter("TruckColor");
		String truckBuyData=request.getParameter("TruckBuyData");
		String branchID=request.getParameter("BranchID");
		String truckIsVacancy=request.getParameter("TruckIsVacancy");
		
		CarmackTruckInfoForm ctif=new CarmackTruckInfoForm();
		
		ctif.setTruckNum(truckNum);
		ctif.setTruckEngineNum(truckEngineNum);
		ctif.setTruckRunNum(truckRunNum);
		ctif.setTruckInsuranceNum(truckInsuranceNum);
		ctif.setTMID(tMID);
		ctif.setTruckColor(truckColor);
		ctif.setTruckBuyData(truckBuyData);
		ctif.setBranchID(branchID);
		ctif.setBruckIsVacancy(truckIsVacancy);
		boolean isok=bs.getTruckinfobu().save(ctif);
		request.setAttribute("tiSaveState", isok);
		return mapping.findForward("tisave");
	}
}