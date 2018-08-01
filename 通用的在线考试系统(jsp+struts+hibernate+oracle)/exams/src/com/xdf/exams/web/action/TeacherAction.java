package com.xdf.exams.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.xdf.exams.bean.Teacher;
import com.xdf.exams.bo.BOFactory;
import com.xdf.exams.bo.ITeacherService;
import com.xdf.exams.util.Constant;
import com.xdf.exams.util.PageUtil;
import com.xdf.exams.web.form.TeacherForm;

/** 
 * MyEclipse Struts
 * Creation date: 04-07-2007
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class TeacherAction extends BaseDispatchAction {

	public ActionForward show(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ITeacherService ser = BOFactory.getTeacherService();
		String spageno = request.getParameter("pageno");
		int num = ser.findTeachernum();
		PageUtil pu = new PageUtil(spageno,num,Constant.PAGESIZE);
		List list = ser.findAllTeacher(pu.getPageno(),pu.getPagesize());
		request.setAttribute("pageutil",pu);
		request.setAttribute("teacherlist",list);
		return mapping.findForward("show");
	}
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		this.saveToken(request);
		return mapping.findForward("add");
	}
	public ActionForward adddo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TeacherForm tf = (TeacherForm)form;
		ActionForward af = null;
		if (this.isTokenValid(request)) {
			ITeacherService ser = BOFactory.getTeacherService();
			Teacher t = new Teacher();
			t.setPassword(tf.getPassword());
			t.setUsername(tf.getUsername());
			try {
				ser.addTeacher(t);
				request.setAttribute("message","增加教师成功");
				this.resetToken(request);
				af = mapping.findForward("show");
			} catch (RuntimeException e) {
				e.printStackTrace();
				request.setAttribute("message","增加教师失败，可能是用户名已经存在");
				af = mapping.findForward("add");
			}
		}else {
			request.setAttribute("message","请不要重复提交");
			af = mapping.findForward("show");
		}
		return af;
	}
	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
			TeacherForm tf = (TeacherForm)form;
			ITeacherService ser = BOFactory.getTeacherService();
			try {
				Teacher t = ser.findTeacher(tf.getTeacherid());
				tf.setPassword(t.getPassword());
				tf.setUsername(t.getUsername());
				tf.setTeacherid(t.getTeacherid());
			} catch (RuntimeException e) {
				e.printStackTrace();
				request.setAttribute("message","查询失败");
			}

		return mapping.findForward("update");
	}
	public ActionForward updatedo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TeacherForm tf = (TeacherForm)form;
		ActionForward af = null;
		ITeacherService ser = BOFactory.getTeacherService();
		Teacher t = ser.findTeacher(tf.getTeacherid());
		t.setPassword(tf.getPassword());
		try {
			ser.updateTeacher(t);
			request.setAttribute("message","修改教师成功");
			af = mapping.findForward("show");
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("message","修改教师失败，可能是用户名已经存在");
			af = mapping.findForward("update");
		}
		return af;
	}
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TeacherForm tf = (TeacherForm)form;
		ITeacherService ser = BOFactory.getTeacherService();
		try {
			Teacher t = ser.findTeacher(tf.getTeacherid());
			if(t.getUsername().equals("admin")) {
				request.setAttribute("message","请勿删除admin用户");
			}else {
				ser.deleteTeacher(t);
				request.setAttribute("message","删除教师成功");
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			request.setAttribute("message","删除教师失败");
		}
		return mapping.findForward("show");
	}	
}