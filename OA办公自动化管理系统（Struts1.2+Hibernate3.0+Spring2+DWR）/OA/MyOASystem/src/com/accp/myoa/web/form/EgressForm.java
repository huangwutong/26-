
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Egress;


public class EgressForm extends ActionForm {
	private Egress egress;
	
	public EgressForm(){
		egress=new Egress();
	}

	public Egress getEgress() {
		return egress;
	}

	public void setEgress(Egress egress) {
		this.egress = egress;
	}
	
}
	
