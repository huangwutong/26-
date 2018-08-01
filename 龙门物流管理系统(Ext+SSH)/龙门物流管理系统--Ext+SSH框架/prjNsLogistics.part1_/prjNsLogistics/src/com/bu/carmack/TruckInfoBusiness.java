package com.bu.carmack;

import java.text.ParseException;
import java.util.*;

import com.po.*;
import com.service.*;
import com.struts.form.*;

public class TruckInfoBusiness implements IBusiness {
	private DAOService daos;
	public DAOService getDaos() {
		return daos;
	}
	public void setDaos(DAOService daos) {
		this.daos = daos;
	}
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		TruckInfo e=daos.getTruckinfodao().findById(new Integer(id));
		try {
			daos.getTruckinfodao().delete(e);
			return true;
		} catch (RuntimeException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
		
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector vcTruckInfo=new Vector();
		List ls=daos.getTruckinfodao().findAll();
		
		for (Object object : ls) {
			TruckInfo ti=(TruckInfo) object;
			CarmackTruckInfoForm ctf=new CarmackTruckInfoForm();
			ctf.setTruckID(ti.getTruckId().toString());
			ctf.setTruckNum(ti.getTruckNum());
			ctf.setTruckEngineNum(ti.getTruckEngineNum());
			ctf.setTruckRunNum(ti.getTruckRunNum());
			ctf.setTruckInsuranceNum(ti.getTruckInsuranceNum());
			ctf.setTMID(ti.getTruckModel().getTmid().toString());
			ctf.setTruckColor(ti.getTruckColor());
			//图片功能还未实现
			ctf.setTruckBuyData(ti.getTruckBuyData());
			ctf.setBranchID(ti.getBranchInfo().getBranchId().toString());
			ctf.setBranchName(ti.getBranchInfo().getBranchName());
			ctf.setBruckIsVacancy(ti.getTruckIsVacancy().toString());
			vcTruckInfo.add(ctf);
		}
		return vcTruckInfo;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		TruckInfo ctf=daos.getTruckinfodao().findById(new Integer(id));
		CarmackTruckInfoForm ef=new CarmackTruckInfoForm();
		ef.setTruckNum(ctf.getTruckNum());
		ef.setTruckEngineNum(ctf.getTruckEngineNum());
		ef.setTruckRunNum(ctf.getTruckRunNum());
		ef.setTruckInsuranceNum(ctf.getTruckInsuranceNum());
		ef.setTMID(ctf.getTruckModel().getTmid().toString());
		ef.setTruckColor(ctf.getTruckColor());
		ef.setBranchID(ctf.getBranchInfo().getBranchId().toString());
		ef.setBranchName(ctf.getBranchInfo().getBranchName());
		ef.setTruckBuyData(ctf.getTruckBuyData());
		ef.setBruckIsVacancy(ctf.getTruckIsVacancy().toString());
		return ef;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		CarmackTruckInfoForm ef=(CarmackTruckInfoForm) ob;
		TruckInfo e=new TruckInfo();
		e.setTruckNum(ef.getTruckNum());
		e.setTruckEngineNum(ef.getTruckEngineNum());
		e.setTruckRunNum(ef.getTruckRunNum());
		e.setTruckInsuranceNum(ef.getTruckInsuranceNum());
		TruckModel tm = daos.getTruckmodeldao().findById(new Integer(ef.getTMID()));
		e.setTruckModel(tm);
		e.setTruckColor(ef.getTruckColor());
		e.setTruckBuyData(ef.getTruckBuyData());
		e.setBranchInfo(daos.getBranchinfodao().findById(new Integer(ef.getBranchID())));
		e.setTruckIsVacancy(new Integer(ef.getBruckIsVacancy()));
		
		
		try {
			daos.getTruckinfodao().save(e);
			return true;
		} catch (RuntimeException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		CarmackTruckInfoForm ef=(CarmackTruckInfoForm) ob;
		TruckInfo e=daos.getTruckinfodao().findById(new Integer(ef.getTruckID()));
		e.setTruckId(new Integer(ef.getTruckID()));
		e.setTruckNum(ef.getTruckNum());
		e.setTruckEngineNum(ef.getTruckEngineNum());
		e.setTruckRunNum(ef.getTruckRunNum());
		e.setTruckInsuranceNum(ef.getTruckInsuranceNum());
		TruckModel tm = daos.getTruckmodeldao().findById(new Integer(ef.getTMID()));
		e.setTruckModel(tm);
		e.setTruckColor(ef.getTruckColor());
		e.setTruckBuyData(ef.getTruckBuyData());
		BranchInfo bi=daos.getBranchinfodao().findById(new Integer(ef.getBranchID()));
		e.setBranchInfo(bi);
		e.setTruckIsVacancy(new Integer(ef.getBruckIsVacancy()));
		
		
		try {
			//更新员工对象
			daos.getTruckinfodao().attachDirty(e);
			return true;
		} catch (RuntimeException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return false;
	}

}
