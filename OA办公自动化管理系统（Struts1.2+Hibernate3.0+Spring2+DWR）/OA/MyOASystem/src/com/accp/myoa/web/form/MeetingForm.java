
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Meeting;


public class MeetingForm extends ActionForm {
	private Meeting meeting;
	
	public MeetingForm(){
		meeting=new Meeting();
	}

	public Meeting getMeeting() {
		return meeting;
	}

	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
	}
	
}
	
