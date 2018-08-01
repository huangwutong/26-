
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.ComleteDegress;


public class ComleteDegressForm extends ActionForm {
	private ComleteDegress comleteDegress;
	
	public ComleteDegressForm(){
		comleteDegress=new ComleteDegress();
	}

	public ComleteDegress getComleteDegress() {
		return comleteDegress;
	}

	public void setComleteDegress(ComleteDegress comleteDegress) {
		this.comleteDegress = comleteDegress;
	}
	
}
	
