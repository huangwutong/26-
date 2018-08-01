package com.bu.opt;

import java.util.Vector;

import com.po.TrafficLog;
import com.service.DAOService;
import com.struts.form.OptTrafficLogForm;

public class TrafficLogBusiness implements IBusiness {

	//声明私有的DAOService
	private DAOService daos;
	
	public boolean delete(String pkid) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Object findByID(String pkid) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		OptTrafficLogForm tlf = (OptTrafficLogForm) ob;
		TrafficLog tl = new TrafficLog();
		
		//将ActionForm中的值封装到持久化类中
		tl.setBillInfo(daos.getBillinfodao().findById(new Integer(tlf.getBillid())));
		tl.setBranchInfo(daos.getBranchinfodao().findById(new Integer(tlf.getBranchid())));
		tl.setTruckLog(daos.getTrucklogdao().findById(new Integer(tlf.getTlid())));
		
		try {
			daos.getTrafficlogdao().save(tl);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
