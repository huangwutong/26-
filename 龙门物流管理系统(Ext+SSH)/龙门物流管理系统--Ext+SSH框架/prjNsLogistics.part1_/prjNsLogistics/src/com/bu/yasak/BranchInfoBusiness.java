package com.bu.yasak;

import java.util.List;
import java.util.Vector;

import com.po.BranchInfo;
import com.service.DAOService;
import com.struts.form.Yasak_BranchInfoForm;

public class BranchInfoBusiness implements IBusiness {
	private DAOService daos;
	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}
	
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		List ls = daos.getBranchinfodao().findAll();
		Vector vcbranch = new Vector();
		for (Object object : ls) {
			BranchInfo bran = (BranchInfo) object;
			Yasak_BranchInfoForm ybf = new Yasak_BranchInfoForm();
			ybf.setBranchId(bran.getBranchId().toString());
			ybf.setBranchName(bran.getBranchName());
			vcbranch.add(ybf);
		}
		return vcbranch;
	}

	public Object findById(String id) {
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

	public Vector findByBillAll(String str) {
		// TODO Auto-generated method stub
		return null;
	}

}
