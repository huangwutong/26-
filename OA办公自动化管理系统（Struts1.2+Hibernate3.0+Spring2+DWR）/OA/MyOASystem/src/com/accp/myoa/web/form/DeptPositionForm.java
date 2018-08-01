
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.DeptPosition;


public class DeptPositionForm extends ActionForm {
	private DeptPosition deptPosition;
	
	public DeptPositionForm(){
		deptPosition=new DeptPosition();
	}

	public DeptPosition getDeptPosition() {
		return deptPosition;
	}

	public void setDeptPosition(DeptPosition deptPosition) {
		this.deptPosition = deptPosition;
	}
	
}
	
