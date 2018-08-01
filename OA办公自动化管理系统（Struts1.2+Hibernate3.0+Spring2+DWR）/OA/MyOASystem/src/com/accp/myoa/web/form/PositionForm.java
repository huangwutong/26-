
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Position;


public class PositionForm extends ActionForm {
	private Position position;
	
	public PositionForm(){
		position=new Position();
	}

	public Position getPosition() {
		return position;
	}

	public void setPosition(Position position) {
		this.position = position;
	}
	
}
	
