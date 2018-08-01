package com.xdf.exams.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xdf.exams.bean.Student;
import com.xdf.exams.bo.BOFactory;
import com.xdf.exams.bo.ILogService;
import com.xdf.exams.bo.IStudentService;
import com.xdf.exams.web.form.StudentForm;

/**
 * MyEclipse Struts Creation date: 04-04-2007
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/student/info/update" name="studentForm" scope="request"
 *                validate="true"
 */
public class StudentInfoAction extends BaseDispatchAction {

	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		StudentForm studentForm = (StudentForm) form;
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		if (s != null) {
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
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		StudentForm studentForm = (StudentForm) form;
		HttpSession session = request.getSession();
		Student s = (Student) session.getAttribute("student");
		if (s != null) {
			IStudentService sser = BOFactory.getStudentService();
			ILogService lser = BOFactory.getLogService();
			try {
				Student news = lser.studentlogin(s.getUsername(), studentForm
						.getOldpassword());
				if (news != null) {
					if (sser.checkStudentNameExists(studentForm.getUsername(),studentForm.getStudentid())) {
						request.setAttribute("message", "用户名已经存在");
					} else {
						news.setAddress(studentForm.getAddress());
						news.setEmail(studentForm.getEmail());
						news.setName(studentForm.getName());
						news.setPassword(studentForm.getNewpassword());
						news.setSex(studentForm.getSex());
						news.setUsername(studentForm.getUsername());
						
						sser.updateStudent(news);
						session.setAttribute("student", news);
						request.setAttribute("message", "修改成功");
					}

				} else {
					request.setAttribute("message", "旧密码输入错误");
				}
			} catch (RuntimeException e) {
				request.setAttribute("message", "修改失败");
				e.printStackTrace();
			}
		}
		return mapping.findForward("update");
	}
}