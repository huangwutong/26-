
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.CarApply;


public class CarApplyForm extends ActionForm {
	private CarApply carApply;
	
	public CarApplyForm(){
		carApply=new CarApply();
	}

	public CarApply getCarApply() {
		return carApply;
	}

	public void setCarApply(CarApply carApply) {
		this.carApply = carApply;
	}
	
}
	
