package com.bu.moster;

import java.util.*;

import com.service.*;
import com.struts.form.*;
import com.po.*;

public class MosterCargoVectorBusiness implements MosterBusiness {

	private DAOService ds;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		List ls = ds.getCargovectordao().findAll();
		Vector vccv = new Vector();
		for (Object object : ls) {
			CargoVector cv = (CargoVector) object;
			//创建货物集合对象
			MosterCargoVectorForm mocvf = new MosterCargoVectorForm();
			mocvf.setCvID(cv.getCvid().toString());		
			mocvf.setCargoID(cv.getCargoInfo().getCargoId().toString());
			mocvf.setBillID(cv.getBillInfo().getBillId().toString());
			mocvf.setCargoName(cv.getCargoInfo().getCargoName());
			vccv.add(mocvf);
					
		}
		
		return vccv;
	}
	
	/**
	 * 查询指定公司的货物集合
	 * @param int 公司编号
	 * */
	public Vector findByBranchID(int branchID){
		List ls = ds.getCargovectordao().findAll();
		Vector vccv = new Vector();
		
		for (Object object : ls) {
			CargoVector ci = (CargoVector) object;
			//创建货物信息表对象
			MosterCargoVectorForm mocvf = new MosterCargoVectorForm();
			BillInfo bf = ci.getBillInfo();
			
			if(bf.getBranchInfoBySendBranchId().getBranchId()!=branchID){		
				continue;
			}
			mocvf.setCvID(ci.getCvid().toString());
			mocvf.setCargoID(ci.getCargoInfo().getCargoId().toString());
			mocvf.setCargoName(ci.getCargoInfo().getCargoName());
			mocvf.setBillID(ci.getBillInfo().getBillId().toString());
			vccv.add(mocvf);
			
		}
		return vccv;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		CargoVector cv = ds.getCargovectordao().findById(new Integer(id));
		//创建货物集合对象
		MosterCargoVectorForm mocvf = new MosterCargoVectorForm();
		mocvf.setCvID(cv.getCvid().toString());
		mocvf.setCargoID(cv.getCargoInfo().getCargoId().toString());
		mocvf.setBillID(cv.getBillInfo().getBillId().toString());
		mocvf.setCargoName(cv.getCargoInfo().getCargoName());
		return mocvf;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		MosterCargoVectorForm mocvf = (MosterCargoVectorForm) ob;
		CargoVector cv = new CargoVector();
		//获取货物信息对象，设置货物信息
		CargoInfo ci = ds.getCargoinfodao().findById(new Integer(mocvf.getCargoID()));	
		cv.setCargoInfo(ci);
		//获取货票对象，设置货票信息
		BillInfo bi = ds.getBillinfodao().findById(new Integer(mocvf.getBillID()));	
		cv.setBillInfo(bi);
		try {
			ds.getCargovectordao().save(cv);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		MosterCargoVectorForm mocvf = (MosterCargoVectorForm) ob;
		CargoVector cv = ds.getCargovectordao().findById(new Integer(mocvf.getCvID()));
		//获取货物信息对象，设置货物信息
		
		CargoInfo ci = ds.getCargoinfodao().findById(new Integer(mocvf.getCargoID()));	
		cv.setCargoInfo(ci);
		//获取货票对象，设置货票信息
		BillInfo bi = ds.getBillinfodao().findById(new Integer(mocvf.getBillID()));	
		cv.setBillInfo(bi);
		
		try {
			ds.getCargovectordao().attachDirty(cv);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	

	public DAOService getDs() {
		return ds;
	}

	public void setDs(DAOService ds) {
		this.ds = ds;
	}

}
