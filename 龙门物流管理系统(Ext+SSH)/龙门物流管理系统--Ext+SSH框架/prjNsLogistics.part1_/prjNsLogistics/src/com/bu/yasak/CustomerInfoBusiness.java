package com.bu.yasak;

import java.util.*;

import com.po.*;
import com.service.*;
import com.struts.form.*;

public class CustomerInfoBusiness implements IBusiness {
	private DAOService daos; 
	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}
	//按 id 删除客户信息
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		CustomerInfo cusinfo = daos.getCustomerinfodao().findById(new Integer(id));
		try {
			//删除客户信息对象
			daos.getCustomerinfodao().delete(cusinfo);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	//查找所有客户信息
	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector vccus=new Vector();
		List ls = daos.getCustomerinfodao().findAll();
		for (Object object : ls) {
			CustomerInfo cusinfo = (CustomerInfo) object;
			Yasak_CustomerForm ycf = new Yasak_CustomerForm();
			ycf.setCustomerId(cusinfo.getCustomerId().toString());
			ycf.setCustomerName(cusinfo.getCustomerName());
			ycf.setCustomerLinkMan(cusinfo.getCustomerLinkMan());
			ycf.setCustomerSex(cusinfo.getCustomerSex());
			ycf.setCustomerPhone(cusinfo.getCustomerPhone());
			ycf.setCustomerFax(cusinfo.getCustomerFax());
			ycf.setCustomerPostId(cusinfo.getCustomerPostId());
			ycf.setCustomerEmail(cusinfo.getCustomerEmail());
			ycf.setCustomerRegData(cusinfo.getCustomerRegData());
			//获取分公司仓库数据
			ycf.setBranchId(cusinfo.getBranchInfo().getBranchId().toString());
			ycf.setBranchName(cusinfo.getBranchInfo().getBranchName());
			vccus.add(ycf);
		}
		return vccus;
	}
	//根据客户Id查找客户信息
	public Object findById(String id) {
		// TODO Auto-generated method stub
		CustomerInfo cusinfo = daos.getCustomerinfodao().findById(new Integer(id));
		Yasak_CustomerForm ycf = new Yasak_CustomerForm();
		ycf.setCustomerId(cusinfo.getCustomerId().toString());
		ycf.setCustomerName(cusinfo.getCustomerName());
		ycf.setCustomerLinkMan(cusinfo.getCustomerLinkMan());
		ycf.setCustomerSex(cusinfo.getCustomerSex());
		ycf.setCustomerPhone(cusinfo.getCustomerPhone());
		ycf.setCustomerFax(cusinfo.getCustomerFax());
		ycf.setCustomerPostId(cusinfo.getCustomerPostId());
		ycf.setCustomerEmail(cusinfo.getCustomerEmail());
		ycf.setCustomerRegData(cusinfo.getCustomerRegData());
		//获取分公司仓库数据
		ycf.setBranchId(cusinfo.getBranchInfo().getBranchId().toString());
		ycf.setBranchName(cusinfo.getBranchInfo().getBranchName());
		
		return ycf;
	}
	//向数据库中保存客户数据
	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		Yasak_CustomerForm ycf = (Yasak_CustomerForm) ob;
		CustomerInfo cusinfo = new CustomerInfo();
		cusinfo.setCustomerName(ycf.getCustomerName());
		cusinfo.setCustomerLinkMan(ycf.getCustomerLinkMan());
		cusinfo.setCustomerSex(ycf.getCustomerSex());
		cusinfo.setCustomerPhone(ycf.getCustomerPhone());
		cusinfo.setCustomerFax(ycf.getCustomerFax());
		cusinfo.setCustomerPostId(ycf.getCustomerPostId());
		cusinfo.setCustomerEmail(ycf.getCustomerEmail());
		cusinfo.setCustomerRegData(ycf.getCustomerRegData());
		//设置分公司仓库数据，获取分公司仓库对象
		BranchInfo bran = daos.getBranchinfodao().findById(new Integer(ycf.getBranchId()));
		cusinfo.setBranchInfo(bran);
		try {
			//保存客户信息对象
			daos.getCustomerinfodao().save(cusinfo);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	//根据客户Id更新客户信息
	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		Yasak_CustomerForm ycf = (Yasak_CustomerForm) ob;
		CustomerInfo cusinfo = daos.getCustomerinfodao().findById(new Integer(ycf.getCustomerId()));
		cusinfo.setCustomerName(ycf.getCustomerName());
		cusinfo.setCustomerLinkMan(ycf.getCustomerLinkMan());
		cusinfo.setCustomerSex(ycf.getCustomerSex());
		cusinfo.setCustomerPhone(ycf.getCustomerPhone());
		cusinfo.setCustomerFax(ycf.getCustomerFax());
		cusinfo.setCustomerPostId(ycf.getCustomerPostId());
		cusinfo.setCustomerEmail(ycf.getCustomerEmail());
		cusinfo.setCustomerRegData(ycf.getCustomerRegData());
		//设置分公司仓库数据，获取分公司对象
		BranchInfo bran = daos.getBranchinfodao().findById(new Integer(ycf.getBranchId()));
		cusinfo.setBranchInfo(bran);
		try {
			//跟新客户信息对象
			daos.getCustomerinfodao().attachDirty(cusinfo);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public Vector findByBillAll(String str) {
		// TODO Auto-generated method stub
		Vector vccus=new Vector();
		List ls = daos.getCustomerinfodao().findByAll(str);
		for (Object object : ls) {
			CustomerInfo cusinfo = (CustomerInfo) object;
			Yasak_CustomerForm ycf = new Yasak_CustomerForm();
			ycf.setCustomerId(cusinfo.getCustomerId().toString());
			ycf.setCustomerName(cusinfo.getCustomerName());
			ycf.setCustomerLinkMan(cusinfo.getCustomerLinkMan());
			ycf.setCustomerSex(cusinfo.getCustomerSex());
			ycf.setCustomerPhone(cusinfo.getCustomerPhone());
			ycf.setCustomerFax(cusinfo.getCustomerFax());
			ycf.setCustomerPostId(cusinfo.getCustomerPostId());
			ycf.setCustomerEmail(cusinfo.getCustomerEmail());
			ycf.setCustomerRegData(cusinfo.getCustomerRegData());
			//获取分公司仓库数据
			ycf.setBranchId(cusinfo.getBranchInfo().getBranchId().toString());
			ycf.setBranchName(cusinfo.getBranchInfo().getBranchName());
			vccus.add(ycf);
		}
		return vccus;
	}
	



}
