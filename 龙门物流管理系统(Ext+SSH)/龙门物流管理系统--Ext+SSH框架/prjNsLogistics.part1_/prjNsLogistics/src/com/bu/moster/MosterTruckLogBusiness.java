package com.bu.moster;

import java.util.*;
import com.service.*;
import com.struts.form.*;
import com.po.*;

public class MosterTruckLogBusiness implements MosterBusiness {

	private DAOService ds;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		List ls = ds.getTrucklogdao().findAll();
		Vector vc = new Vector();
		for (Object object : ls) {
			TruckLog tl = (TruckLog) object;
			MosterTruckLogForm  motrf = new MosterTruckLogForm();
			motrf.setTLID(tl.getTlid().toString());
			motrf.setDriverID(tl.getDriverInfo().getDriverId().toString());
			motrf.setTruckID(tl.getTruckInfo().getTruckId().toString());
			motrf.setTLStartData(tl.getTlstartData());
			motrf.setTLArrive(tl.getTlarrive());
			motrf.setBranchID(tl.getBranchInfo().getBranchId().toString());
			vc.add(motrf);
		}
		return vc;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		TruckLog tl = ds.getTrucklogdao().findById(new Integer(id));
		//创建车次信息对象
		MosterTruckLogForm motrf = new MosterTruckLogForm();
		motrf.setTLID(tl.getTlid().toString());
		motrf.setDriverID(tl.getDriverInfo().getDriverId().toString());
		motrf.setTruckID(tl.getTruckInfo().getTruckId().toString());
		motrf.setTLStartData(tl.getTlstartData());
		motrf.setTLArrive(tl.getTlarrive());
		motrf.setBranchID(tl.getBranchInfo().getBranchId().toString());
		
		return motrf;
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
