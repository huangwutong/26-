package com.bu.opt;

import java.util.Vector;

import com.po.BranchInfo;
import com.po.TruckLog;
import com.service.*;
import com.struts.form.OptTruckLogForm;

public class TruckLogBusiness implements IBusiness {

	//声明私有的DAOService
	private DAOService daos;
	
	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}

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
		OptTruckLogForm tlf = (OptTruckLogForm) ob;
		TruckLog tl = new TruckLog();

		//将ActionForm中的数据转换到持久化类中
		tl.setDriverInfo(daos.getDriverinfodao().findById(new Integer(tlf.getDriverid())));
		tl.setTruckInfo(daos.getTruckinfodao().findById(new Integer(tlf.getTruckid())));
		tl.setBranchInfo(daos.getBranchinfodao().findById(new Integer(tlf.getBranchid())));
		tl.setTlstartData(tlf.getTlstartdata());
		tl.setTlarrive(tlf.getTlarrive());
		
		//执行增加操作
		try {
			daos.getTrucklogdao().save(tl);
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
	
	/**
	 * 根据分公司编号查询返回最新一条车次表主键
	 * */
	public String findLastTlID(String branchid)
	{
		BranchInfo bi = daos.getBranchinfodao().findById(new Integer(branchid));
		return daos.getTrucklogdao().findLastTlID(bi);
	}

}
