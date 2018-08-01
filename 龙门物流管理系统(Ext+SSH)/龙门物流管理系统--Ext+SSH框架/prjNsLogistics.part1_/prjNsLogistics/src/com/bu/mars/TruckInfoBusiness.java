package com.bu.mars;

import java.util.*;
import com.struts.form.*;
import com.po.*;
import com.service.*;
public class TruckInfoBusiness implements ibusiness {
	private DAOService daos;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector truckvc=new Vector();
		List ls=daos.getTruckinfodao().findAll();
		for (Object object : ls) {
			TruckInfo truck=(TruckInfo)object;
			MarsTruckInfoForm truckf=new MarsTruckInfoForm();
			truckf.setTruckid(truck.getTruckId().toString());
			truckf.setTrucknum(truck.getTruckNum());
			truckf.setTruckenginenum(truck.getTruckEngineNum());
			truckf.setTruckrunnum(truck.getTruckRunNum());
			truckf.setTruckinsurancenum(truck.getTruckInsuranceNum());
			truckf.setTmid(truck.getTruckModel().getTmname());
			truckf.setTruckcolor(truck.getTruckColor());
			truckf.setTruckphoto(truck.getTruckPhoto());
			truckf.setTruckbuydata(truck.getTruckBuyData());
			truckf.setBranchid(truck.getBranchInfo().getBranchName());
			if(truck.getTruckIsVacancy().toString().equals("0")){
				truckf.setTruckisvacancy("¿ÕÏÐ");	
			}
			if(truck.getTruckIsVacancy().toString().equals("1")){
				truckf.setTruckisvacancy("ÔÚÍ¾");	
			}
			if(truck.getTruckIsVacancy().toString().equals("2")){
				truckf.setTruckisvacancy("Î¬ÐÞ");	
			}
			truckvc.add(truckf);
		}
		return truckvc;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		TruckInfo truck =daos.getTruckinfodao().findById(new Integer(id));
		MarsTruckInfoForm truckf=new MarsTruckInfoForm();
		truckf.setTruckid(truck.getTruckId().toString());
		truckf.setTrucknum(truck.getTruckNum());
		truckf.setTruckenginenum(truck.getTruckEngineNum());
		truckf.setTruckrunnum(truck.getTruckRunNum());
		truckf.setTruckinsurancenum(truck.getTruckInsuranceNum());
		truckf.setTmid(truck.getTruckModel().getTmid().toString());
		truckf.setTruckcolor(truck.getTruckColor());
		truckf.setTruckphoto(truck.getTruckPhoto());
		truckf.setTruckbuydata(truck.getTruckBuyData());
		truckf.setBranchid(truck.getBranchInfo().getBranchId().toString());
		truckf.setTruckisvacancy(truck.getTruckIsVacancy().toString());
		return truckf;
	}
	public Vector findByBranchID(String id){
		Vector truckvc=new Vector();
		List ls=daos.getTruckinfodao().findByBranchID(new Integer(id));
		for (Object object : ls) {
			TruckInfo truck=(TruckInfo)object;
			MarsTruckInfoForm truckf=new MarsTruckInfoForm();
			truckf.setTruckid(truck.getTruckId().toString());
			truckf.setTrucknum(truck.getTruckNum());
			truckf.setTruckenginenum(truck.getTruckEngineNum());
			truckf.setTruckrunnum(truck.getTruckRunNum());
			truckf.setTruckinsurancenum(truck.getTruckInsuranceNum());
			truckf.setTmid(truck.getTruckModel().getTmname());
			truckf.setTruckcolor(truck.getTruckColor());
			truckf.setTruckphoto(truck.getTruckPhoto());
			truckf.setTruckbuydata(truck.getTruckBuyData());
			truckf.setBranchid(truck.getBranchInfo().getBranchName());
			if(truck.getTruckIsVacancy().toString().equals("0")){
				truckf.setTruckisvacancy("¿ÕÏÐ");	
			}
			if(truck.getTruckIsVacancy().toString().equals("1")){
				truckf.setTruckisvacancy("ÔÚÍ¾");	
			}
			if(truck.getTruckIsVacancy().toString().equals("2")){
				truckf.setTruckisvacancy("Î¬ÐÞ");	
			}
			truckvc.add(truckf);
		}
		return truckvc;
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
