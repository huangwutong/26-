package com.xdf.exams.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xdf.exams.bean.Student;
import com.xdf.exams.bo.BOFactory;
import com.xdf.exams.bo.IStudentService;
import com.xdf.exams.web.form.StudentForm;

/** 
 * MyEclipse Struts
 * Creation date: 04-05-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class RegistAction extends BaseDispatchAction {

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward regist(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		this.saveToken(request);
		return mapping.findForward("regist");
	}
	
	public ActionForward registdo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StudentForm studentForm = (StudentForm)form;
		ActionForward forward = null;
		if(this.isTokenValid(request)) {
			IStudentService ser = BOFactory.getStudentService();
			try {
				if(ser.checkStudentNameExists(studentForm.getUsername(),null)) {
					request.setAttribute("message","�û����Ѿ�����");
					forward = mapping.findForward("regist");
				}else {
					Student s = new Student();
					s.setAddress(studentForm.getAddress());
					s.setEmail(studentForm.getEmail());
					s.setName(studentForm.getName());
					s.setPassword(studentForm.getNewpassword());
					s.setSex(studentForm.getSex());
					s.setUsername(studentForm.getUsername());				
					
					ser.addStudent(s);
					request.setAttribute("message","���ӳɹ�");
					forward = mapping.findForward("registmessage");
					this.resetToken(request);					
				}
			} catch (RuntimeException e) {
				e.printStackTrace();
				request.setAttribute("message","����ʧ��");
				forward = mapping.findForward("regist");					
			}
		}else {
			request.setAttribute("message","�벻Ҫ�ظ��ύ");
			forward = mapping.findForward("registmessage");
		}
		
		return forward;
	}	
}