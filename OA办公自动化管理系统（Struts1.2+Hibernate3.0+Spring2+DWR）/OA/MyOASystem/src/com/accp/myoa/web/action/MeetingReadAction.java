
package com.accp.myoa.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.Meeting;
import com.accp.myoa.entity.MeetingRead;
import com.accp.myoa.service.MeetingReadService;


public class MeetingReadAction extends DispatchAction {
	private MeetingReadService meetingReadService;
		
	public void setMeetingReadService(MeetingReadService meetingReadService) {
		this.meetingReadService = meetingReadService;
	}

	public ActionForward toMeetingReadAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		return mapping.findForward("toMeetingReadAdd");
	}
	public ActionForward toMeetingRead(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int meetingId=Integer.parseInt(request.getParameter("mid"));
		Meeting meeting=new Meeting();
		meeting.setMeetingId(meetingId);
		MeetingRead meetingRead=new MeetingRead();
		meetingRead.setMeeting(meeting);
		List<MeetingRead> meetingReads=meetingReadService.loadList(meetingRead);
		request.setAttribute("meetingReads", meetingReads);
		return mapping.findForward("toMeetingRead");
	}
	
}
	
