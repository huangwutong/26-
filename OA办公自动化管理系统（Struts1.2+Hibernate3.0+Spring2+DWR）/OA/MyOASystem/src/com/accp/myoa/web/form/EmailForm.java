
package com.accp.myoa.web.form;

import java.util.Date;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Email;


public class EmailForm extends ActionForm {
	private Email email=null;
	private String ids;
	

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public EmailForm() {
		email=new Email();
		email.setEmailDate(new Date());
	}

	public Email getEmail() {
		return email;
	}

	public void setEmail(Email email) {
		this.email = email;
	}
	
	
}
	
