
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.PositionPopedom;


public class PositionPopedomForm extends ActionForm {
	private PositionPopedom positionPopedom;
	
	public PositionPopedomForm(){
		positionPopedom=new PositionPopedom();
	}

	public PositionPopedom getPositionPopedom() {
		return positionPopedom;
	}

	public void setPositionPopedom(PositionPopedom positionPopedom) {
		this.positionPopedom = positionPopedom;
	}
	
}
	
