package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * BranchInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class BranchInfo implements java.io.Serializable {

	// Fields

	private Integer branchId;
	private String branchName;
	private String branchLinkMan;
	private String branchPhone;
	private String branchAddress;
	private String branchEmail;
	private Set billInfosForReceiveBranchId = new HashSet(0);
	private Set trafficLogs = new HashSet(0);
	private Set cargoInfos = new HashSet(0);
	private Set truckLogs = new HashSet(0);
	private Set systemLogs = new HashSet(0);
	private Set billInfosForSendBranchId = new HashSet(0);
	private Set afficheInfos = new HashSet(0);
	private Set userInfos = new HashSet(0);
	private Set truckInfos = new HashSet(0);
	private Set customerInfos = new HashSet(0);
	private Set driverInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public BranchInfo() {
	}

	/** full constructor */
	public BranchInfo(String branchName, String branchLinkMan,
			String branchPhone, String branchAddress, String branchEmail,
			Set billInfosForReceiveBranchId, Set trafficLogs, Set cargoInfos,
			Set truckLogs, Set systemLogs, Set billInfosForSendBranchId,
			Set afficheInfos, Set userInfos, Set truckInfos, Set customerInfos,
			Set driverInfos) {
		this.branchName = branchName;
		this.branchLinkMan = branchLinkMan;
		this.branchPhone = branchPhone;
		this.branchAddress = branchAddress;
		this.branchEmail = branchEmail;
		this.billInfosForReceiveBranchId = billInfosForReceiveBranchId;
		this.trafficLogs = trafficLogs;
		this.cargoInfos = cargoInfos;
		this.truckLogs = truckLogs;
		this.systemLogs = systemLogs;
		this.billInfosForSendBranchId = billInfosForSendBranchId;
		this.afficheInfos = afficheInfos;
		this.userInfos = userInfos;
		this.truckInfos = truckInfos;
		this.customerInfos = customerInfos;
		this.driverInfos = driverInfos;
	}

	// Property accessors

	public Integer getBranchId() {
		return this.branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

	public String getBranchName() {
		return this.branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getBranchLinkMan() {
		return this.branchLinkMan;
	}

	public void setBranchLinkMan(String branchLinkMan) {
		this.branchLinkMan = branchLinkMan;
	}

	public String getBranchPhone() {
		return this.branchPhone;
	}

	public void setBranchPhone(String branchPhone) {
		this.branchPhone = branchPhone;
	}

	public String getBranchAddress() {
		return this.branchAddress;
	}

	public void setBranchAddress(String branchAddress) {
		this.branchAddress = branchAddress;
	}

	public String getBranchEmail() {
		return this.branchEmail;
	}

	public void setBranchEmail(String branchEmail) {
		this.branchEmail = branchEmail;
	}

	public Set getBillInfosForReceiveBranchId() {
		return this.billInfosForReceiveBranchId;
	}

	public void setBillInfosForReceiveBranchId(Set billInfosForReceiveBranchId) {
		this.billInfosForReceiveBranchId = billInfosForReceiveBranchId;
	}

	public Set getTrafficLogs() {
		return this.trafficLogs;
	}

	public void setTrafficLogs(Set trafficLogs) {
		this.trafficLogs = trafficLogs;
	}

	public Set getCargoInfos() {
		return this.cargoInfos;
	}

	public void setCargoInfos(Set cargoInfos) {
		this.cargoInfos = cargoInfos;
	}

	public Set getTruckLogs() {
		return this.truckLogs;
	}

	public void setTruckLogs(Set truckLogs) {
		this.truckLogs = truckLogs;
	}

	public Set getSystemLogs() {
		return this.systemLogs;
	}

	public void setSystemLogs(Set systemLogs) {
		this.systemLogs = systemLogs;
	}

	public Set getBillInfosForSendBranchId() {
		return this.billInfosForSendBranchId;
	}

	public void setBillInfosForSendBranchId(Set billInfosForSendBranchId) {
		this.billInfosForSendBranchId = billInfosForSendBranchId;
	}

	public Set getAfficheInfos() {
		return this.afficheInfos;
	}

	public void setAfficheInfos(Set afficheInfos) {
		this.afficheInfos = afficheInfos;
	}

	public Set getUserInfos() {
		return this.userInfos;
	}

	public void setUserInfos(Set userInfos) {
		this.userInfos = userInfos;
	}

	public Set getTruckInfos() {
		return this.truckInfos;
	}

	public void setTruckInfos(Set truckInfos) {
		this.truckInfos = truckInfos;
	}

	public Set getCustomerInfos() {
		return this.customerInfos;
	}

	public void setCustomerInfos(Set customerInfos) {
		this.customerInfos = customerInfos;
	}

	public Set getDriverInfos() {
		return this.driverInfos;
	}

	public void setDriverInfos(Set driverInfos) {
		this.driverInfos = driverInfos;
	}

}