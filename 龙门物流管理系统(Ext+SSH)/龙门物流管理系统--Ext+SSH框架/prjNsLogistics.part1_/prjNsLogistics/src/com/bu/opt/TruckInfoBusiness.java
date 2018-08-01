package com.bu.opt;

import java.util.List;
import java.util.Vector;

import com.po.BranchInfo;
import com.po.TruckInfo;
import com.po.TruckModel;
import com.service.DAOService;
import com.struts.form.OptTruckInfoForm;

public class TruckInfoBusiness implements IBusiness {

	//声明私有的DAOService
	private DAOService daos;
	
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
			OptTruckInfoForm ctf=new OptTruckInfoForm();
			ctf.setTruckid(ti.getTruckId().toString());
			ctf.setTrucknum(ti.getTruckNum());
			ctf.setTruckenginenum(ti.getTruckEngineNum());
			ctf.setTruckrunnum(ti.getTruckRunNum());
			ctf.setTruckinsurancenum(ti.getTruckInsuranceNum());
			ctf.setTmid(ti.getTruckModel().getTmid().toString());
			ctf.setTruckcolor(ti.getTruckColor());
			ctf.setTruckphoto(ti.getTruckPhoto());
			ctf.setTruckbuydata(ti.getTruckBuyData());
			ctf.setBranchid(ti.getBranchInfo().getBranchId().toString());
			ctf.setTruckisvacancy(ti.getTruckIsVacancy().toString());
			vcTruckInfo.add(ctf);
		}
		return vcTruckInfo;
	}

	public Object findByID(String id) {
		// TODO Auto-generated method stub
		TruckInfo ctf=daos.getTruckinfodao().findById(new Integer(id));
		OptTruckInfoForm ef=new OptTruckInfoForm();
		ef.setTruckid(id);
		ef.setTrucknum(ctf.getTruckNum());
		ef.setTruckenginenum(ctf.getTruckEngineNum());
		ef.setTruckrunnum(ctf.getTruckRunNum());
		ef.setTruckinsurancenum(ctf.getTruckInsuranceNum());
		ef.setTmid(ctf.getTruckModel().getTmid().toString());
		ef.setTruckcolor(ctf.getTruckColor());
		ef.setBranchid(ctf.getBranchInfo().getBranchId().toString());
		ef.setTruckbuydata(ctf.getTruckBuyData());
		ef.setTruckisvacancy(ctf.getTruckIsVacancy().toString());
		return ef;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		OptTruckInfoForm ef=(OptTruckInfoForm) ob;
		TruckInfo e=new TruckInfo();
		e.setTruckNum(ef.getTrucknum());
		e.setTruckEngineNum(ef.getTruckenginenum());
		e.setTruckRunNum(ef.getTruckrunnum());
		e.setTruckInsuranceNum(ef.getTruckinsurancenum());
		TruckModel tm = daos.getTruckmodeldao().findById(new Integer(ef.getTmid()));
		e.setTruckModel(tm);
		e.setTruckColor(ef.getTruckcolor());
		e.setTruckBuyData(ef.getTruckbuydata());
		e.setTruckIsVacancy(new Integer(ef.getTruckisvacancy()));
	
		try {
			//保存员工对象
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
		OptTruckInfoForm ef=(OptTruckInfoForm) ob;
		TruckInfo e=daos.getTruckinfodao().findById(new Integer(ef.getTruckid()));
		e.setTruckNum(ef.getTrucknum());
		e.setTruckEngineNum(ef.getTruckenginenum());
		e.setTruckRunNum(ef.getTruckrunnum());
		e.setTruckInsuranceNum(ef.getTruckinsurancenum());
		TruckModel tm = daos.getTruckmodeldao().findById(new Integer(ef.getTmid()));
		e.setTruckModel(tm);
		e.setTruckColor(ef.getTruckcolor());
		e.setTruckBuyData(ef.getTruckbuydata());
		BranchInfo bi=daos.getBranchinfodao().findById(new Integer(ef.getBranchid()));
		e.setBranchInfo(bi);
		e.setTruckIsVacancy(new Integer(ef.getTruckisvacancy()));
		
		
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

	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}

}
