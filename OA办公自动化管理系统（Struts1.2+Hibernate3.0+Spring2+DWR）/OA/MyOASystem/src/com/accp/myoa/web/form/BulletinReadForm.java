
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.BulletinRead;


public class BulletinReadForm extends ActionForm {
	private BulletinRead bulletinRead;
	
	public BulletinReadForm(){
		bulletinRead=new BulletinRead();
	}

	public BulletinRead getBulletinRead() {
		return bulletinRead;
	}

	public void setBulletinRead(BulletinRead bulletinRead) {
		this.bulletinRead = bulletinRead;
	}
	
}
	
