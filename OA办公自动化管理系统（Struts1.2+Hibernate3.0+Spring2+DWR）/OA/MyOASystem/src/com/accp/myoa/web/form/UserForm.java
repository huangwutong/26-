
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.User;


public class UserForm extends ActionForm {
	private User user;
	
	public UserForm(){
		user=new User();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
	
