package com.bu.mars;

import java.util.*;
import com.struts.form.*;
import com.po.*;
import com.service.DAOService;

public class Customerbusiness implements ibusiness {
	private DAOService daos;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		CustomerInfo cus=daos.getCustomerinfodao().findById(new Integer(id));
		try {
			daos.getCustomerinfodao().delete(cus);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector cusvc=new Vector();
		List ls=daos.getCustomerinfodao().findAll();
		for (Object object : ls) {
			CustomerInfo cus=(CustomerInfo)object;
			MarsCustomerInfoForm cusf=new MarsCustomerInfoForm();
			cusf.setCustomerid(cus.getCustomerId().toString());
			cusf.setCustomername(cus.getCustomerName());
			cusf.setCustomerlinkman(cus.getCustomerLinkMan());
			cusf.setCustomersex(cus.getCustomerSex());
			cusf.setCustomerphone(cus.getCustomerPhone());
			cusf.setCustomerfax(cus.getCustomerFax());
			cusf.setCustomerpostid(cus.getCustomerPostId());
			cusf.setCustomeremail(cus.getCustomerEmail());
			cusf.setCustomerregdata(cus.getCustomerRegData());
			cusf.setBranchid(cus.getBranchInfo().getBranchName());
			cusvc.add(cusf);
		}
		return cusvc;
	}
	public Vector findByAll(String id){
		Vector cusvc=new Vector();
		List ls=daos.getCustomerinfodao().findByAll(id);
		for (Object object : ls) {
			CustomerInfo cus=(CustomerInfo)object;
			MarsCustomerInfoForm cusf=new MarsCustomerInfoForm();
			cusf.setCustomerid(cus.getCustomerId().toString());
			cusf.setCustomername(cus.getCustomerName());
			cusf.setCustomerlinkman(cus.getCustomerLinkMan());
			cusf.setCustomersex(cus.getCustomerSex());
			cusf.setCustomerphone(cus.getCustomerPhone());
			cusf.setCustomerfax(cus.getCustomerFax());
			cusf.setCustomerpostid(cus.getCustomerPostId());
			cusf.setCustomeremail(cus.getCustomerEmail());
			cusf.setCustomerregdata(cus.getCustomerRegData());
			cusf.setBranchid(cus.getBranchInfo().getBranchName());
			cusvc.add(cusf);
		}
		return cusvc;
	}
	public Object findById(String id) {
		// TODO Auto-generated method stub
		CustomerInfo cus=daos.getCustomerinfodao().findById(new Integer(id));
		MarsCustomerInfoForm cusf=new MarsCustomerInfoForm();
		cusf.setCustomerid(cus.getCustomerId().toString());
		cusf.setCustomername(cus.getCustomerName());
		cusf.setCustomerlinkman(cus.getCustomerLinkMan());
		cusf.setCustomersex(cus.getCustomerSex());
		cusf.setCustomerphone(cus.getCustomerPhone());
		cusf.setCustomerfax(cus.getCustomerFax());
		cusf.setCustomerpostid(cus.getCustomerPostId());
		cusf.setCustomeremail(cus.getCustomerEmail());
		cusf.setCustomerregdata(cus.getCustomerRegData());
		cusf.setBranchid(cus.getBranchInfo().getBranchId().toString());
		
		return cusf;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}

}
