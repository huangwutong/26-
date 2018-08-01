
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.ReadState;


public class ReadStateForm extends ActionForm {
	private ReadState readState;
	
	public ReadStateForm(){
		readState=new ReadState();
	}

	public ReadState getReadState() {
		return readState;
	}

	public void setReadState(ReadState readState) {
		this.readState = readState;
	}
	
}
	
