package com.bu.opt;

import java.util.List;
import java.util.Vector;

import com.po.BranchInfo;
import com.service.DAOService;
import com.struts.form.OptBranchInfoForm;

public class BranchBusiness implements IBusiness {

	//声明一个私有的DAOService
	private DAOService daos;
	
	public boolean delete(String pkid) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector branchvc = new Vector();
		List li = daos.getBranchinfodao().findAll();
		
		for (Object object : li) {
			BranchInfo bi=(BranchInfo) object;
			OptBranchInfoForm biform=new OptBranchInfoForm();
			biform.setBranchid(bi.getBranchId().toString());
			biform.setBranchname(bi.getBranchName());
			biform.setBranchlinkman(bi.getBranchLinkMan());
			biform.setBranchaddress(bi.getBranchAddress());
			biform.setBranchphone(bi.getBranchPhone());
			biform.setBranchemail(bi.getBranchEmail());
			branchvc.add(biform);
		}		
		return branchvc;
	}

	public Object findByID(String pkid) {
		// TODO Auto-generated method stub
		BranchInfo bi =daos.getBranchinfodao().findById(new Integer(pkid));
		OptBranchInfoForm biform=new OptBranchInfoForm();
		biform.setBranchid(bi.getBranchId().toString());
		biform.setBranchname(bi.getBranchName());
		biform.setBranchlinkman(bi.getBranchLinkMan());
		biform.setBranchaddress(bi.getBranchAddress());
		biform.setBranchphone(bi.getBranchPhone());
		biform.setBranchemail(bi.getBranchEmail());
		return biform;
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
