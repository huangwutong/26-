
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Message;


public class MessageForm extends ActionForm {
	private Message message;
	
	public MessageForm(){
		message=new Message();
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}
	
}
	
