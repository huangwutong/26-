
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.LeaveWord;


public class LeaveWordForm extends ActionForm {
	private LeaveWord leaveWord;
	
	public LeaveWordForm(){
		leaveWord=new LeaveWord();
	}

	public LeaveWord getLeaveWord() {
		return leaveWord;
	}

	public void setLeaveWord(LeaveWord leaveWord) {
		this.leaveWord = leaveWord;
	}
	
}
	
