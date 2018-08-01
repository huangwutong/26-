package com.service;
import com.bu.carmack.*;
public class CarmackBusinessService {
	private BranchInfoBusiness branchinfobu;
	private DriverInfoBusiness driverinfobu;
	private TruckInfoBusiness truckinfobu;
	private TruckModelBusiness truckmodelbu;
	private UserInfoBusiness userinfobu;
	private SystemLogBusiness systemlogbu;
	public BranchInfoBusiness getBranchinfobu() {
		return branchinfobu;
	}
	public void setBranchinfobu(BranchInfoBusiness branchinfobu) {
		this.branchinfobu = branchinfobu;
	}
	public DriverInfoBusiness getDriverinfobu() {
		return driverinfobu;
	}
	public void setDriverinfobu(DriverInfoBusiness driverinfobu) {
		this.driverinfobu = driverinfobu;
	}
	public TruckInfoBusiness getTruckinfobu() {
		return truckinfobu;
	}
	public void setTruckinfobu(TruckInfoBusiness truckinfobu) {
		this.truckinfobu = truckinfobu;
	}
	public TruckModelBusiness getTruckmodelbu() {
		return truckmodelbu;
	}
	public void setTruckmodelbu(TruckModelBusiness truckmodelbu) {
		this.truckmodelbu = truckmodelbu;
	}
	public UserInfoBusiness getUserinfobu() {
		return userinfobu;
	}
	public void setUserinfobu(UserInfoBusiness userinfobu) {
		this.userinfobu = userinfobu;
	}
	public SystemLogBusiness getSystemlogbu() {
		return systemlogbu;
	}
	public void setSystemlogbu(SystemLogBusiness systemlogbu) {
		this.systemlogbu = systemlogbu;
	}

}
