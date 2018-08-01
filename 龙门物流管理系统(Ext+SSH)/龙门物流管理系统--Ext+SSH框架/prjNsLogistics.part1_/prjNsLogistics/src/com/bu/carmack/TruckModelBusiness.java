package com.bu.carmack;

import java.util.List;
import java.util.Vector;
import com.struts.form.*;
import com.service.*;
import com.po.*;

public class TruckModelBusiness implements IBusiness {
	private DAOService daos;
	public DAOService getDaos() {
		return daos;
	}
	public void setDaos(DAOService daos)
	{
		this.daos=daos;
	}

	public boolean delete(String id) {
		// TODO Auto-generated method stub
		TruckModel tm=daos.getTruckmodeldao().findById(new Integer(id));
		try {
			daos.getTruckmodeldao().delete(tm);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector vcTruckModel=new Vector();
		List ls=daos.getTruckmodeldao().findAll();
		
		for (Object object : ls) {
			TruckModel tm=(TruckModel) object;
			CarmackTruckModelForm ctf=new CarmackTruckModelForm();
			ctf.setTMID(tm.getTmid().toString());
			ctf.setTMName(tm.getTmname());
			ctf.setTMWeight(tm.getTmweight());
			ctf.setTMCubage(tm.getTmcubage());
			ctf.setTMPassenger(tm.getTmpassenger().toString());
			
			vcTruckModel.add(ctf);
		}
		return vcTruckModel;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		TruckModel tm=daos.getTruckmodeldao().findById(new Integer(id));
		CarmackTruckModelForm ctm=new CarmackTruckModelForm();
		ctm.setTMID(tm.getTmid().toString());
		ctm.setTMName(tm.getTmname());
		ctm.setTMWeight(tm.getTmweight());
		ctm.setTMCubage(tm.getTmcubage());
		ctm.setTMPassenger(tm.getTmpassenger().toString());
		
		
		return ctm;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		CarmackTruckModelForm ctmf=(CarmackTruckModelForm) ob;
		TruckModel tm=new TruckModel();
		tm.setTmname(ctmf.getTMName());
		tm.setTmweight(ctmf.getTMWeight());
		tm.setTmcubage(ctmf.getTMCubage());
		tm.setTmpassenger(new Integer(ctmf.getTMPassenger()));
		try {
			//
			daos.getTruckmodeldao().save(tm);
			return true;
		} catch (RuntimeException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		CarmackTruckModelForm ctmf=(CarmackTruckModelForm) ob;
		TruckModel tm=daos.getTruckmodeldao().findById(new Integer(ctmf.getTMID()));
		tm.setTmname(ctmf.getTMName());
		tm.setTmweight(ctmf.getTMWeight());
		tm.setTmcubage(ctmf.getTMCubage());
		tm.setTmpassenger(new Integer(ctmf.getTMPassenger()));
		try {
			
			daos.getTruckmodeldao().attachDirty(tm);
			return true;
		} catch (RuntimeException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return false;
	}

}
