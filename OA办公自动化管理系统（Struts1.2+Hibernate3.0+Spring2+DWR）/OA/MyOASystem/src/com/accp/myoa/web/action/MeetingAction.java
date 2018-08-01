
package com.accp.myoa.web.action;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.BoardRoom;
import com.accp.myoa.entity.DeptPosition;
import com.accp.myoa.entity.ExamineState;
import com.accp.myoa.entity.Meeting;
import com.accp.myoa.entity.MeetingRead;
import com.accp.myoa.entity.Meetingstate;
import com.accp.myoa.entity.ReadState;
import com.accp.myoa.entity.User;
import com.accp.myoa.entity.UserState;
import com.accp.myoa.service.BoardRoomService;
import com.accp.myoa.service.MeetingService;
import com.accp.myoa.service.UserService;
import com.accp.myoa.web.form.MeetingForm;


public class MeetingAction extends DispatchAction {
	private MeetingService meetingService;
	private UserService userService;
	private BoardRoomService boardRoomService;
		
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setBoardRoomService(BoardRoomService boardRoomService) {
		this.boardRoomService = boardRoomService;
	}

	public void setMeetingService(MeetingService meetingService) {
		this.meetingService = meetingService;
	}

	//会议管理
	public ActionForward toMeetManage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		int pageNum=1;
		if (request.getParameter("pageNum")!=null) {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		List<Meeting> meetings=meetingService.findByPage(pageNum,5);//显示5行数据
		request.setAttribute("meetings", meetings);
		int maxPage=meetingService.getCount()%5==0?meetingService.getCount()/5:meetingService.getCount()/5+1;
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("pageNum", pageNum);
		return mapping.findForward("toMeetManage");
	}
	//会议申请
	public ActionForward toMeetAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		User user=new User();
		DeptPosition dp=new DeptPosition();
		dp.setDeptPositionId(12);
		user.setDeptPosition(dp);
		UserState us=new UserState();
		us.setUserStateId(1);
		user.setUserState(us);
		List<User> users=userService.loadList(user);
		request.setAttribute("users", users);
		List<BoardRoom> boardRooms=boardRoomService.loadList(null);
		request.setAttribute("boardRooms", boardRooms);
		return mapping.findForward("toMeetAdd");
	}
	//会议查询
	public ActionForward toMeetQuery(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		return mapping.findForward("toMeetQuery");
	}
	//跳转倒编辑
	public ActionForward toMeetEdit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		return mapping.findForward("toMeetEdit");
	}
	//会议开始
	public ActionForward doBegin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int mid=Integer.parseInt(request.getParameter("mid"));
		Meeting meeting=meetingService.load(mid);	
		Meetingstate ms=new Meetingstate();
		ms.setMeetingStateId(2);
		meeting.setMeetingstate(ms);
		meetingService.update(meeting);
		response.sendRedirect("meeting.do?operate=toMeetManage&pageNum="+pageNum);
		return null;
	}
	//会议结束
	public ActionForward doEnd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int mid=Integer.parseInt(request.getParameter("mid"));
		Meeting meeting=meetingService.load(mid);	
		Meetingstate ms=new Meetingstate();
		ms.setMeetingStateId(3);
		meeting.setMeetingstate(ms);
		meetingService.update(meeting);
		response.sendRedirect("meeting.do?operate=toMeetManage&pageNum="+pageNum);
		return null;
	}
	//会议删除
	public ActionForward doDel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int mid=Integer.parseInt(request.getParameter("mid"));
		meetingService.del(mid);
		response.sendRedirect("meeting.do?operate=toMeetManage&pageNum="+pageNum);
		return null;
	}
	//会议申请添加
	public ActionForward doMeetAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ids=request.getParameter("ids");
		MeetingForm mf=(MeetingForm)form;
		Meeting meeting=mf.getMeeting();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		meeting.setMeetingTime(sdf.format(new Date()));
		System.out.println("人员:"+ids);
		Set<MeetingRead> reads =new HashSet<MeetingRead>();
		String[] array=ids.split(";");
		for (int i = 0; i < array.length; i++) {
			System.out.println(array[i]);
			MeetingRead mr=new MeetingRead();
			User user=new User();
			user.setUserId(Integer.parseInt(array[i]));
			mr.setUser(user);
			ReadState rs=new ReadState();
			rs.setReadStateId(1);
			mr.setReadState(rs);
			reads.add(mr);
		}
		meeting.setMeetingReads(reads);
		meetingService.add(meeting);		
		request.setAttribute("msg", "添加成功！");
		request.getRequestDispatcher("meeting.do?operate=toMeetAdd").forward(request, response);
		return null;
	}
	//会议审批
	public ActionForward doExamine(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int mid=Integer.parseInt(request.getParameter("mid"));
		int esid=Integer.parseInt(request.getParameter("esid"));
		Meeting meeting=meetingService.load(mid);
		ExamineState es=new ExamineState();
		es.setExamineStateId(2);
		meeting.setExamineState(es);		
		meetingService.update(meeting);
		response.sendRedirect("meeting.do?operate=toMeetManage&pageNum="+pageNum);
		return null;
	}
	
	public ActionForward showDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		int mid=Integer.parseInt(request.getParameter("mid"));		
		Meeting meeting=meetingService.load(mid);
		request.setAttribute("meeting", meeting);
		meetingService.update(meeting);
		
		request.setAttribute("meetingReads", meeting.getMeetingReads());
		return mapping.findForward("showDetail");
	}
}
	
