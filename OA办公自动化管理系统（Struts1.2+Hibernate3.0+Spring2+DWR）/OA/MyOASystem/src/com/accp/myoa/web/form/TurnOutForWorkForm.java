
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.TurnOutForWork;


public class TurnOutForWorkForm extends ActionForm {
	private TurnOutForWork turnOutForWork;
	
	public TurnOutForWorkForm(){
		turnOutForWork=new TurnOutForWork();
	}

	public TurnOutForWork getTurnOutForWork() {
		return turnOutForWork;
	}

	public void setTurnOutForWork(TurnOutForWork turnOutForWork) {
		this.turnOutForWork = turnOutForWork;
	}
	
}
	
