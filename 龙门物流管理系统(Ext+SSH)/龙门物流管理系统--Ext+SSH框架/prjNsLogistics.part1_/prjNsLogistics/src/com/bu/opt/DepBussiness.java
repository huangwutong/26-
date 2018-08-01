package com.bu.opt;

import java.util.List;
import java.util.Vector;
import com.po.*;
import com.service.DAOService;
import com.struts.form.OptDepartmentInfoForm;

public class DepBussiness implements IBusiness{
	
	//声明一个私有的DAOService
	private DAOService daos;
	
	public boolean delete(String pkid) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		List li = daos.getDepinfodao().findAll();
		Vector depvc=new Vector();
		
		for (Object object : li) {
			DepartmentInfo dep = (DepartmentInfo) object;
			OptDepartmentInfoForm depform = new OptDepartmentInfoForm();
			depform.setDepartmentid(dep.getDepartmentId().toString());
			depform.setDepartmentname(dep.getDepartmentName());
			depvc.add(depform);
		}
		return depvc;
	}

	public Object findByID(String pkid) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}
	
}
