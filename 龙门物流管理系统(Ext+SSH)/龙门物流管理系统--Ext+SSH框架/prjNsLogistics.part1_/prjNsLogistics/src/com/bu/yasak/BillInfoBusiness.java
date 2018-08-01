package com.bu.yasak;

import java.util.*;

import com.struts.form.*;
import com.po.*;
import com.service.*;

public class BillInfoBusiness implements IBusiness {
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
	//查看所有货票信息
	/* (non-Javadoc)
	 * @see com.bu.yasak.IBusiness#findAll()
	 */
	public Vector findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	//新增货票信息
	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		Yasak_BillInfoForm ybf = (Yasak_BillInfoForm) ob;
		BillInfo bf = new BillInfo();
		//设置发货客户数据，获取发货客户对象
		CustomerInfo send = daos.getCustomerinfodao().findById(new Integer(ybf.getSendId()));
		bf.setCustomerInfoBySendId(send);
		//设置收货客户数据，获取收货客户对象
		CustomerInfo receive = daos.getCustomerinfodao().findById(new Integer(ybf.getReceiveId()));
		bf.setCustomerInfoByReceiveId(receive);
		//设置用户数据，获取用户对象
		UserInfo us = daos.getUserinfodao().findById(new Integer(ybf.getUserId()));
		bf.setUserInfo(us);
		//获取制单时间
		bf.setBillData(ybf.getBillData());
		//设置货票状态数据，获取货票状态对象
		BillState bstate = daos.getBillstatedao().findById(new Integer(ybf.getBillDataId()));
		bf.setBillState(bstate);
		//设置发货分公司仓库数据，获取发货分公司对象
		BranchInfo sendbran = daos.getBranchinfodao().findById(new Integer(ybf.getSendBranchId()));
		bf.setBranchInfoBySendBranchId(sendbran);
		//设置收货分公司仓库数据，获取收货公司对象
		BranchInfo receivebran = daos.getBranchinfodao().findById(new Integer(ybf.getReceiveBranchId()));
		bf.setBranchInfoByReceiveBranchId(receivebran);
		try {
			//保存货票信息
			daos.getBillinfodao().save(bf);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	//修改货票信息
	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		Yasak_BillInfoForm ybf = (Yasak_BillInfoForm) ob;
		BillInfo bf = daos.getBillinfodao().findById(new Integer(ybf.getBillId()));
		//设置发货客户数据，获取发货客户对象
		CustomerInfo send = daos.getCustomerinfodao().findById(new Integer(ybf.getSendId()));
		bf.setCustomerInfoBySendId(send);
		//设置收货客户数据，获取收货客户对象
		CustomerInfo receive = daos.getCustomerinfodao().findById(new Integer(ybf.getReceiveId()));
		bf.setCustomerInfoByReceiveId(receive);
		//设置用户数据，获取用户对象
		UserInfo us = daos.getUserinfodao().findById(new Integer(ybf.getUserId()));
		bf.setUserInfo(us);
		//获取制单时间
		bf.setBillData(ybf.getBillData());
		//设置货票状态数据，获取货票状态对象
		BillState bstate = daos.getBillstatedao().findById(new Integer(ybf.getBillDataId()));
		bf.setBillState(bstate);
		//设置发货分公司仓库数据，获取发货分公司对象
		BranchInfo sendbran = daos.getBranchinfodao().findById(new Integer(ybf.getSendBranchId()));
		bf.setBranchInfoBySendBranchId(sendbran);
		//设置收货公司仓库数据，获取收货公司对象
		BranchInfo receivebran = daos.getBranchinfodao().findById(new Integer(ybf.getReceiveBranchId()));
		bf.setBranchInfoByReceiveBranchId(receivebran);
		try {
			//修改货票信息
			daos.getBillinfodao().attachDirty(bf);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public Vector findByBillAll(String str) {
		// TODO Auto-generated method stub
		Vector vcbill = new Vector();
		List ls = daos.getBillinfodao().findByAll(str);
		for (Object object : ls) {
			BillInfo bf = (BillInfo) object;
			Yasak_BillInfoForm ybf = new Yasak_BillInfoForm();
			ybf.setBillId(bf.getBillId().toString());
			//获取发货人数据
			ybf.setSendId(bf.getCustomerInfoBySendId().getCustomerId().toString());
			ybf.setSendName(bf.getCustomerInfoBySendId().getCustomerName());
			//获取收货人数据
			ybf.setReceiveId(bf.getCustomerInfoByReceiveId().getCustomerId().toString());
			ybf.setReceiveName(bf.getCustomerInfoByReceiveId().getCustomerName());
			//获取用户数据
			ybf.setUserId(bf.getUserInfo().getUserId().toString());
			ybf.setUserName(bf.getUserInfo().getUserName());
			//获取制单时间
			ybf.setBillData(bf.getBillData());
			//获取货票状态数据
			ybf.setBillDataId(bf.getBillState().getBillStateId().toString());
			ybf.setBillDataName(bf.getBillState().getBillStateName());
			String id = bf.getBillState().getBillStateId().toString();
			if (!id.equals("1000")) {
				continue;
			}
			//获取发货公司仓库数据
			ybf.setSendBranchId(bf.getBranchInfoBySendBranchId().getBranchId().toString());
			ybf.setSendBranchName(bf.getBranchInfoBySendBranchId().getBranchName());
			//获取收货公司仓库数据
			ybf.setReceiveBranchId(bf.getBranchInfoByReceiveBranchId().getBranchId().toString());
			ybf.setReceiveBranchName(bf.getBranchInfoByReceiveBranchId().getBranchName());
			vcbill.add(ybf);
		}
		return vcbill;
	}

}
