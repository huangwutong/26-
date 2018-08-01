
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.EgressExamine;


public class EgressExamineForm extends ActionForm {
	private EgressExamine egressExamine;
	
	public EgressExamineForm(){
		egressExamine=new EgressExamine();
	}

	public EgressExamine getEgressExamine() {
		return egressExamine;
	}

	public void setEgressExamine(EgressExamine egressExamine) {
		this.egressExamine = egressExamine;
	}
	
}
	
