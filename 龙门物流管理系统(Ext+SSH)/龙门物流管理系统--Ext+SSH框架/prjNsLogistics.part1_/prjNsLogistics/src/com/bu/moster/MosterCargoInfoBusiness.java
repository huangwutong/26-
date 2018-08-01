package com.bu.moster;

import java.util.*;
import com.service.*;
import com.struts.form.*;
import com.po.*;

public class MosterCargoInfoBusiness implements MosterBusiness {

	private DAOService ds;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		List ls = ds.getCargoinfodao().findAll();
		Vector vcci = new Vector();
		for (Object object : ls) {
			CargoInfo ci = (CargoInfo) object;
			//创建货物信息表对象
			MosterCargoInfoForm mocif = new MosterCargoInfoForm();
			mocif.setCargoID(ci.getCargoId().toString());
			mocif.setCargoName(ci.getCargoName());
			mocif.setCargoWeight(ci.getCargoWeight());
			mocif.setCargoBulk(ci.getCargoBulk());
			mocif.setCargoNum(ci.getCargoNum());
			mocif.setCargoUnit(ci.getCargoUnit());
			mocif.setCargoValue(ci.getCargoValue());
			mocif.setCargoFreight(ci.getCargoFreight());
			mocif.setCargoAmends(ci.getCargoAmends());
			mocif.setCargoMemo(ci.getCargoMemo());

			mocif.setCargoState(ci.getCargoState().toString());

			//获取公司数据
			mocif.setBranchID(ci.getBranchInfo().getBranchId().toString());
			mocif.setBranchName(ci.getBranchInfo().getBranchName());
			
			mocif.setCargoStartData(ci.getCargoStartData());
			mocif.setCargoEndData(ci.getCargoEndData());
			vcci.add(mocif);
			
		}
		return vcci;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		CargoInfo ci = ds.getCargoinfodao().findById(new Integer(id));
		//创建货物信息对象
		MosterCargoInfoForm mocif= new MosterCargoInfoForm();
		mocif.setCargoID(ci.getCargoId().toString());
		mocif.setCargoName(ci.getCargoName());
		mocif.setCargoWeight(ci.getCargoWeight());
		mocif.setCargoBulk(ci.getCargoBulk());
		mocif.setCargoNum(ci.getCargoNum());
		mocif.setCargoUnit(ci.getCargoUnit());
		mocif.setCargoValue(ci.getCargoValue());
		mocif.setCargoFreight(ci.getCargoFreight());
		mocif.setCargoAmends(ci.getCargoAmends());
		mocif.setCargoMemo(ci.getCargoMemo());
		mocif.setCargoState(ci.getCargoState().toString());
		//获取公司数据
		mocif.setBranchID(ci.getBranchInfo().getBranchId().toString());
		mocif.setBranchName(ci.getBranchInfo().getBranchName());
		
		mocif.setCargoStartData(ci.getCargoStartData());
		mocif.setCargoEndData(ci.getCargoEndData());
			
		return mocif;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		MosterCargoInfoForm mocif = (MosterCargoInfoForm)ob;
		CargoInfo ci = new CargoInfo();
		ci.setCargoName(mocif.getCargoName());
		ci.setCargoWeight(mocif.getCargoWeight());
		ci.setCargoBulk(mocif.getCargoBulk());
		ci.setCargoNum(mocif.getCargoNum());
		ci.setCargoUnit(mocif.getCargoUnit());
		ci.setCargoValue(mocif.getCargoValue());
		ci.setCargoFreight(mocif.getCargoFreight());
		ci.setCargoAmends(mocif.getCargoAmends());
		ci.setCargoMemo(mocif.getCargoMemo());
		ci.setCargoState(new Integer(mocif.getCargoState()));
		//设置公司信息，获取公司对象
		BranchInfo bi = ds.getBranchinfodao().findById(new Integer(mocif.getBranchID()));
		ci.setBranchInfo(bi);
		ci.setCargoStartData(mocif.getCargoStartData());
		ci.setCargoEndData(mocif.getCargoEndData());
		
		try {
			//保存货物信息对象
			ds.getCargoinfodao().save(ci);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		MosterCargoInfoForm mocif = (MosterCargoInfoForm) ob;
		CargoInfo c= ds.getCargoinfodao().findById(new Integer(mocif.getCargoID()));
		c.setCargoName(mocif.getCargoName());
		c.setCargoWeight(mocif.getCargoWeight());
		c.setCargoBulk(mocif.getCargoBulk());
		c.setCargoNum(mocif.getCargoNum());
		c.setCargoUnit(mocif.getCargoUnit());
		c.setCargoValue(mocif.getCargoValue());
		c.setCargoFreight(mocif.getCargoFreight());
		c.setCargoAmends(mocif.getCargoAmends());
		c.setCargoMemo(mocif.getCargoMemo());
		c.setCargoState(new Integer(mocif.getCargoState()));
		//设置公司信息，获取公司对象
		BranchInfo bi = ds.getBranchinfodao().findById(new Integer(mocif.getBranchID()));
		c.setBranchInfo(bi);
		c.setCargoStartData(mocif.getCargoStartData());
		c.setCargoEndData(mocif.getCargoEndData());		
		
		//更新货物信息
		try {
			ds.getCargoinfodao().attachDirty(c);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	//查找所有货物的编号和名称
	public Vector findAllID(int branchID){
		// TODO Auto-generated method stub
		List ls = ds.getCargoinfodao().findByBranchID(branchID);
		Vector vccargo = new Vector();
		for (Object object : ls) {
			CargoInfo ci = (CargoInfo) object;
			//创建货物信息表对象
			MosterCargoInfoForm mocif = new MosterCargoInfoForm();
			mocif.setCargoID(ci.getCargoId().toString());
			mocif.setCargoName(ci.getCargoName());
			vccargo.add(mocif);
			
		}
		return vccargo;
		
	}
	
	/**
	 * 查询指定公司的货物信息
	 * @param int 公司编号
	 * */
	public Vector findByBranchID(int branchID){
		Vector vcci = new Vector();
		List ls=ds.getCargoinfodao().findByBranchID(branchID);
		
		for (Object object : ls) {
			CargoInfo ci = (CargoInfo) object;
			//创建货物信息表对象
			MosterCargoInfoForm mocif = new MosterCargoInfoForm();
			mocif.setCargoID(ci.getCargoId().toString());
			mocif.setCargoName(ci.getCargoName());
			mocif.setCargoWeight(ci.getCargoWeight());
			mocif.setCargoBulk(ci.getCargoBulk());
			mocif.setCargoNum(ci.getCargoNum());
			mocif.setCargoUnit(ci.getCargoUnit());
			mocif.setCargoValue(ci.getCargoValue());
			mocif.setCargoFreight(ci.getCargoFreight());
			mocif.setCargoAmends(ci.getCargoAmends());
			mocif.setCargoMemo(ci.getCargoMemo());
			
			mocif.setCargoState(ci.getCargoState().toString());
			//获取公司数据
			mocif.setBranchID(ci.getBranchInfo().getBranchId().toString());
			mocif.setBranchName(ci.getBranchInfo().getBranchName());
			
			mocif.setCargoStartData(ci.getCargoStartData());
			mocif.setCargoEndData(ci.getCargoEndData());
			vcci.add(mocif);
			
		}
		return vcci;
	}
	
	public DAOService getDs() {
		return ds;
	}

	public void setDs(DAOService ds) {
		this.ds = ds;
	}

}
