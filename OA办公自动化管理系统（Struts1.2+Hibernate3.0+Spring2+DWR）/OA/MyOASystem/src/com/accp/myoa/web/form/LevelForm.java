
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Level;


public class LevelForm extends ActionForm {
	private Level level;
	
	public LevelForm(){
		level=new Level();
	}

	public Level getLevel() {
		return level;
	}

	public void setLevel(Level level) {
		this.level = level;
	}
	
}
	
