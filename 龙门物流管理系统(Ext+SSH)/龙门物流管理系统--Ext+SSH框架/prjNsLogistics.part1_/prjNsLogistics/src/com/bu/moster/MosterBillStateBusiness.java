package com.bu.moster;

import java.util.*;
import com.service.*;
import com.struts.form.*;
import com.po.*;

public class MosterBillStateBusiness implements MosterBusiness {

	private DAOService ds;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		List ls = ds.getBillstatedao().findAll();
		Vector vcbs = new Vector();
		for (Object object : ls) {
			BillState bs = (BillState)object;
			MosterBillStateForm mobsf = new MosterBillStateForm();
			mobsf.setBillStateID(bs.getBillStateId().toString());
			mobsf.setBillStateName(bs.getBillStateName());
			vcbs.add(mobsf);
		}
		return vcbs;
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
