
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.MeetingRead;


public class MeetingReadForm extends ActionForm {
	private MeetingRead meetingRead;
	
	public MeetingReadForm(){
		meetingRead=new MeetingRead();
	}

	public MeetingRead getMeetingRead() {
		return meetingRead;
	}

	public void setMeetingRead(MeetingRead meetingRead) {
		this.meetingRead = meetingRead;
	}
	
}
	
