package com.bu.yasak;

import java.util.*;

import com.struts.form.*;
import com.po.*;
import com.service.*;

public class BillInCustomerBusiness implements IBusiness {
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
		return null;
	}

	public Vector findByBillAll(String str) {
		// TODO Auto-generated method stub
		Vector vcbill = new Vector();
		List ls = daos.getBillinfodao().findByAllTwo(str);
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
			if (!id.equals("1007")) {
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

	public Object findById(String id) {
		// TODO Auto-generated method stub
		return null;
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
