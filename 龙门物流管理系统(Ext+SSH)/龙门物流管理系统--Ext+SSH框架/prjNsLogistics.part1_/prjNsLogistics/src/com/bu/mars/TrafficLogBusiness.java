package com.bu.mars;

import java.util.List;
import java.util.Vector;
import com.po.*;
import com.service.DAOService;
import com.struts.form.MarsAfficheInfoForm;
import com.struts.form.MarsTrafficLogForm;
public class TrafficLogBusiness implements ibusiness {
	private DAOService daos;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector trafficvc=new Vector();
		List ls=daos.getTrafficlogdao().findAll();
		for (Object object : ls) {
			TrafficLog trafficl=(TrafficLog)object;
			MarsTrafficLogForm trafficf=new MarsTrafficLogForm();
			trafficf.setTrafficlogid(trafficl.getTrafficLogId().toString());
			trafficf.setBillid(trafficl.getBillInfo().getBillId().toString());
			trafficf.setTlid(trafficl.getTruckLog().getTlid().toString());
			trafficf.setTruckid(trafficl.getTruckLog().getTruckInfo().getTruckId().toString());
			trafficf.setBranchid(trafficl.getBranchInfo().getBranchId().toString());
			trafficf.setBranchname(trafficl.getBranchInfo().getBranchName());
			trafficvc.add(trafficf);
		}
			return trafficvc;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		TrafficLog trafficl=daos.getTrafficlogdao().findById(new Integer(id));
		MarsTrafficLogForm trafficf=new MarsTrafficLogForm();
		trafficf.setTrafficlogid(trafficl.getTrafficLogId().toString());
		trafficf.setBillid(trafficl.getBillInfo().getBillId().toString());
		trafficf.setTlid(trafficl.getTruckLog().getTlid().toString());
		trafficf.setTruckid(trafficl.getTruckLog().getTruckInfo().getTruckId().toString());
		trafficf.setBranchid(trafficl.getBranchInfo().getBranchId().toString());
		trafficf.setBranchname(trafficl.getBranchInfo().getBranchName());
		return trafficf;
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
