
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Car;


public class CarForm extends ActionForm {
	private Car car;
	
	public CarForm(){
		car=new Car();
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}
	
}
	
