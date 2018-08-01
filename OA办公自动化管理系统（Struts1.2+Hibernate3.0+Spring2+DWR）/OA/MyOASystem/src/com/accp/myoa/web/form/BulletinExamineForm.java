
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.BulletinExamine;


public class BulletinExamineForm extends ActionForm {
	private BulletinExamine bulletinExamine;
	
	public BulletinExamineForm(){
		bulletinExamine=new BulletinExamine();
	}

	public BulletinExamine getBulletinExamine() {
		return bulletinExamine;
	}

	public void setBulletinExamine(BulletinExamine bulletinExamine) {
		this.bulletinExamine = bulletinExamine;
	}
	
}
	
