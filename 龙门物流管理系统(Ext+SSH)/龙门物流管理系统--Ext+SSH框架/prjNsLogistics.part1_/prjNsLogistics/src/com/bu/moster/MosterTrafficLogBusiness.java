package com.bu.moster;

import java.util.*;

import com.service.*;
import com.struts.form.*;
import com.po.*;

public class MosterTrafficLogBusiness implements MosterBusiness {

	private DAOService ds;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		List ls = ds.getTrafficlogdao().findAll();
		Vector vc = new Vector();
		for (Object object : ls) {
			TrafficLog tl = (TrafficLog) object;
			//创建运输记录表对象
			MosterTrafficLogForm motlf = new MosterTrafficLogForm();
			motlf.setTrafficLogID(tl.getTrafficLogId().toString());
			motlf.setBillID(tl.getBillInfo().getBillId().toString());
			motlf.setBranchID(tl.getBranchInfo().getBranchId().toString());
			motlf.setBillstate(tl.getBillInfo().getBillState().getBillStateId().toString());
			motlf.setBillStateName(tl.getBillInfo().getBillState().getBillStateName());
			String state= tl.getBillInfo().getBillState().getBillStateId().toString();
			
			if(!state.equals("1003"))
				continue;
						
			motlf.setTLID(tl.getTruckLog().getTlid().toString());
			motlf.setBranchName(tl.getBranchInfo().getBranchName());
			vc.add(motlf);
			
		}
		return vc;
	}
	

	public Object findById(String id) {
		// TODO Auto-generated method stub
		TrafficLog tl = ds.getTrafficlogdao().findById(new Integer(id));
		//创建运输记录表对象
		MosterTrafficLogForm motlf = new MosterTrafficLogForm();
		motlf.setTrafficLogID(tl.getTrafficLogId().toString());
		motlf.setBillID(tl.getBillInfo().getBillId().toString());
		motlf.setBranchID(tl.getBranchInfo().getBranchId().toString());
		motlf.setTLID(tl.getTruckLog().getTlid().toString());
		return motlf;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		MosterTrafficLogForm motlf = (MosterTrafficLogForm) ob;
		TrafficLog tl = new TrafficLog();
		//获取货票对象，设置货票信息
		BillInfo bi = ds.getBillinfodao().findById(new Integer(motlf.getBillID()));
		tl.setBillInfo(bi);
		//获取公司对象,设置公司信息
		BranchInfo br = ds.getBranchinfodao().findById(new Integer(motlf.getBranchID()));
		tl.setBranchInfo(br);
		//获取车次对象,设置车次信息
		TruckLog tr = ds.getTrucklogdao().findById(new Integer(motlf.getTLID()));
		tl.setTruckLog(tr);
		try {
			ds.getTrafficlogdao().save(tl);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 根据货票状态以及公司ID查询运输记录
	 * @param int 货票状态编号
	 * @param int 用户公司编号
	 * @return Vector 货票集合
	 * */
	public Vector findByStateID(int billstateID,int branchID) {
		// TODO Auto-generated method stub
		List ls = ds.getTrafficlogdao().findAll();
		
		//根据用户公司ID查询
		//如果公司ID为0，则为超级管理员，查询出所有运输记录
		if (branchID==0) {
			ls=ds.getTrafficlogdao().findAll();
			
			Vector vc = new Vector();
			for (Object object : ls) {
				TrafficLog tl = (TrafficLog) object;
				//创建运输记录表对象
				MosterTrafficLogForm motlf = new MosterTrafficLogForm();
				motlf.setTrafficLogID(tl.getTrafficLogId().toString());
				motlf.setTLID(tl.getTruckLog().getTlid().toString());
				
				Integer state= tl.getBillInfo().getBillState().getBillStateId();			
				if(state!=billstateID){
					continue;
				}
				motlf.setBillID(tl.getBillInfo().getBillId().toString());
				motlf.setBranchID(tl.getBranchInfo().getBranchId().toString());
				motlf.setBillstate(tl.getBillInfo().getBillState().getBillStateId().toString());
				motlf.setBillStateName(tl.getBillInfo().getBillState().getBillStateName());
				motlf.setBranchName(tl.getBranchInfo().getBranchName());
				motlf.setTruckNum(tl.getTruckLog().getTruckInfo().getTruckNum());
				vc.add(motlf);
				
			}
			return vc;
		}
		//如不为0，则只查询出用户所属公司的所有运输记录
		else{
			ls=ds.getTrafficlogdao().findAll();
			Vector vc = new Vector();
			for (Object object : ls) {
				TrafficLog tl = (TrafficLog) object;
				//创建运输记录表对象
				MosterTrafficLogForm motlf = new MosterTrafficLogForm();
				motlf.setTrafficLogID(tl.getTrafficLogId().toString());
				motlf.setTLID(tl.getTruckLog().getTlid().toString());
				
				Integer state= tl.getBillInfo().getBillState().getBillStateId();			
				if(state!=billstateID){
					continue;
				}
				//定义一个变量，用来放置货票中收货公司的ID
				Integer branch = tl.getBillInfo().getBranchInfoByReceiveBranchId().getBranchId();
				if(branch!=branchID){
					continue;
				}
				motlf.setBillID(tl.getBillInfo().getBillId().toString());
				motlf.setBranchID(tl.getBranchInfo().getBranchId().toString());
				motlf.setBillstate(tl.getBillInfo().getBillState().getBillStateId().toString());
				motlf.setBillStateName(tl.getBillInfo().getBillState().getBillStateName());
				motlf.setBranchName(tl.getBranchInfo().getBranchName());
				motlf.setTruckNum(tl.getTruckLog().getTruckInfo().getTruckNum());
				vc.add(motlf);
				
			}
			return vc;
		}
		
		
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
