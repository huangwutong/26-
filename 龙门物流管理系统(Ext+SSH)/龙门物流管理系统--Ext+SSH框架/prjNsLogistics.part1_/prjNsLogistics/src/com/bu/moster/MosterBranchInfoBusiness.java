package com.bu.moster;

import java.util.*;
import com.service.*;
import com.struts.form.*;
import com.po.*;

public class MosterBranchInfoBusiness implements MosterBusiness {

	private DAOService ds;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector vcbi = new Vector();
		List ls = ds.getBranchinfodao().findAll();
		for (Object object : ls) {
			BranchInfo bi = (BranchInfo) object;
			MosterBranchInfoForm mobif = new MosterBranchInfoForm();
			mobif.setBranchID(bi.getBranchId().toString());
			mobif.setBranchName(bi.getBranchName());
			vcbi.add(mobif);
		}
		return vcbi;
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

	public DAOService getDs() {
		return ds;
	}

	public void setDs(DAOService ds) {
		this.ds = ds;
	}

}
