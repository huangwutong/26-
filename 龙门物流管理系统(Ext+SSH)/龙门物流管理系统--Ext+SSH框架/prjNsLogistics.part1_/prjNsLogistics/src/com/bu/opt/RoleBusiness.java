package com.bu.opt;

import java.util.List;
import java.util.Vector;

import com.po.RoleInfo;
import com.service.DAOService;
import com.struts.form.OptRoleInfoForm;

public class RoleBusiness implements IBusiness {

	//声明一个私有的DAOService
	private DAOService daos;
	
	public boolean delete(String pkid) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector rolevc = new Vector();
		List li = daos.getRoleinfodao().findAll();
		
		for (Object object : li) {
			RoleInfo rf = (RoleInfo) object;
			OptRoleInfoForm rform=new OptRoleInfoForm();
			rform.setRoleid(rf.getRoleId().toString());
			rform.setRolename(rf.getRoleName());
			rform.setRoleclient(rf.getRoleClient().toString());
			rform.setRoleticket(rf.getRoleTicket().toString());
			rform.setRolebranch(rf.getRoleBranch().toString());
			rform.setRoletraffic(rf.getRoleTraffic().toString());
			rform.setRolequery(rf.getRoleQuery().toString());
			rform.setRolebasicinfo(rf.getRoleBasicInfo().toString());
			rolevc.add(rform);
		}
		
		return rolevc;
	}

	public Object findByID(String pkid) {
		// TODO Auto-generated method stub
		OptRoleInfoForm rform=new OptRoleInfoForm();
		RoleInfo rf=daos.getRoleinfodao().findById(new Integer(pkid));
		rform.setRoleid(rf.getRoleId().toString());
		rform.setRolename(rf.getRoleName());
		rform.setRoleclient(rf.getRoleClient().toString());
		rform.setRoleticket(rf.getRoleTicket().toString());
		rform.setRolebranch(rf.getRoleBranch().toString());
		rform.setRoletraffic(rf.getRoleTraffic().toString());
		rform.setRolequery(rf.getRoleQuery().toString());
		rform.setRolebasicinfo(rf.getRoleBasicInfo().toString());
		return rform;
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
