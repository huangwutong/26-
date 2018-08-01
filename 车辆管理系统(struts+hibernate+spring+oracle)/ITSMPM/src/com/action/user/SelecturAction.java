package com.action.user;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class SelecturAction extends ActionSupport {

	private UserService userService;
	private List userselect;
	private List roleselect;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		roleselect=userService.getRoleAll();
		userselect=userService.getUserAll();
		return SUCCESS;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public List getUserselect() {
		return userselect;
	}
	public void setUserselect(List userselect) {
		this.userselect = userselect;
	}
	public List getRoleselect() {
		return roleselect;
	}
	public void setRoleselect(List roleselect) {
		this.roleselect = roleselect;
	}

}
