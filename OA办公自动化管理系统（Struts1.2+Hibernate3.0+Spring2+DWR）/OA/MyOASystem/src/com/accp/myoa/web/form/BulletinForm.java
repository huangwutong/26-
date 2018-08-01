
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Bulletin;


public class BulletinForm extends ActionForm {
	private Bulletin bulletin;
	
	public BulletinForm(){
		bulletin=new Bulletin();
	}

	public Bulletin getBulletin() {
		return bulletin;
	}

	public void setBulletin(Bulletin bulletin) {
		this.bulletin = bulletin;
	}
	
}
	
