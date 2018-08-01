
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Meetingstate;


public class MeetingstateForm extends ActionForm {
	private Meetingstate meetingstate;
	
	public MeetingstateForm(){
		meetingstate=new Meetingstate();
	}

	public Meetingstate getMeetingstate() {
		return meetingstate;
	}

	public void setMeetingstate(Meetingstate meetingstate) {
		this.meetingstate = meetingstate;
	}
	
}
	
