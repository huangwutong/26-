
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.UserState;


public class UserStateForm extends ActionForm {
	private UserState userState;
	
	public UserStateForm(){
		userState=new UserState();
	}

	public UserState getUserState() {
		return userState;
	}

	public void setUserState(UserState userState) {
		this.userState = userState;
	}
	
}
	
