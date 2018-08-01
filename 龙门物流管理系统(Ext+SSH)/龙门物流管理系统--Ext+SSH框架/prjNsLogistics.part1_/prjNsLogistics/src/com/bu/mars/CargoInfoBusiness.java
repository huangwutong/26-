package com.bu.mars;

import java.util.*;
import com.struts.*;
import com.struts.form.MarsCargoInfoForm;
import com.po.*;
import com.service.*;
public class CargoInfoBusiness implements ibusiness {
	private DAOService daos;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		CargoInfo cargo=daos.getCargoinfodao().findById(new Integer(id));
		try {
			daos.getCargoinfodao().delete(cargo);
			return true;
		} catch (RuntimeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector cargovc=new Vector();
		List ls=daos.getCargoinfodao().findAll();
		for (Object object : ls) {
			CargoInfo cargo=new CargoInfo();
			MarsCargoInfoForm cargof=new MarsCargoInfoForm();
			cargof.setCargoid(cargo.getCargoId().toString());
			cargof.setCargoname(cargo.getCargoName());
			cargof.setCargoweight(cargo.getCargoWeight());
			cargof.setCargobulk(cargo.getCargoBulk());
			cargof.setCargonum(cargo.getCargoNum());
			cargof.setCargounit(cargo.getCargoUnit());
			cargof.setCargovalue(cargo.getCargoValue());
			cargof.setCargofreight(cargo.getCargoFreight());
			cargof.setCargoamends(cargo.getCargoAmends());
			cargof.setCargomemo(cargo.getCargoMemo());
			cargof.setCargostate(cargo.getCargoState().toString());
			cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
			cargof.setBranchname(cargo.getBranchInfo().getBranchName());
			cargof.setCargostartdata(cargo.getCargoStartData());
			cargof.setCargoenddata(cargo.getCargoEndData());
			cargovc.add(cargo);
		}
		return cargovc;
	}

	public Object findById(String id) {
		// TODO Auto-generated method stub
		CargoInfo cargo=daos.getCargoinfodao().findById(new Integer(id));
		MarsCargoInfoForm cargof=new MarsCargoInfoForm();
		cargof.setCargoid(cargo.getCargoId().toString());
		cargof.setCargoname(cargo.getCargoName());
		cargof.setCargoweight(cargo.getCargoWeight());
		cargof.setCargobulk(cargo.getCargoBulk());
		cargof.setCargonum(cargo.getCargoNum());
		cargof.setCargounit(cargo.getCargoUnit());
		cargof.setCargovalue(cargo.getCargoValue());
		cargof.setCargofreight(cargo.getCargoFreight());
		cargof.setCargoamends(cargo.getCargoAmends());
		cargof.setCargomemo(cargo.getCargoMemo());
		cargof.setCargostate(cargo.getCargoState().toString());
		cargof.setBranchid(cargo.getBranchInfo().getBranchId().toString());
		cargof.setBranchname(cargo.getBranchInfo().getBranchName());
		cargof.setCargostartdata(cargo.getCargoStartData());
		cargof.setCargoenddata(cargo.getCargoEndData());
		return cargof;
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
