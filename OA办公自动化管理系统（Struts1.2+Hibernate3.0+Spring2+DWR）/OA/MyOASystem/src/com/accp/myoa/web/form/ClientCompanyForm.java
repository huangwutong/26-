
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.ClientCompany;


public class ClientCompanyForm extends ActionForm {
	private ClientCompany clientCompany;
	
	public ClientCompanyForm(){
		clientCompany=new ClientCompany();
	}

	public ClientCompany getClientCompany() {
		return clientCompany;
	}

	public void setClientCompany(ClientCompany clientCompany) {
		this.clientCompany = clientCompany;
	}
	
}
	
