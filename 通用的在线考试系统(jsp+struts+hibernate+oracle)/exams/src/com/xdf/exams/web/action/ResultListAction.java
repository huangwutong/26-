package com.xdf.exams.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xdf.exams.bean.Result;
import com.xdf.exams.bean.Student;
import com.xdf.exams.bo.BOFactory;
import com.xdf.exams.bo.IResultService;

/** 
 * MyEclipse Struts
 * Creation date: 04-09-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class ResultListAction extends BaseDispatchAction {

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Student s = (Student)request.getSession().getAttribute("student");
		IResultService ser = BOFactory.getResultService();
		List list = ser.findResultByUserid(s.getStudentid());
		request.setAttribute("resultlist",list);
		return mapping.findForward("result");
	}
	public ActionForward detail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String sresultid = request.getParameter("resultid");
		IResultService ser = BOFactory.getResultService();
		Long resultid = null;
		try {
			resultid = new Long(sresultid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Result r = ser.findResult(resultid);
		request.setAttribute("result",r);
		return mapping.findForward("resultdetail");
	}	
}