package com.xdf.exams.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xdf.exams.bean.Student;
import com.xdf.exams.bo.BOFactory;
import com.xdf.exams.bo.IStudentService;
import com.xdf.exams.util.Constant;
import com.xdf.exams.util.PageUtil;
import com.xdf.exams.web.form.QueryStudentForm;
import com.xdf.exams.web.form.StudentForm;

/** 
 * MyEclipse Struts
 * Creation date: 04-05-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class StudentAction extends BaseDispatchAction {

	public ActionForward show(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		QueryStudentForm qsf = (QueryStudentForm)form;
		String name = qsf.getQname();
		String spageno = request.getParameter("pageno");
		IStudentService ser = BOFactory.getStudentService();
		int num =ser.findStudentnumByName(name);
		PageUtil pu = new PageUtil(spageno,num,Constant.PAGESIZE); 
		List list = ser.findStudentByName(name,pu.getPageno(),pu.getPagesize());
		request.setAttribute("studentlist",list);
		request.setAttribute("pageutil",pu);
		return mapping.findForward("show");
	}
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		this.saveToken(request);
		return mapping.findForward("add");
	}
	public ActionForward adddo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StudentForm studentForm = (StudentForm)form;
		ActionForward forward = null;
		if(this.isTokenValid(request)) {
			IStudentService ser = BOFactory.getStudentService();
			try {
				if(ser.checkStudentNameExists(studentForm.getUsername(),null)) {
					request.setAttribute("message","�û����Ѿ�����");
					forward = mapping.findForward("add");
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
					forward = mapping.findForward("show");
					this.resetToken(request);
				}
			} catch (RuntimeException e) {
				e.printStackTrace();
				request.setAttribute("message","ע��ʧ��");
				forward = mapping.findForward("add");					
			}
		}else {
			request.setAttribute("message","�벻Ҫ�ظ��ύ");
			forward = mapping.findForward("show");
		}
		
		return forward;
	}	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StudentForm studentForm = (StudentForm)form;
		IStudentService ser = BOFactory.getStudentService();
		try {
			ser.deleteStudent(ser.findStudent(new Long(studentForm.getStudentid())));
			request.setAttribute("message","ɾ���ɹ�");
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("message","ɾ��ʧ��");
		}
		return mapping.findForward("show");
	}
	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StudentForm studentForm = (StudentForm)form;
		IStudentService ser = BOFactory.getStudentService();
		Student s = ser.findStudent(new Long(studentForm.getStudentid()));
		if(s!=null) {
			studentForm.setAddress(s.getAddress());
			studentForm.setEmail(s.getEmail());
			studentForm.setName(s.getName());
			studentForm.setSex(s.getSex());
			studentForm.setUsername(s.getUsername());
			studentForm.setStudentid(s.getStudentid());
		}
		
		return mapping.findForward("update");
	}
	
	public ActionForward updatedo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StudentForm studentForm = (StudentForm)form;
		IStudentService ser = BOFactory.getStudentService();
		ActionForward forward = null;
		try {
			if(ser.checkStudentNameExists(studentForm.getUsername(),studentForm.getStudentid())) {
				request.setAttribute("message","�û����Ѿ�����");
				forward = mapping.findForward("update");
			}else {
				Student s = new Student();
				s.setAddress(studentForm.getAddress());
				s.setEmail(studentForm.getEmail());
				s.setName(studentForm.getName());
				s.setPassword(studentForm.getNewpassword());
				s.setSex(studentForm.getSex());
				s.setUsername(studentForm.getUsername());	
				s.setStudentid(studentForm.getStudentid());
				ser.updateStudent(s);
				request.setAttribute("message","�޸ĳɹ�");
				forward = mapping.findForward("show");
				
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("message","�޸�ʧ��");
			forward = mapping.findForward("update");					
		}

		return forward;
	}	
}