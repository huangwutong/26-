package com.accp.myoa.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.LeaveWord;
import com.accp.myoa.entity.User;
import com.accp.myoa.service.LeaveWordService;
import com.accp.myoa.service.UserService;

public class LeaveWordAction extends DispatchAction {
	private LeaveWordService leaveWordService;
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setLeaveWordService(LeaveWordService leaveWordService) {
		this.leaveWordService = leaveWordService;
	}

	public ActionForward toLeaveWord(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		String id = request.getParameter("id");
		if (id != null) {
			LeaveWord leaveWord = leaveWordService.load(Integer.parseInt(id));
			request.setAttribute("leaveWordInfo", leaveWord);
		} else {
			forward = mapping.findForward("history");
			List<LeaveWord> leaveWords = leaveWordService.loadList(null);
			request.setAttribute("leaveWords", leaveWords);
			forward = mapping.findForward("leaveWord");
		}
		return forward;
	}

	public ActionForward doLeaveWordByUserId(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		 String userId = request.getParameter("userId");
		 if(userId==null){
			 List<User> users = userService.loadList(null);
			 request.setAttribute("users", users);
			 List<LeaveWord> leaveWordsHistory = leaveWordService.loadList(null);
			 request.setAttribute("leaveWordsHistory", leaveWordsHistory);
		 }else{
			 LeaveWord leaveWord = new LeaveWord();
			 leaveWord.setUser(userService.load(Integer.parseInt(userId)));
			 List<LeaveWord> userLeaveWords = leaveWordService.loadList(leaveWord);
			 request.setAttribute("userLeaveWords", userLeaveWords);
		 }
		return mapping.findForward("history");
	}

}
