package com.xdf.exams.web.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xdf.exams.bo.BOFactory;
import com.xdf.exams.bo.ILogService;
import com.xdf.exams.util.Constant;
import com.xdf.exams.util.PageUtil;
import com.xdf.exams.util.Tools;
import com.xdf.exams.web.form.QueryLogForm;

/** 
 * MyEclipse Struts
 * Creation date: 04-07-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class LogAction extends Action {

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
		QueryLogForm qf = (QueryLogForm)form;
		String spageno = request.getParameter("pageno");
		ILogService ser = BOFactory.getLogService();
		Date sd = null;
		Date ed = null;
		if(qf.getStartdate()!=null&&!qf.getStartdate().equals("")) {
			sd= Tools.s2dlong(qf.getStartdate() + " 00:00:00");
		}
		if(qf.getEnddate()!=null&&!qf.getEnddate().equals("")) {
			ed = Tools.s2dlong(qf.getEnddate() + " 23:59:59");
		}		
		int num = ser.findLognum(sd,ed,qf.getIsteacher());
		PageUtil pu = new PageUtil(spageno,num,Constant.PAGESIZE);
		List list = ser.findLog(sd,ed,qf.getIsteacher(),pu.getPageno(),pu.getPagesize());
		request.setAttribute("loglist",list);
		request.setAttribute("pageutil",pu);
		return mapping.findForward("show");
	}
}