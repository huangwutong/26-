
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.EmailReceivce;


public class EmailReceivceForm extends ActionForm {
	private EmailReceivce emailReceivce;
	
	public EmailReceivceForm(){
		emailReceivce=new EmailReceivce();
	}

	public EmailReceivce getEmailReceivce() {
		return emailReceivce;
	}

	public void setEmailReceivce(EmailReceivce emailReceivce) {
		this.emailReceivce = emailReceivce;
	}
	
}
	
