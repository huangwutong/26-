
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.MeetingSummaryScan;


public class MeetingSummaryScanForm extends ActionForm {
	private MeetingSummaryScan meetingSummaryScan;
	
	public MeetingSummaryScanForm(){
		meetingSummaryScan=new MeetingSummaryScan();
	}

	public MeetingSummaryScan getMeetingSummaryScan() {
		return meetingSummaryScan;
	}

	public void setMeetingSummaryScan(MeetingSummaryScan meetingSummaryScan) {
		this.meetingSummaryScan = meetingSummaryScan;
	}
	
}
	
