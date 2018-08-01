package com.bu.carmack;

import java.util.List;
import java.util.Vector;

import com.po.*;
import com.service.DAOService;
import com.struts.form.*;

public class SystemLogBusiness implements IBusiness {
	
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
		// TODO Auto-generated method stub
		Vector vcSystemLog=new Vector();
		List ls=daos.getSystemlogdao().findAll();
		
		for (Object object : ls) {
			SystemLog sl=(SystemLog) object;
			CarmackSystemLogForm csf=new CarmackSystemLogForm();
			csf.setSystemLogID(sl.getSystemLogId().toString());
			csf.setUserID(sl.getUserInfo().getUserId().toString());
			csf.setSystemLogMemo(sl.getSystemLogMemo());
			csf.setBranchID(sl.getBranchInfo().getBranchId().toString());
			
			
			vcSystemLog.add(csf);
			
		}
		return vcSystemLog;
	}
	/**
	 * 查询指定公司的所有员工
	 * @param int 公司编号
	 * @return List 员工集合
	 * */
	public Vector findByBranchID(int branchID){
		Vector vcSystemLog=new Vector();
		List ls=daos.getSystemlogdao().findByBranchID(branchID);
		for(Object object:ls)
		{
			SystemLog sl=(SystemLog) object;
			CarmackSystemLogForm cslf=new CarmackSystemLogForm();
			cslf.setSystemLogID(sl.getSystemLogId().toString());
			cslf.setUserID(sl.getUserInfo().getUserId().toString());
			cslf.setSystemLogMemo(sl.getSystemLogMemo());
			
			vcSystemLog.add(cslf);
		}
		return vcSystemLog;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		SystemLog ctf=daos.getSystemlogdao().findById(new Integer(id));
		CarmackSystemLogForm ef=new CarmackSystemLogForm();
		ef.setSystemLogID(ctf.getSystemLogId().toString());
		ef.setUserID(ctf.getUserInfo().getUserId().toString());
		ef.setSystemLogMemo(ctf.getSystemLogMemo());
		ef.setBranchID(ctf.getBranchInfo().getBranchId().toString());
		
		return ef;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

}
