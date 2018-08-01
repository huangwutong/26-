
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.MessageType;


public class MessageTypeForm extends ActionForm {
	private MessageType messageType;
	
	public MessageTypeForm(){
		messageType=new MessageType();
	}

	public MessageType getMessageType() {
		return messageType;
	}

	public void setMessageType(MessageType messageType) {
		this.messageType = messageType;
	}
	
}
	
