package com.xdf.exams.web.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 04-06-2007
 * 
 * XDoclet definition:
 * @struts.form name="questionForm"
 */
public class QuestionForm extends ActionForm {
	private Long subjectid;
	private Long questionid;
	private String content;
	private int score = 1;
	private int qtype;
	private String[] options = new String[8];
	private String[] rightanswers =  new String[8];
	
	public String[] getRightanswers() {
		return rightanswers;
	}

	public void setRightanswers(String[] rightanswers) {
		this.rightanswers = rightanswers;
	}

	public String[] getOptions() {
		return options;
	}

	public void setOptions(String[] options) {
		this.options = options;
	}

	public int getQtype() {
		return qtype;
	}

	public void setQtype(int qtype) {
		this.qtype = qtype;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Long getSubjectid() {
		return subjectid;
	}

	public void setSubjectid(Long subjectid) {
		this.subjectid = subjectid;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getQuestionid() {
		return questionid;
	}

	public void setQuestionid(Long questionid) {
		this.questionid = questionid;
	}
}