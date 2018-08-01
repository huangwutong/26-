
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Dept;


public class DeptForm extends ActionForm {
	private Dept dept;
	
	public DeptForm(){
		dept=new Dept();
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}
	
}
	
