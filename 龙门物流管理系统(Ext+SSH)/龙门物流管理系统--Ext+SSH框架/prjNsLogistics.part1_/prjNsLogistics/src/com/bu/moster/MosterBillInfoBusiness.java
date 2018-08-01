package com.bu.moster;

import java.util.*;

import com.service.*;
import com.po.*;
import com.struts.form.*;


public class MosterBillInfoBusiness implements MosterBusiness {

	private DAOService ds;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		List ls = ds.getBillinfodao().findAll();
		Vector vcbi = new Vector();
		for (Object object : ls) {
			BillInfo bi = (BillInfo)object;
			//创建货票信息表的对象
			MosterBillInfoForm mobif = new MosterBillInfoForm();
			
			mobif.setBillID(bi.getBillId().toString());
			//获取发货方数据
			mobif.setSendID(bi.getCustomerInfoBySendId().getCustomerId().toString());
			mobif.setSendName(bi.getCustomerInfoBySendId().getCustomerName());
			//获取收货方数据
			mobif.setReceiveID(bi.getCustomerInfoByReceiveId().getCustomerId().toString());
			mobif.setReceiveName(bi.getCustomerInfoByReceiveId().getCustomerName());
			mobif.setTruckLine(bi.getTruckLine());
			mobif.setPayerName(bi.getPayerName());
			//获取用户数据
			mobif.setUserID(bi.getUserInfo().getUserId().toString());
			mobif.setUserName(bi.getUserInfo().getUserName());
			mobif.setBillData(bi.getBillData());
			//获取货票信息数据
			mobif.setBillStateID(bi.getBillState().getBillStateId().toString());
			mobif.setBillStateName(bi.getBillState().getBillStateName());
			mobif.setBillMemo(bi.getBillMemo());
			//获取发货方公司数据
			mobif.setSendBranchID(bi.getBranchInfoBySendBranchId().getBranchId().toString());
			mobif.setSendBranchName(bi.getBranchInfoBySendBranchId().getBranchName());
			//获取收货方公司数据
			mobif.setReceiveBranchID(bi.getBranchInfoByReceiveBranchId().getBranchId().toString());
			mobif.setReceiveBranchName(bi.getBranchInfoByReceiveBranchId().getBranchName());
			
			//创建货物集合对象
			Vector cargos=new Vector();
			//获取货物集合
			Set cgi = bi.getCargoVectors();
			if(cgi!=null||!cgi.isEmpty()){
				Iterator it = cgi.iterator();
				//获取货物集合对象
				while(it.hasNext()){
					CargoVector cv = (CargoVector) it.next();
					//通过货物集合对象获取货物对象，并设置到货物集合中
					CargoInfo ci = cv.getCargoInfo();
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
					if(ci.getCargoState()==0){
						mocif.setCargoState("库存");
					}
					if(ci.getCargoState()==1){
						mocif.setCargoState("在途");
					}
					if(ci.getCargoState()==2){
						mocif.setCargoState("出库");
					}
					
					
					//获取公司数据
					mocif.setBranchID(ci.getBranchInfo().getBranchId().toString());
					mocif.setBranchName(ci.getBranchInfo().getBranchName());				
					mocif.setCargoStartData(ci.getCargoStartData());
					mocif.setCargoEndData(ci.getCargoEndData());
					cargos.add(mocif);
				}				
			}
			mobif.setCargos(cargos);
			vcbi.add(mobif);
			
		}
		return vcbi;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		BillInfo bi = ds.getBillinfodao().findById(new Integer(id));
		//创建货票信息表对象
		MosterBillInfoForm mobif = new MosterBillInfoForm();
		mobif.setBillID(bi.getBillId().toString());
		//获取发货方数据
		mobif.setSendID(bi.getCustomerInfoBySendId().getCustomerId().toString());
		mobif.setSendName(bi.getCustomerInfoBySendId().getCustomerName());
		//获取收货方数据
		mobif.setReceiveID(bi.getCustomerInfoByReceiveId().getCustomerId().toString());
		mobif.setReceiveName(bi.getCustomerInfoByReceiveId().getCustomerName());
		mobif.setTruckLine(bi.getTruckLine());
		mobif.setPayerName(bi.getPayerName());
		//获取用户数据
		mobif.setUserID(bi.getUserInfo().getUserId().toString());
		mobif.setUserName(bi.getUserInfo().getUserName());
		mobif.setBillData(bi.getBillData());
		//获取货票信息数据
		mobif.setBillStateID(bi.getBillState().getBillStateId().toString());
		mobif.setBillStateName(bi.getBillState().getBillStateName());
		mobif.setBillMemo(bi.getBillMemo());
		//获取发货方公司数据
		mobif.setSendBranchID(bi.getBranchInfoBySendBranchId().getBranchId().toString());
		mobif.setSendBranchName(bi.getBranchInfoBySendBranchId().getBranchName());
		//获取收货方公司数据
		mobif.setReceiveBranchID(bi.getBranchInfoByReceiveBranchId().getBranchId().toString());
		mobif.setReceiveBranchName(bi.getBranchInfoByReceiveBranchId().getBranchName());
		
		//创建货物集合对象
		Vector cargos=new Vector();
		//获取货物集合
		Set cgi = bi.getCargoVectors();
		if(cgi!=null||!cgi.isEmpty()){
			Iterator it = cgi.iterator();
			//获取货物集合对象
			while(it.hasNext()){
				CargoVector cv = (CargoVector) it.next();
				//通过货物集合对象获取货物对象，并设置到货物集合中
				CargoInfo ci = cv.getCargoInfo();
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
				if(ci.getCargoState()==0){
					mocif.setCargoState("库存");
				}
				if(ci.getCargoState()==1){
					mocif.setCargoState("在途");
				}
				if(ci.getCargoState()==2){
					mocif.setCargoState("出库");
				}
				//获取公司数据
				mocif.setBranchID(ci.getBranchInfo().getBranchId().toString());
				mocif.setBranchName(ci.getBranchInfo().getBranchName());				
				mocif.setCargoStartData(ci.getCargoStartData());
				mocif.setCargoEndData(ci.getCargoEndData());
				cargos.add(mocif);
			}				
		}
		mobif.setCargos(cargos);
		return mobif;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		MosterBillInfoForm mobif = (MosterBillInfoForm) ob;

		BillInfo b = ds.getBillinfodao().findById(new Integer(mobif.getBillID()));
		
		
		//获取用户对象，设置用户ID数据
		UserInfo ui = ds.getUserinfodao().findById(new Integer(mobif.getUserID()));
		b.setUserInfo(ui);
		//设置货票状态数据，获取货票状态表的对象
		BillState bs = ds.getBillstatedao().findById(new Integer(mobif.getBillStateID())); 
		b.setBillState(bs);
		b.setBillMemo(mobif.getBillMemo());
		try {
			//更新货票信息
			ds.getBillinfodao().attachDirty(b);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	//根据公司编号，查找本公司所有的货票编号
	public Vector findByBranchID(int branchID){
		// TODO Auto-generated method stub
		List ls = ds.getBillinfodao().findByBranchID(branchID);
		Vector vcbill = new Vector();
		for (Object object : ls) {
			BillInfo bi = (BillInfo) object;
			//创建货物信息表对象
			MosterBillInfoForm mobif = new MosterBillInfoForm();
			mobif.setBillID(bi.getBillId().toString());
			vcbill.add(mobif);
			
		}
		return vcbill;
		
	}
	
	public Vector findByBillState(int id){
		// TODO Auto-generated method stub
		List ls = ds.getBillinfodao().findByBillStateID(id);
		Vector vcbi = new Vector();
		for (Object object : ls) {
			BillInfo bi = (BillInfo)object;
			//创建货票信息表的对象
			MosterBillInfoForm mobif = new MosterBillInfoForm();
			mobif.setBillID(bi.getBillId().toString());
			//获取发货方数据
			mobif.setSendID(bi.getCustomerInfoBySendId().getCustomerId().toString());
			mobif.setSendName(bi.getCustomerInfoBySendId().getCustomerName());
			//获取收货方数据
			mobif.setReceiveID(bi.getCustomerInfoByReceiveId().getCustomerId().toString());
			mobif.setReceiveName(bi.getCustomerInfoByReceiveId().getCustomerName());
			mobif.setTruckLine(bi.getTruckLine());
			mobif.setPayerName(bi.getPayerName());
			//获取用户数据
			mobif.setUserID(bi.getUserInfo().getUserId().toString());
			mobif.setUserName(bi.getUserInfo().getUserName());
			mobif.setBillData(bi.getBillData());
			//获取货票信息数据
			mobif.setBillStateID(bi.getBillState().getBillStateId().toString());
			mobif.setBillStateName(bi.getBillState().getBillStateName());
			mobif.setBillMemo(bi.getBillMemo());
			//获取发货方公司数据
			mobif.setSendBranchID(bi.getBranchInfoBySendBranchId().getBranchId().toString());
			mobif.setSendBranchName(bi.getBranchInfoBySendBranchId().getBranchName());
			//获取收货方公司数据
			mobif.setReceiveBranchID(bi.getBranchInfoByReceiveBranchId().getBranchId().toString());
			mobif.setReceiveBranchName(bi.getBranchInfoByReceiveBranchId().getBranchName());
			
			//创建货物集合对象
			Vector cargos=new Vector();
			//获取货物集合
			Set cgi = bi.getCargoVectors();
			if(cgi!=null||!cgi.isEmpty()){
				Iterator it = cgi.iterator();
				//获取货物集合对象
				while(it.hasNext()){
					CargoVector cv = (CargoVector) it.next();
					//通过货物集合对象获取货物对象，并设置到货物集合中
					CargoInfo ci = cv.getCargoInfo();
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
					if(ci.getCargoState()==0){
						mocif.setCargoState("库存");
					}
					if(ci.getCargoState()==1){
						mocif.setCargoState("在途");
					}
					if(ci.getCargoState()==2){
						mocif.setCargoState("出库");
					}
					//获取公司数据
					mocif.setBranchID(ci.getBranchInfo().getBranchId().toString());
					mocif.setBranchName(ci.getBranchInfo().getBranchName());				
					mocif.setCargoStartData(ci.getCargoStartData());
					mocif.setCargoEndData(ci.getCargoEndData());
					cargos.add(mocif);
				}				
			}
			mobif.setCargos(cargos);
			vcbi.add(mobif);
			
		}
		return vcbi;
		
	}
	/**
	 * 根据货票状态以及公司ID查询货票信息
	 * @param int 货票状态编号
	 * @return Vector 货票集合
	 * */
	public Vector findByBillStateID(int billstateID,int branchID){
		Vector billvc = new Vector();
		List li = new ArrayList();
		if (branchID==0) {
			li=ds.getBillinfodao().findByBillStateID(billstateID);
		}else{
			li = ds.getBillinfodao().findByBillStateID(billstateID,branchID);	
		}
		
		//将持久化对象转换为ActionForm对象
		for (Object object : li) {
			BillInfo bi = (BillInfo) object;
			//创建货票信息表的对象
			MosterBillInfoForm mobif = new MosterBillInfoForm();
			mobif.setBillID(bi.getBillId().toString());
			//获取发货方数据
			mobif.setSendID(bi.getCustomerInfoBySendId().getCustomerId().toString());
			mobif.setSendName(bi.getCustomerInfoBySendId().getCustomerName());
			//获取收货方数据
			mobif.setReceiveID(bi.getCustomerInfoByReceiveId().getCustomerId().toString());
			mobif.setReceiveName(bi.getCustomerInfoByReceiveId().getCustomerName());
			mobif.setTruckLine(bi.getTruckLine());
			mobif.setPayerName(bi.getPayerName());
			//获取用户数据
			mobif.setUserID(bi.getUserInfo().getUserId().toString());
			mobif.setUserName(bi.getUserInfo().getUserName());
			mobif.setBillData(bi.getBillData());
			//获取货票信息数据
			mobif.setBillStateID(bi.getBillState().getBillStateId().toString());
			mobif.setBillStateName(bi.getBillState().getBillStateName());
			mobif.setBillMemo(bi.getBillMemo());
			//获取发货方公司数据
			mobif.setSendBranchID(bi.getBranchInfoBySendBranchId().getBranchId().toString());
			mobif.setSendBranchName(bi.getBranchInfoBySendBranchId().getBranchName());
			//获取收货方公司数据
			mobif.setReceiveBranchID(bi.getBranchInfoByReceiveBranchId().getBranchId().toString());
			mobif.setReceiveBranchName(bi.getBranchInfoByReceiveBranchId().getBranchName());
			
			//为货票信息添加对应的货物信息集合以及货物ID数组
			Set s = bi.getCargoVectors();
			Vector cargos = new Vector();
			
			if (s!=null||!s.isEmpty()) {
				Iterator it = s.iterator();
				String[] cargoids = new String[s.size()];
				int i=0;
				while(it.hasNext()){
					CargoVector cv = (CargoVector) it.next();
					CargoInfo ci = cv.getCargoInfo();
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
					if(ci.getCargoState()==0){
						mocif.setCargoState("库存");
					}
					if(ci.getCargoState()==1){
						mocif.setCargoState("在途");
					}
					if(ci.getCargoState()==2){
						mocif.setCargoState("出库");
					}
					//获取公司数据
					mocif.setBranchID(ci.getBranchInfo().getBranchId().toString());
					mocif.setBranchName(ci.getBranchInfo().getBranchName());				
					mocif.setCargoStartData(ci.getCargoStartData());
					mocif.setCargoEndData(ci.getCargoEndData());
					
					cargos.add(mocif);
					
					cargoids[i]=ci.getCargoId().toString();
					i++;
				}
				
				mobif.setCargoIDs(cargoids);
			}
			
			mobif.setCargos(cargos);
 			
			billvc.add(mobif);
		}
		
		return billvc;
	}
	
	/**
	 * 根据货票状态以及公司ID查询货票信息
	 * @param int 货票状态编号
	 * @return Vector 货票集合
	 * */
	public Vector findByBillRecBranchID(int billstateID,int rbranchID){
		Vector billvc = new Vector();
		List li = new ArrayList();
		if (rbranchID==0) {
			li=ds.getBillinfodao().findByBillStateID(billstateID);
			//将持久化对象转换为ActionForm对象
			for (Object object : li) {
				BillInfo bi = (BillInfo) object;
				//创建货票信息表的对象
				MosterBillInfoForm mobif = new MosterBillInfoForm();
				mobif.setBillID(bi.getBillId().toString());
				//获取发货方数据
				mobif.setSendID(bi.getCustomerInfoBySendId().getCustomerId().toString());
				mobif.setSendName(bi.getCustomerInfoBySendId().getCustomerName());
				//获取收货方数据
				mobif.setReceiveID(bi.getCustomerInfoByReceiveId().getCustomerId().toString());
				mobif.setReceiveName(bi.getCustomerInfoByReceiveId().getCustomerName());
				mobif.setTruckLine(bi.getTruckLine());
				mobif.setPayerName(bi.getPayerName());
				//获取用户数据
				mobif.setUserID(bi.getUserInfo().getUserId().toString());
				mobif.setUserName(bi.getUserInfo().getUserName());
				mobif.setBillData(bi.getBillData());
				//获取货票信息数据
				Integer state= bi.getBillState().getBillStateId();			
				if(state!=billstateID){
					continue;
				}
				mobif.setBillStateID(state.toString());
				mobif.setBillStateName(bi.getBillState().getBillStateName());
				mobif.setBillMemo(bi.getBillMemo());
				//获取发货方公司数据
				mobif.setSendBranchID(bi.getBranchInfoBySendBranchId().getBranchId().toString());
				mobif.setSendBranchName(bi.getBranchInfoBySendBranchId().getBranchName());
				//获取收货方公司数据			
				mobif.setReceiveBranchID(bi.getBranchInfoByReceiveBranchId().getBranchId().toString());
				mobif.setReceiveBranchName(bi.getBranchInfoByReceiveBranchId().getBranchName());
				
				//为货票信息添加对应的货物信息集合以及货物ID数组
				Set s = bi.getCargoVectors();
				Vector cargos = new Vector();
				
				if (s!=null||!s.isEmpty()) {
					Iterator it = s.iterator();
					String[] cargoids = new String[s.size()];
					int i=0;
					while(it.hasNext()){
						CargoVector cv = (CargoVector) it.next();
						CargoInfo ci = cv.getCargoInfo();
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
						if(ci.getCargoState()==0){
							mocif.setCargoState("库存");
						}
						if(ci.getCargoState()==1){
							mocif.setCargoState("在途");
						}
						if(ci.getCargoState()==2){
							mocif.setCargoState("出库");
						}
						//获取公司数据
						mocif.setBranchID(ci.getBranchInfo().getBranchId().toString());
						mocif.setBranchName(ci.getBranchInfo().getBranchName());				
						mocif.setCargoStartData(ci.getCargoStartData());
						mocif.setCargoEndData(ci.getCargoEndData());
						
						cargos.add(mocif);
						
						cargoids[i]=ci.getCargoId().toString();
						i++;
					}
					
					mobif.setCargoIDs(cargoids);
				}
				
				mobif.setCargos(cargos);
	 			
				billvc.add(mobif);
			}
		}else{
			li = ds.getBillinfodao().findAll();	
			//将持久化对象转换为ActionForm对象
			for (Object object : li) {
				BillInfo bi = (BillInfo) object;
				//创建货票信息表的对象
				MosterBillInfoForm mobif = new MosterBillInfoForm();
				mobif.setBillID(bi.getBillId().toString());
				//获取发货方数据
				mobif.setSendID(bi.getCustomerInfoBySendId().getCustomerId().toString());
				mobif.setSendName(bi.getCustomerInfoBySendId().getCustomerName());
				//获取收货方数据
				mobif.setReceiveID(bi.getCustomerInfoByReceiveId().getCustomerId().toString());
				mobif.setReceiveName(bi.getCustomerInfoByReceiveId().getCustomerName());
				mobif.setTruckLine(bi.getTruckLine());
				mobif.setPayerName(bi.getPayerName());
				//获取用户数据
				mobif.setUserID(bi.getUserInfo().getUserId().toString());
				mobif.setUserName(bi.getUserInfo().getUserName());
				mobif.setBillData(bi.getBillData());
				//获取货票信息数据
				Integer state= bi.getBillState().getBillStateId();			
				if(state!=billstateID){
					continue;
				}
				mobif.setBillStateID(state.toString());
				mobif.setBillStateName(bi.getBillState().getBillStateName());
				mobif.setBillMemo(bi.getBillMemo());
				//获取发货方公司数据
				mobif.setSendBranchID(bi.getBranchInfoBySendBranchId().getBranchId().toString());
				mobif.setSendBranchName(bi.getBranchInfoBySendBranchId().getBranchName());
				//获取收货方公司数据
				Integer rbid = bi.getBranchInfoByReceiveBranchId().getBranchId();
				if(rbid!=rbranchID){
					continue;
				}
				mobif.setReceiveBranchID(rbid.toString());
				mobif.setReceiveBranchName(bi.getBranchInfoByReceiveBranchId().getBranchName());
				
				//为货票信息添加对应的货物信息集合以及货物ID数组
				Set s = bi.getCargoVectors();
				Vector cargos = new Vector();
				
				if (s!=null||!s.isEmpty()) {
					Iterator it = s.iterator();
					String[] cargoids = new String[s.size()];
					int i=0;
					while(it.hasNext()){
						CargoVector cv = (CargoVector) it.next();
						CargoInfo ci = cv.getCargoInfo();
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
						if(ci.getCargoState()==0){
							mocif.setCargoState("库存");
						}
						if(ci.getCargoState()==1){
							mocif.setCargoState("在途");
						}
						if(ci.getCargoState()==2){
							mocif.setCargoState("出库");
						}
						//获取公司数据
						mocif.setBranchID(ci.getBranchInfo().getBranchId().toString());
						mocif.setBranchName(ci.getBranchInfo().getBranchName());				
						mocif.setCargoStartData(ci.getCargoStartData());
						mocif.setCargoEndData(ci.getCargoEndData());
						
						cargos.add(mocif);
						
						cargoids[i]=ci.getCargoId().toString();
						i++;
					}
					
					mobif.setCargoIDs(cargoids);
				}
				
				mobif.setCargos(cargos);
	 			
				billvc.add(mobif);
			}
		}
		

		
		return billvc;
	}
	
	public DAOService getDs() {
		return ds;
	}

	public void setDs(DAOService ds) {
		this.ds = ds;
	}

}
