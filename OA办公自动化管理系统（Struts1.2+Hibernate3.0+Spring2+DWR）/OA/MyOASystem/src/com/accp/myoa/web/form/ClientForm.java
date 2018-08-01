
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Client;


public class ClientForm extends ActionForm {
	private Client client;
	
	public ClientForm(){
		client=new Client();
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}
	
}
	
