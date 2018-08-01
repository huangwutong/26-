package com.bu.mars;

import java.util.*;

import com.service.DAOService;
import com.struts.form.*;
import com.po.*;

public class DriverInfoBusiness implements ibusiness {
	private DAOService daos;
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	public Vector findAll() {
		// TODO Auto-generated method stub
		Vector drivevc=new Vector();
		List ls=daos.getDriverinfodao().findAll();
		for (Object object : ls) {
			DriverInfo driver=(DriverInfo)object;
			MarsDriverInfoForm driverf=new MarsDriverInfoForm();
			driverf.setDriverid(driver.getDriverId().toString());
			driverf.setDrivername(driver.getDriverName());
			driverf.setBranchid(driver.getBranchInfo().getBranchName());
			driverf.setDriverage(driver.getDriverAge());
			driverf.setDriversex(driver.getDriverSex());
			driverf.setDriverphoto(driver.getDriverPhoto());
			driverf.setDrivercardid(driver.getDriverCardId());
			driverf.setDriverdrivecardid(driver.getDriverDriveCardId());
			driverf.setDriverphone(driver.getDriverPhone());
			driverf.setDrivermemo(driver.getDriverMemo());
			if(driver.getDriverIsVacancy().toString().equals("0"))
			{
				driverf.setDriverisvacancy("¿ÕÏÐ");
			}
			if(driver.getDriverIsVacancy().toString().equals("1"))
			{
				driverf.setDriverisvacancy("ÔÚÍ¾");
			}
			if(driver.getDriverIsVacancy().toString().equals("2"))
			{
				driverf.setDriverisvacancy("Çë¼Ù");
			}
			drivevc.add(driverf);
		}
		return drivevc;
	}
	public Vector findByBranchID(String id)
	{
		Vector drivevc=new Vector();
		List ls=daos.getDriverinfodao().findByBranchID(new Integer(id));
		for (Object object : ls) {
			DriverInfo driver=(DriverInfo)object;
			MarsDriverInfoForm driverf=new MarsDriverInfoForm();
			driverf.setDriverid(driver.getDriverId().toString());
			driverf.setDrivername(driver.getDriverName());
			driverf.setBranchid(driver.getBranchInfo().getBranchName());
			driverf.setDriverage(driver.getDriverAge());
			driverf.setDriversex(driver.getDriverSex());
			driverf.setDriverphoto(driver.getDriverPhoto());
			driverf.setDrivercardid(driver.getDriverCardId());
			driverf.setDriverdrivecardid(driver.getDriverDriveCardId());
			driverf.setDriverphone(driver.getDriverPhone());
			driverf.setDrivermemo(driver.getDriverMemo());
			if(driver.getDriverIsVacancy().toString().equals("0"))
			{
				driverf.setDriverisvacancy("¿ÕÏÐ");
			}
			if(driver.getDriverIsVacancy().toString().equals("1"))
			{
				driverf.setDriverisvacancy("ÔÚÍ¾");
			}
			if(driver.getDriverIsVacancy().toString().equals("2"))
			{
				driverf.setDriverisvacancy("Çë¼Ù");
			}
			drivevc.add(driverf);
		}
		return drivevc;
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

	public DAOService getDaos() {
		return daos;
	}

	public void setDaos(DAOService daos) {
		this.daos = daos;
	}

}
