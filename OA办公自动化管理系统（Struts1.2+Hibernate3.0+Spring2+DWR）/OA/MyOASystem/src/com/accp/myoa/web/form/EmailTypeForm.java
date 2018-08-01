
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.EmailType;


public class EmailTypeForm extends ActionForm {
	private EmailType emailType;
	
	public EmailTypeForm(){
		emailType=new EmailType();
	}

	public EmailType getEmailType() {
		return emailType;
	}

	public void setEmailType(EmailType emailType) {
		this.emailType = emailType;
	}
	
}
	
