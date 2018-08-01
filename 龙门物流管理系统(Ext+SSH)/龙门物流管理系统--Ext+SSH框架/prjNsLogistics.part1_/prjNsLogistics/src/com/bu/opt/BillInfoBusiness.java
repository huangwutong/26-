package com.bu.opt;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import com.po.BillInfo;
import com.po.CargoInfo;
import com.po.CargoVector;
import com.service.DAOService;
import com.struts.form.OptBillInfoForm;
import com.struts.form.OptCargoInfoForm;

public class BillInfoBusiness implements IBusiness {

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
		BillInfo bi = daos.getBillinfodao().findById(new Integer(pkid));
		
		//将持久化对象转换为ActionForm对象
		OptBillInfoForm biform = new OptBillInfoForm();
		biform.setBillid(bi.getBillId().toString());
		biform.setSendid(bi.getCustomerInfoBySendId().getCustomerId().toString());
		biform.setSendname(bi.getCustomerInfoBySendId().getCustomerName());
		biform.setReceiveid(bi.getCustomerInfoByReceiveId().getCustomerId().toString());
		biform.setReceivename(bi.getCustomerInfoByReceiveId().getCustomerName());
		biform.setTruckline(bi.getTruckLine());
		biform.setPayername(bi.getPayerName());
		biform.setUserid(bi.getUserInfo().getUserId().toString());
		biform.setUsername(bi.getUserInfo().getUserName());
		biform.setBilldata(bi.getBillData());
		biform.setBillstateid(bi.getBillState().getBillStateId().toString());
		biform.setBillstatename(bi.getBillState().getBillStateName());
		biform.setBillmemo(bi.getBillMemo());
		biform.setSendbranchid(bi.getBranchInfoBySendBranchId().getBranchId().toString());
		biform.setSendbranchname(bi.getBranchInfoBySendBranchId().getBranchName());
		biform.setReceivebranchid(bi.getBranchInfoByReceiveBranchId().getBranchId().toString());
		biform.setReceivebranchname(bi.getBranchInfoByReceiveBranchId().getBranchName());
		
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
				OptCargoInfoForm ciform = new OptCargoInfoForm();
				ciform.setCargoid(ci.getCargoId().toString());
				ciform.setCargoname(ci.getCargoName());
				ciform.setCargoweight(ci.getCargoWeight());
				ciform.setCargobulk(ci.getCargoBulk());
				ciform.setCargonum(ci.getCargoNum());
				ciform.setCargounit(ci.getCargoUnit());
				ciform.setCargovalue(ci.getCargoValue());
				ciform.setCargofreight(ci.getCargoFreight());
				ciform.setCargoamend(ci.getCargoAmends());
				ciform.setCargomemo(ci.getCargoMemo());
				ciform.setCargostate(ci.getCargoState().toString());
				ciform.setBranchid(ci.getBranchInfo().getBranchId().toString());
				ciform.setBranchname(ci.getBranchInfo().getBranchName());
				ciform.setCargostartdata(ci.getCargoStartData());
				ciform.setCargoenddata(ci.getCargoEndData());
				
				cargos.add(ciform);
				
				cargoids[i]=ci.getCargoId().toString();
				i++;
			}
			
			biform.setCargoids(cargoids);
		}
		
		biform.setCargos(cargos);

		return biform;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		OptBillInfoForm biform = (OptBillInfoForm) ob;
		BillInfo bi = daos.getBillinfodao().findById(new Integer(biform.getBillid()));
		
		//将ActionForm对象转换为持久化对象
//		bi.setCustomerInfoBySendId(daos.getCustomerinfodao().findById(new Integer(biform.getSendid())));
//		bi.setCustomerInfoByReceiveId(daos.getCustomerinfodao().findById(new Integer(biform.getReceiveid())));
//		bi.setTruckLine(biform.getTruckline());
//		bi.setPayerName(biform.getPayername());
		bi.setUserInfo(daos.getUserinfodao().findById(new Integer(biform.getUserid())));
//		bi.setBillData(biform.getBilldata());
		bi.setBillState(daos.getBillstatedao().findById(new Integer(biform.getBillstateid())));
		if (biform.getBillmemo()!=null||!biform.getBillmemo().equals("")) {
			bi.setBillMemo(biform.getBillmemo());
		}	
//		bi.setBranchInfoBySendBranchId(daos.getBranchinfodao().findById(new Integer(biform.getSendbranchid())));
//		bi.setBranchInfoByReceiveBranchId(daos.getBranchinfodao().findById(new Integer(biform.getReceivebranchid())));
		
		try {
			daos.getBillinfodao().attachDirty(bi);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
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
			li=daos.getBillinfodao().findByBillStateID(billstateID);
		}else{
			li = daos.getBillinfodao().findByBillStateID(billstateID,branchID);	
		}
		
		//将持久化对象转换为ActionForm对象
		for (Object object : li) {
			BillInfo bi = (BillInfo) object;
			OptBillInfoForm biform = new OptBillInfoForm();
			biform.setBillid(bi.getBillId().toString());
			biform.setSendid(bi.getCustomerInfoBySendId().getCustomerId().toString());
			biform.setSendname(bi.getCustomerInfoBySendId().getCustomerName());
			biform.setReceiveid(bi.getCustomerInfoByReceiveId().getCustomerId().toString());
			biform.setReceivename(bi.getCustomerInfoByReceiveId().getCustomerName());
			biform.setTruckline(bi.getTruckLine());
			biform.setPayername(bi.getPayerName());
			biform.setUserid(bi.getUserInfo().getUserId().toString());
			biform.setUsername(bi.getUserInfo().getUserName());
			biform.setBilldata(bi.getBillData());
			biform.setBillstateid(bi.getBillState().getBillStateId().toString());
			biform.setBillstatename(bi.getBillState().getBillStateName());
			biform.setBillmemo(bi.getBillMemo());
			biform.setSendbranchid(bi.getBranchInfoBySendBranchId().getBranchId().toString());
			biform.setSendbranchname(bi.getBranchInfoBySendBranchId().getBranchName());
			biform.setReceivebranchid(bi.getBranchInfoByReceiveBranchId().getBranchId().toString());
			biform.setReceivebranchname(bi.getBranchInfoByReceiveBranchId().getBranchName());
			
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
					OptCargoInfoForm ciform = new OptCargoInfoForm();
					ciform.setCargoid(ci.getCargoId().toString());
					ciform.setCargoname(ci.getCargoName());
					ciform.setCargoweight(ci.getCargoWeight());
					ciform.setCargobulk(ci.getCargoBulk());
					ciform.setCargonum(ci.getCargoNum());
					ciform.setCargounit(ci.getCargoUnit());
					ciform.setCargovalue(ci.getCargoValue());
					ciform.setCargofreight(ci.getCargoFreight());
					ciform.setCargoamend(ci.getCargoAmends());
					ciform.setCargomemo(ci.getCargoMemo());
					ciform.setCargostate(ci.getCargoState().toString());
					ciform.setBranchid(ci.getBranchInfo().getBranchId().toString());
					ciform.setBranchname(ci.getBranchInfo().getBranchName());
					ciform.setCargostartdata(ci.getCargoStartData());
					ciform.setCargoenddata(ci.getCargoEndData());
					
					cargos.add(ciform);
					
					cargoids[i]=ci.getCargoId().toString();
					i++;
				}
				
				biform.setCargoids(cargoids);
			}
			
			biform.setCargos(cargos);
 			
			billvc.add(biform);
		}
		
		return billvc;
	}
	

}
