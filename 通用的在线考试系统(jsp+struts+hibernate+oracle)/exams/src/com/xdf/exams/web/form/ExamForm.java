package com.xdf.exams.web.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 04-09-2007
 * 
 * XDoclet definition:
 * @struts.form name="examForm"
 */
public class ExamForm extends ActionForm {
	private String[] answers;
	private int nowid;
	private int oldid;
		
	public String[] getAnswers() {
		return answers;
	}

	public void setAnswers(String[] answers) {
		this.answers = answers;
	}

	public int getNowid() {
		return nowid;
	}

	public void setNowid(int nowid) {
		this.nowid = nowid;
	}

	public int getOldid() {
		return oldid;
	}

	public void setOldid(int oldid) {
		this.oldid = oldid;
	}

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}
}