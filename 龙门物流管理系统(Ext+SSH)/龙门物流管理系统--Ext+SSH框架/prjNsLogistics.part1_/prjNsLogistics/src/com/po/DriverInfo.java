package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * DriverInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class DriverInfo implements java.io.Serializable {

	// Fields

	private Integer driverId;
	private BranchInfo branchInfo;
	private String driverName;
	private String driverAge;
	private String driverSex;
	private String driverPhoto;
	private String driverDriveCardId;
	private String driverCardId;
	private String driverPhone;
	private String driverMemo;
	private Integer driverIsVacancy;
	private Set truckLogs = new HashSet(0);

	// Constructors

	/** default constructor */
	public DriverInfo() {
	}

	/** full constructor */
	public DriverInfo(BranchInfo branchInfo, String driverName,
			String driverAge, String driverSex, String driverPhoto,
			String driverDriveCardId, String driverCardId, String driverPhone,
			String driverMemo, Integer driverIsVacancy, Set truckLogs) {
		this.branchInfo = branchInfo;
		this.driverName = driverName;
		this.driverAge = driverAge;
		this.driverSex = driverSex;
		this.driverPhoto = driverPhoto;
		this.driverDriveCardId = driverDriveCardId;
		this.driverCardId = driverCardId;
		this.driverPhone = driverPhone;
		this.driverMemo = driverMemo;
		this.driverIsVacancy = driverIsVacancy;
		this.truckLogs = truckLogs;
	}

	// Property accessors

	public Integer getDriverId() {
		return this.driverId;
	}

	public void setDriverId(Integer driverId) {
		this.driverId = driverId;
	}

	public BranchInfo getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public String getDriverName() {
		return this.driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getDriverAge() {
		return this.driverAge;
	}

	public void setDriverAge(String driverAge) {
		this.driverAge = driverAge;
	}

	public String getDriverSex() {
		return this.driverSex;
	}

	public void setDriverSex(String driverSex) {
		this.driverSex = driverSex;
	}

	public String getDriverPhoto() {
		return this.driverPhoto;
	}

	public void setDriverPhoto(String driverPhoto) {
		this.driverPhoto = driverPhoto;
	}

	public String getDriverDriveCardId() {
		return this.driverDriveCardId;
	}

	public void setDriverDriveCardId(String driverDriveCardId) {
		this.driverDriveCardId = driverDriveCardId;
	}

	public String getDriverCardId() {
		return this.driverCardId;
	}

	public void setDriverCardId(String driverCardId) {
		this.driverCardId = driverCardId;
	}

	public String getDriverPhone() {
		return this.driverPhone;
	}

	public void setDriverPhone(String driverPhone) {
		this.driverPhone = driverPhone;
	}

	public String getDriverMemo() {
		return this.driverMemo;
	}

	public void setDriverMemo(String driverMemo) {
		this.driverMemo = driverMemo;
	}

	public Integer getDriverIsVacancy() {
		return this.driverIsVacancy;
	}

	public void setDriverIsVacancy(Integer driverIsVacancy) {
		this.driverIsVacancy = driverIsVacancy;
	}

	public Set getTruckLogs() {
		return this.truckLogs;
	}

	public void setTruckLogs(Set truckLogs) {
		this.truckLogs = truckLogs;
	}

}