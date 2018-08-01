package com.bu.carmack;

import java.util.*;
import com.po.*;
import com.service.*;
import com.struts.form.*;

public class BranchInfoBusiness implements IBusiness {
	private DAOService daos;
	public DAOService getDaos()
	{
		return daos;
	}
	public void setDaos(DAOService daos)
	{
		this.daos=daos;
	}
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		BranchInfo bi=daos.getBranchinfodao().findById(new Integer(id));
		try {
			daos.getBranchinfodao().delete(bi);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector vcBranchInfo=new Vector();
		List ls=daos.getBranchinfodao().findAll();
		for(Object object:ls)
		{
			BranchInfo bi=(BranchInfo)object;
			CarmackBranchInfoForm cbif=new CarmackBranchInfoForm();
			cbif.setBranchID(bi.getBranchId().toString());
			cbif.setBranchName(bi.getBranchName());
			cbif.setBranchLinkMan(bi.getBranchLinkMan());
			cbif.setBranchPhone(bi.getBranchPhone());
			cbif.setBranchAddress(bi.getBranchAddress());
			cbif.setBranchEmail(bi.getBranchEmail());
			vcBranchInfo.add(cbif);
		}
		return vcBranchInfo;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		CarmackBranchInfoForm cbif=new CarmackBranchInfoForm();
		BranchInfo bi=daos.getBranchinfodao().findById(new Integer(cbif.getBranchID()));
		cbif.setBranchName(bi.getBranchName());
		cbif.setBranchLinkMan(bi.getBranchLinkMan());
		cbif.setBranchPhone(bi.getBranchPhone());
		cbif.setBranchAddress(bi.getBranchAddress());
		cbif.setBranchEmail(bi.getBranchEmail());
		return cbif;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		CarmackBranchInfoForm cbif=(CarmackBranchInfoForm) ob;
		BranchInfo bi=new BranchInfo();
		bi.setBranchName(cbif.getBranchName());
		bi.setBranchLinkMan(cbif.getBranchLinkMan());
		bi.setBranchPhone(cbif.getBranchPhone());
		bi.setBranchAddress(cbif.getBranchAddress());
		bi.setBranchEmail(cbif.getBranchEmail());
		
		try {
			daos.getBranchinfodao().save(bi);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		CarmackBranchInfoForm cbif=(CarmackBranchInfoForm) ob;
		BranchInfo bi=daos.getBranchinfodao().findById(new Integer(cbif.getBranchID()));
		bi.setBranchId(new Integer(cbif.getBranchID()));
		bi.setBranchName(cbif.getBranchName());
		bi.setBranchLinkMan(cbif.getBranchLinkMan());
		bi.setBranchPhone(cbif.getBranchPhone());
		bi.setBranchAddress(cbif.getBranchAddress());
		bi.setBranchEmail(cbif.getBranchEmail());
		try {
			daos.getBranchinfodao().save(bi);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
