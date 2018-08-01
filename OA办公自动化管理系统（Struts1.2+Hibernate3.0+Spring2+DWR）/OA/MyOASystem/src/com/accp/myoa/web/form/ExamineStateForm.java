
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.ExamineState;


public class ExamineStateForm extends ActionForm {
	private ExamineState examineState;
	
	public ExamineStateForm(){
		examineState=new ExamineState();
	}

	public ExamineState getExamineState() {
		return examineState;
	}

	public void setExamineState(ExamineState examineState) {
		this.examineState = examineState;
	}
	
}
	
