
package com.accp.myoa.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.service.MeetingSummaryScanService;


public class MeetingSummaryScanAction extends DispatchAction {
	private MeetingSummaryScanService meetingSummaryScanService;
		
	public void setMeetingSummaryScanService(MeetingSummaryScanService meetingSummaryScanService) {
		this.meetingSummaryScanService = meetingSummaryScanService;
	}

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		return null;
	}
}
	
