package com.action.user;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.service.intface.user.UserService;

public class ResfunshowAction extends ActionSupport {

	private UserService userService;
	private List message;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		List l=new ArrayList();
		l=userService.getResfunAll();
		setMessage(l);
		return SUCCESS;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public List getMessage() {
		return message;
	}
	public void setMessage(List message) {
		this.message = message;
	}

}
