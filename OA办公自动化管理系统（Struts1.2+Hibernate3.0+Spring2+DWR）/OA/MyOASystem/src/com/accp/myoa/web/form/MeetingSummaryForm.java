
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.MeetingSummary;


public class MeetingSummaryForm extends ActionForm {
	private MeetingSummary meetingSummary;
	
	public MeetingSummaryForm(){
		meetingSummary=new MeetingSummary();
	}

	public MeetingSummary getMeetingSummary() {
		return meetingSummary;
	}

	public void setMeetingSummary(MeetingSummary meetingSummary) {
		this.meetingSummary = meetingSummary;
	}
	
}
	
