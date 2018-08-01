package com.accp.myoa.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.accp.myoa.entity.Dept;
import com.accp.myoa.entity.DeptPosition;
import com.accp.myoa.entity.User;
import com.accp.myoa.entity.UserState;
import com.accp.myoa.service.DeptPositionService;
import com.accp.myoa.service.DeptService;
import com.accp.myoa.service.PositionService;
import com.accp.myoa.service.UserService;
import com.accp.myoa.web.form.UserForm;

public class UserAction extends DispatchAction {
	private UserService userService;
	private DeptService deptService;
	private PositionService positionService;
	private DeptPositionService deptPositionService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public ActionForward toIndividualInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		User newuser = userService.get(user.getUserId());
		// System.out.println(newuser.getPassword());
		session.setAttribute("user", newuser);

		return mapping.findForward("individualInfo");
	}

	public ActionForward toUserFileManage(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		List<Dept> depts = deptService.loadList(null);
		request.setAttribute("depts", depts);
		return mapping.findForward("addUser");
	}

	public ActionForward doAdd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("jkjljjjj");
		int deptId=Integer.parseInt(request.getParameter("dept"));
		int positionId = Integer.parseInt(request.getParameter("position"));
		UserForm userForm = (UserForm) form;
		User user = userForm.getUser();
		user.setPassword("123");
		DeptPosition deptPosition = deptPositionService.getDeptPosition(deptId, positionId);
		UserState userState = new UserState();
		userState.setUserStateId(1);
		user.setUserState(userState);
		user.setDeptPosition(deptPosition);
		userService.add(user);
		return mapping.findForward("addUser");
	}

	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}

	public void setPositionService(PositionService positionService) {
		this.positionService = positionService;
	}

	public void setDeptPositionService(DeptPositionService deptPositionService) {
		this.deptPositionService = deptPositionService;
	}

}
