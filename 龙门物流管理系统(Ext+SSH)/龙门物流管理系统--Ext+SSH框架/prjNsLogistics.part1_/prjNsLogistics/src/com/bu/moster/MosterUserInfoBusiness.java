package com.bu.moster;

import java.util.*;

import com.service.*;
import com.po.*;
import com.struts.form.*;

public class MosterUserInfoBusiness implements MosterBusiness {
	
	private DAOService ds; 
	public boolean delete(String id) {
		// TODO Auto-generated method stub	
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector vcus = new Vector();
		List ls = ds.getUserinfodao().findAll();
		for (Object object : ls) {
			UserInfo us = (UserInfo) object;
			MosterUserInfoForm mousf = new MosterUserInfoForm();
			mousf.setUserID(us.getUserId().toString());
			mousf.setUserName(us.getUserName());
			vcus.add(mousf);
				
		}
		return vcus;
		
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		UserInfo us = ds.getUserinfodao().findById(new Integer(id));
		MosterUserInfoForm mousf = new MosterUserInfoForm();
		mousf.setUserID(us.getUserId().toString());
		mousf.setUserName(us.getUserName());
		return mousf;
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
