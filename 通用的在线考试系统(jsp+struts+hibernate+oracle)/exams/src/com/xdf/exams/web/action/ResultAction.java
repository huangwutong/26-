package com.xdf.exams.web.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xdf.exams.bean.Subject;
import com.xdf.exams.bo.BOFactory;
import com.xdf.exams.bo.IQuestionService;
import com.xdf.exams.bo.IResultService;
import com.xdf.exams.util.Constant;
import com.xdf.exams.util.PageUtil;
import com.xdf.exams.util.Tools;
import com.xdf.exams.web.form.QueryResultForm;

public class ResultAction extends BaseDispatchAction {

	public ActionForward query(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QueryResultForm qrf = (QueryResultForm) form;
		IQuestionService ser = BOFactory.getQuestionService();
		List sublist = ser.findAllSubjects();
		Subject opt = new Subject();
		opt.setSubjectid(new Long(0));
		opt.setName("È«²¿");
		sublist.add(0, opt);
		request.setAttribute("subjectlist", sublist);

		return mapping.findForward("query");
	}

	public ActionForward querydo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QueryResultForm qrf = (QueryResultForm) form;
		IResultService ser = BOFactory.getResultService();
		String spageno = request.getParameter("pageno");
		Date sd = null;
		Date ed = null;
		if(qrf.getStartdate()!=null&&!qrf.getStartdate().equals("")) {
			sd= Tools.s2dlong(qrf.getStartdate() + " 00:00:00");
		}
		if(qrf.getEnddate()!=null&&!qrf.getEnddate().equals("")) {
			ed = Tools.s2dlong(qrf.getEnddate() + " 23:59:59");
		}
		
		int num = ser.findResultnum(qrf.getSubjectid(), qrf.getUsername(), qrf
				.getName(), sd, ed);
		PageUtil pu = new PageUtil(spageno, num, Constant.PAGESIZE);
		List list = ser.findResult(qrf.getSubjectid(), qrf.getUsername(), qrf.getName(),
				sd, ed, qrf.getOrder(), pu.getPageno(), pu.getPagesize());
		request.setAttribute("resultlist",list);
		request.setAttribute("pageutil",pu);
		return mapping.findForward("show");
	}
	public ActionForward showdetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String sresultid = request.getParameter("resultid");
		IResultService ser = BOFactory.getResultService();
		Long resultid = null;
		
		try {
			resultid = new Long(sresultid);
			List list = ser.findRecord(resultid);
			request.setAttribute("recordlist",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapping.findForward("resultdetail");
	}
}