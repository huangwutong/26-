
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Scratchpad;


public class ScratchpadForm extends ActionForm {
	private Scratchpad scratchpad;
	
	public ScratchpadForm(){
		scratchpad=new Scratchpad();
	}

	public Scratchpad getScratchpad() {
		return scratchpad;
	}

	public void setScratchpad(Scratchpad scratchpad) {
		this.scratchpad = scratchpad;
	}
	
}
	
