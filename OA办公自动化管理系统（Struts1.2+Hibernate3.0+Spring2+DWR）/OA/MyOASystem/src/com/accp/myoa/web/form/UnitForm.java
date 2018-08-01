
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Unit;


public class UnitForm extends ActionForm {
	private Unit unit;
	
	public UnitForm(){
		unit=new Unit();
	}

	public Unit getUnit() {
		return unit;
	}

	public void setUnit(Unit unit) {
		this.unit = unit;
	}
	
}
	
