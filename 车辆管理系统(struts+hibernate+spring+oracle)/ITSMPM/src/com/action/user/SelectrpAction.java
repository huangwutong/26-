package com.action.user;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class SelectrpAction extends ActionSupport {

	private UserService userService;
	private List compsselect;
	private List roleselect;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		roleselect=userService.getRoleAll();
		compsselect=userService.getCompsAll();
		return SUCCESS;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	} 
	public List getRoleselect() {
		return roleselect;
	}
	public void setRoleselect(List roleselect) {
		this.roleselect = roleselect;
	}
	public List getCompsselect() {
		return compsselect;
	}
	public void setCompsselect(List compsselect) {
		this.compsselect = compsselect;
	}
   
}
