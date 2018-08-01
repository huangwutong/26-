package com.bu.opt;

import java.util.Vector;

import com.po.CargoInfo;
import com.service.DAOService;
import com.struts.form.OptCargoInfoForm;

public class CargoInfoBusiness implements IBusiness {
	
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
		CargoInfo cg = daos.getCargoinfodao().findById(new Integer(pkid));
		OptCargoInfoForm cgform = new OptCargoInfoForm();
		
		//将持久化类转换为ActionForm类
		cgform.setCargoid(cg.getCargoId().toString());
		cgform.setCargoname(cg.getCargoName());
		cgform.setCargoweight(cg.getCargoWeight());
		cgform.setCargobulk(cg.getCargoBulk());
		cgform.setCargonum(cg.getCargoNum());
		cgform.setCargounit(cg.getCargoUnit());
		cgform.setCargovalue(cg.getCargoValue());
		cgform.setCargofreight(cg.getCargoFreight());
		cgform.setCargoamend(cg.getCargoAmends());
		cgform.setCargomemo(cg.getCargoMemo());
		cgform.setCargostate(cg.getCargoState().toString());
		cgform.setBranchid(cg.getBranchInfo().getBranchId().toString());
		cgform.setBranchname(cg.getBranchInfo().getBranchName());
		cgform.setCargostartdata(cg.getCargoStartData());
		cgform.setCargoenddata(cg.getCargoEndData());
		
		return cgform;
	}

	public boolean save(Object ob) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean update(Object ob) {
		// TODO Auto-generated method stub
		OptCargoInfoForm cif = (OptCargoInfoForm) ob;
		CargoInfo ci = daos.getCargoinfodao().findById(new Integer(cif.getCargoid()));
		
		//将ActionForm转换成持久化类
		ci.setCargoName(cif.getCargoname());
		ci.setCargoWeight(cif.getCargoweight());
		ci.setCargoBulk(cif.getCargobulk());
		ci.setCargoFreight(cif.getCargofreight());
		ci.setCargoAmends(cif.getCargoamend());
		ci.setCargoEndData(cif.getCargoenddata());
		ci.setCargoMemo(cif.getCargomemo());
		ci.setCargoNum(cif.getCargonum());
		ci.setCargoStartData(cif.getCargostartdata());
		ci.setCargoState(new Integer(cif.getCargostate()));
		ci.setCargoUnit(cif.getCargounit());
		ci.setCargoValue(cif.getCargovalue());
		ci.setBranchInfo(daos.getBranchinfodao().findById(new Integer(cif.getBranchid())));
		
		try {
			daos.getCargoinfodao().attachDirty(ci);
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

}
