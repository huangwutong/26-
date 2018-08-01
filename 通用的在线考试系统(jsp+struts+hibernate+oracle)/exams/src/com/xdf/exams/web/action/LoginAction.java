package com.xdf.exams.web.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xdf.exams.bean.Loginlog;
import com.xdf.exams.bean.Student;
import com.xdf.exams.bean.Teacher;
import com.xdf.exams.bo.BOFactory;
import com.xdf.exams.bo.ILogService;
import com.xdf.exams.web.form.LoginForm;

/** 
 * MyEclipse Struts
 * Creation date: 04-04-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class LoginAction extends Action {

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
		LoginForm loginForm = (LoginForm)form;
		ILogService ser = BOFactory.getLogService();
		Loginlog log = new Loginlog();
		log.setIp(request.getRemoteAddr());
		log.setLogtime(new Date());
		log.setUsername(loginForm.getUsername());
		HttpSession session = request.getSession();
		ActionForward forward = null;
		try {
			if(loginForm.getRole()==0) {
				log.setIsteacher(0);
				Student s = ser.studentlogin(loginForm.getUsername(),loginForm.getPassword());
				if(s!=null) {
					session.setAttribute("student",s);
					log.setSuccess(1);
					forward = mapping.findForward("student");
				}else {
					request.setAttribute("message","µÇÂ½Ê§°Ü");
					forward = mapping.findForward("index");
				}
			}else {
				log.setIsteacher(1);
				Teacher t = ser.teacherlogin(loginForm.getUsername(),loginForm.getPassword());
				if(t!=null) {
					session.setAttribute("teacher",t);
					log.setSuccess(1);
					forward = mapping.findForward("teacher");
				}else {
					request.setAttribute("message","µÇÂ½Ê§°Ü");
					forward = mapping.findForward("index");
				}
			}
			ser.addlog(log);
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("message","µÇÂ½Ê§°Ü");
			forward = mapping.findForward("index");
		}
		return forward;
	}
}