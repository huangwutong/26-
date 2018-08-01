package com.xdf.exams.web.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xdf.exams.bean.Options;
import com.xdf.exams.bean.Question;
import com.xdf.exams.bean.Subject;
import com.xdf.exams.bo.BOFactory;
import com.xdf.exams.bo.IQuestionService;
import com.xdf.exams.util.Constant;
import com.xdf.exams.util.PageUtil;
import com.xdf.exams.util.Tools;
import com.xdf.exams.web.form.QuestionForm;
import com.xdf.exams.web.form.SubjectForm;

/** 
 * MyEclipse Struts
 * Creation date: 04-05-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class SubjectAction extends BaseDispatchAction {

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward show(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		IQuestionService ser = BOFactory.getQuestionService();
		String spageno = request.getParameter("pageno");
		PageUtil pu = new PageUtil(spageno,ser.findAllSubjectsnum(),Constant.PAGESIZE);
		List list = ser.findAllSubjects(pu.getPageno(),pu.getPagesize());
		request.setAttribute("subjectlist",list);
		request.setAttribute("pageutil",pu);
		return mapping.findForward("show");
	}
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		this.saveToken(request);
		SubjectForm sf = (SubjectForm)form;
		return mapping.findForward("add");
	}
	public ActionForward adddo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		SubjectForm sf = (SubjectForm)form;
		ActionForward af = null;
		if(this.isTokenValid(request)) {
			IQuestionService ser = BOFactory.getQuestionService();
			Subject s = new Subject();
			s.setIntro(sf.getIntro());
			s.setName(sf.getName());
			s.setSdate(Tools.d2sshort(new Date()));
			s.setState(sf.getState());
			s.setTime(new Long(sf.getTime()));
			try {
				ser.addSubject(s);
				request.setAttribute("message","增加科目成功");
				af = mapping.findForward("show");
				this.resetToken(request);
			} catch (RuntimeException e) {
				e.printStackTrace();
				request.setAttribute("message","增加科目失败");
				af = mapping.findForward("add");
			}
		}else {
			request.setAttribute("message","请不要重复刷新");
			af = mapping.findForward("show");
		}
		return af;
	}
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		IQuestionService ser = BOFactory.getQuestionService();
		SubjectForm sf = (SubjectForm)form;
		try {
			Subject s = ser.findSubject(sf.getSubjectid());
			ser.deleteSubject(s);
			request.setAttribute("message","删除成功");
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("message","删除失败");
		}
		return mapping.findForward("show");
	}
	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		IQuestionService ser = BOFactory.getQuestionService();
		SubjectForm sf = (SubjectForm)form;
		try {
			Subject s = ser.findSubject(sf.getSubjectid());
			sf.setName(s.getName());
			sf.setIntro(s.getIntro());
			sf.setState(s.getState());
			sf.setTime(s.getTime().intValue());
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("message","查询失败");
		}
		return mapping.findForward("update");
	}
	public ActionForward updatedo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		IQuestionService ser = BOFactory.getQuestionService();
		SubjectForm sf = (SubjectForm)form;
		try {
			Subject s = ser.findSubject(sf.getSubjectid());
			s.setName(sf.getName());
			s.setIntro(sf.getIntro());
			s.setState(sf.getState());
			s.setTime(new Long(sf.getTime()));
			ser.updateSubject(s);
			request.setAttribute("message","修改成功");
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("message","修改失败");
		}
		return mapping.findForward("show");
	}	
	public ActionForward showquestion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		IQuestionService ser = BOFactory.getQuestionService();
		QuestionForm sf = (QuestionForm)form;
		String spageno = request.getParameter("pageno");
		try {
			Subject s = ser.findSubject(sf.getSubjectid());
			int num = ser.findQuestionnumBySubjects(sf.getSubjectid());
			PageUtil pu = new PageUtil(spageno,num,Constant.PAGESIZE);
			List list = ser.findQuestionBySubjects(sf.getSubjectid(),pu.getPageno(),pu.getPagesize());
			request.setAttribute("questionlist",list);
			request.setAttribute("pageutil",pu);
			request.setAttribute("subject",s);
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("message","查询失败");
		}
		return mapping.findForward("show");
	}
	public ActionForward addquestion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionForm qf= (QuestionForm)form;
		IQuestionService ser = BOFactory.getQuestionService();
		request.setAttribute("subject",ser.findSubject(qf.getSubjectid()));
		this.saveToken(request);
		return mapping.findForward("add");
	}
	public ActionForward addquestiondo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward af = null;
		if(this.isTokenValid(request)) {
			try {
				IQuestionService ser = BOFactory.getQuestionService();		
				QuestionForm qf= (QuestionForm)form;
				Question que = new Question();
				que.setContent(qf.getContent());
				que.setQtype(qf.getQtype());
				String rans = "";
				if(qf.getRightanswers()!=null)
				for (int i=0;i<qf.getRightanswers().length;i++) {
					rans += qf.getRightanswers()[i];
				}
				que.setRightanswer(rans);
				que.setScore(qf.getScore());
				que.setSdate(Tools.d2sshort(new Date()));
				que.setSubject(ser.findSubject(qf.getSubjectid()));
				
				List oplist = new ArrayList();
				if(qf.getOptions()!=null)
				for (int i=0;i<qf.getOptions().length;i++) {
					if(qf.getOptions()[i]!=null&&!qf.getOptions()[i].equals("")) {
						Options ops = new Options();
						ops.setContent(qf.getOptions()[i]);
						ops.setQuestion(que);
						oplist.add(ops);
					}
				}
				
				ser.addQuestion(que,oplist);
				request.setAttribute("message","增加试题成功");
				af = mapping.findForward("show");
				this.resetToken(request);
			} catch (RuntimeException e) {
				e.printStackTrace();
				request.setAttribute("message","增加试题失败");
				af = mapping.findForward("add");
			}
		}else {
			request.setAttribute("message","不要重复提交");
			af = mapping.findForward("show");
		}
		return af;
	}	
	public ActionForward updatequestion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionForm qf= (QuestionForm)form;
		IQuestionService ser = BOFactory.getQuestionService();
		Question que = ser.findQuestion(qf.getQuestionid());
		qf.setSubjectid(qf.getSubjectid());
		qf.setQuestionid(que.getQuestionid());
		qf.setContent(que.getContent());
		qf.setQtype(que.getQtype());
		qf.setScore(que.getScore());
		qf.setRightanswers(Tools.tostringarray(que.getRightanswer()));
		Set s = que.getOptionses();
		String[] os = new String[8];
		int i=0;
		for (Object o:s) {
			Options opt = (Options)o;
			os[i] = opt.getContent();
			i++;
		}
		qf.setOptions(os);
		request.setAttribute("subject",ser.findSubject(qf.getSubjectid()));
		return mapping.findForward("update");
	}	
	public ActionForward updatequestiondo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
			ActionForward af = null;
			try {
				IQuestionService ser = BOFactory.getQuestionService();		
				QuestionForm qf= (QuestionForm)form;
				Question que = ser.findQuestion(qf.getQuestionid());
				que.setContent(qf.getContent());
				que.setQtype(qf.getQtype());
				String rans = "";
				if(qf.getRightanswers()!=null)
				for (int i=0;i<qf.getRightanswers().length;i++) {
					rans += qf.getRightanswers()[i];
				}
				que.setRightanswer(rans);
				que.setScore(qf.getScore());
				que.setSubject(ser.findSubject(qf.getSubjectid()));
				
				List oplist = new ArrayList();
				if(qf.getOptions()!=null)
				for (int i=0;i<qf.getOptions().length;i++) {
					if(qf.getOptions()[i]!=null&&!qf.getOptions()[i].equals("")) {
						Options ops = new Options();
						ops.setContent(qf.getOptions()[i]);
						ops.setQuestion(que);
						oplist.add(ops);
					}
				}
				
				ser.updateQuestion(que,oplist);
				request.setAttribute("message","修改试题成功");
				af = mapping.findForward("show");
				this.resetToken(request);
			} catch (RuntimeException e) {
				e.printStackTrace();
				request.setAttribute("message","修改试题失败");
				af = mapping.findForward("update");
			}
		return af;
	}
	public ActionForward deletequestion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QuestionForm qf = (QuestionForm)form;
		IQuestionService ser = BOFactory.getQuestionService();
		try {
			ser.deleteQuestion(ser.findQuestion(qf.getQuestionid()));
			request.setAttribute("message","删除成功");
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("message","删除失败");
		}
		return mapping.findForward("show");
	}	
}