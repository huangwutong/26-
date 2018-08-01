
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Menu;


public class MenuForm extends ActionForm {
	private Menu menu;
	
	public MenuForm(){
		menu=new Menu();
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	
}
	
