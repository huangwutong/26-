package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * TruckLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class TruckLog implements java.io.Serializable {

	// Fields

	private Integer tlid;
	private DriverInfo driverInfo;
	private BranchInfo branchInfo;
	private TruckInfo truckInfo;
	private String tlstartData;
	private String tlarrive;
	private Set trafficLogs = new HashSet(0);

	// Constructors

	/** default constructor */
	public TruckLog() {
	}

	/** full constructor */
	public TruckLog(DriverInfo driverInfo, BranchInfo branchInfo,
			TruckInfo truckInfo, String tlstartData, String tlarrive,
			Set trafficLogs) {
		this.driverInfo = driverInfo;
		this.branchInfo = branchInfo;
		this.truckInfo = truckInfo;
		this.tlstartData = tlstartData;
		this.tlarrive = tlarrive;
		this.trafficLogs = trafficLogs;
	}

	// Property accessors

	public Integer getTlid() {
		return this.tlid;
	}

	public void setTlid(Integer tlid) {
		this.tlid = tlid;
	}

	public DriverInfo getDriverInfo() {
		return this.driverInfo;
	}

	public void setDriverInfo(DriverInfo driverInfo) {
		this.driverInfo = driverInfo;
	}

	public BranchInfo getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public TruckInfo getTruckInfo() {
		return this.truckInfo;
	}

	public void setTruckInfo(TruckInfo truckInfo) {
		this.truckInfo = truckInfo;
	}

	public String getTlstartData() {
		return this.tlstartData;
	}

	public void setTlstartData(String tlstartData) {
		this.tlstartData = tlstartData;
	}

	public String getTlarrive() {
		return this.tlarrive;
	}

	public void setTlarrive(String tlarrive) {
		this.tlarrive = tlarrive;
	}

	public Set getTrafficLogs() {
		return this.trafficLogs;
	}

	public void setTrafficLogs(Set trafficLogs) {
		this.trafficLogs = trafficLogs;
	}

}