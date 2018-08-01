package com.xdf.exams.web.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xdf.exams.bean.Examrecord;
import com.xdf.exams.bean.Question;
import com.xdf.exams.bean.Result;
import com.xdf.exams.bean.Student;
import com.xdf.exams.bean.Subject;
import com.xdf.exams.bo.BOFactory;
import com.xdf.exams.bo.IExamService;
import com.xdf.exams.bo.IQuestionService;
import com.xdf.exams.util.Tools;
import com.xdf.exams.web.form.ExamForm;

public class ExamAction extends BaseDispatchAction {

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		IExamService ser = BOFactory.getExamService();
		HttpSession session = request.getSession();
		Student s = (Student)session.getAttribute("student");
		List list = ser.findExamable(s.getStudentid());
		request.setAttribute("subjectlist",list);
		return mapping.findForward("examlist");
	}

	public ActionForward exampre(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		IExamService ser = BOFactory.getExamService();
		IQuestionService qser = BOFactory.getQuestionService();
		String ssubjectid = request.getParameter("subjectid");
		Long subjectid = null;
		try {
			subjectid = new Long(ssubjectid);
			Subject s = qser.findSubject(subjectid);
			if(s.getTotalnum().equals(new Integer(0))) {
				throw new Exception();
			}
		} catch (Exception e) {			
			request.setAttribute("message","��Ŀ�����û����Ŀ�����ܲμ����ſο��ԣ�");
			return  mapping.findForward("examlist");
		}
		
		HttpSession session = request.getSession();
		Student s = (Student)session.getAttribute("student");
		boolean b = ser.findcanExam(s.getStudentid(),new Long(subjectid));
		if(!b) {
			request.setAttribute("message","�㲻�ܲμ����ſο��ԣ�");
			return mapping.findForward("examlist");			
		}else {
			Subject sub = qser.findSubject(new Long(subjectid));
			session.setAttribute("subject",sub);
			return  mapping.findForward("exampre");
		}
		
	}
	public ActionForward start(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		IExamService ser = BOFactory.getExamService();
		HttpSession session = request.getSession();
		Subject subject = (Subject)session.getAttribute("subject");
		ActionForward af = null;
		if(subject==null) {
			af = mapping.findForward("examlist");
		}else {
			List list = ser.findinitExam(subject.getSubjectid());
//			�Ѵ𰸺���Ŀ�б�ŵ�session��
			session.setAttribute("examinglist",list);
			session.setAttribute("starttime",new Date());
			af = mapping.findForward("go");
		}
		return af;
	}
	public ActionForward go(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ExamForm ef = (ExamForm)form;
		
		IQuestionService qser = BOFactory.getQuestionService();
		HttpSession session = request.getSession();
		
		//�õ�session�еĴ𰸺���Ŀ�б�
		List list = (List)session.getAttribute("examinglist");
		if(list==null) {
			request.setAttribute("message","��û���ڿ���");
			return mapping.findForward("examlist");
		}
		
		//�õ��ղ�������Ŀ
		Examrecord old = (Examrecord)list.get(ef.getOldid());
		
		//�õ��ύ�����Ĵ�
		String[] answers = ef.getAnswers();
		String ans = "";
		if(answers!=null) {
			for (int i=0;i<answers.length;i++) {
				ans += answers[i];
			}
		}
		//�Ѵ�ô𰸱�����������Ȼ��session�е�List��
		old.setAnswer(ans);
		//��session�õ�Ҫ��ʾ����źʹ𰸣�now)
		Examrecord now = (Examrecord)list.get(ef.getNowid());
		//�����ݿ��в����Ŀ
		Question nowq = qser.findQuestion(now.getQuestion().getQuestionid());
		request.setAttribute("question",nowq);
		//�õ�Ҫ��ʾ�Ĵ�
		ef.setAnswers(Tools.tostringarray(now.getAnswer()));
		ef.setOldid(ef.getNowid());
		//�õ�ʣ������
		Subject subject = (Subject)session.getAttribute("subject");
		Date starttime = (Date)session.getAttribute("starttime");
		Date nowtime = new Date();
		int sec = (int)(subject.getTime()*60 - (nowtime.getTime()-starttime.getTime())/1000);
		request.setAttribute("remainsec",new Integer(sec));
		
		return mapping.findForward("exam");
	}
	public ActionForward end(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ExamForm ef = (ExamForm)form;
		
		IExamService ser = BOFactory.getExamService();
		HttpSession session = request.getSession();
		
		//�õ�session�еĴ𰸺���Ŀ�б�
		List list = (List)session.getAttribute("examinglist");
		if(list==null) {
			request.setAttribute("message","��û���ڿ���");
			return mapping.findForward("examlist");
		}
		//�õ��ղ�������Ŀ
		Examrecord old = (Examrecord)list.get(ef.getOldid());
		
		//�õ��ύ�����Ĵ�
		String[] answers = ef.getAnswers();
		String ans = "";
		if(answers!=null) {
			for (int i=0;i<answers.length;i++) {
				ans += answers[i];
			}
		}
		//�Ѵ�ô𰸱�����������Ȼ��session�е�List��
		old.setAnswer(ans);
		Result r = new Result();
		r.setEndtime(new Date());
		Date starttime = (Date)session.getAttribute("starttime");
		session.removeAttribute("starttime");
		r.setStarttime(starttime);
		Subject subject = (Subject)session.getAttribute("subject");
		session.removeAttribute("subject");
		r.setSubject(subject);	
		Student s = (Student)session.getAttribute("student");
		r.setStudent(s);
		try {
			ser.submit(r,list);
			request.setAttribute("message","����ɹ�!");			
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("message","����ʧ��!");			
		}
		session.removeAttribute("examinglist");
		return mapping.findForward("examlist");
	}	
}