
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.MessageReceive;


public class MessageReceiveForm extends ActionForm {
	private MessageReceive messageReceive;
	
	public MessageReceiveForm(){
		messageReceive=new MessageReceive();
	}

	public MessageReceive getMessageReceive() {
		return messageReceive;
	}

	public void setMessageReceive(MessageReceive messageReceive) {
		this.messageReceive = messageReceive;
	}
	
}
	
