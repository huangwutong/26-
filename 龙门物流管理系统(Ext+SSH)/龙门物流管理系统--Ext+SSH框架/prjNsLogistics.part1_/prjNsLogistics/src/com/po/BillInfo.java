package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * BillInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class BillInfo implements java.io.Serializable {

	// Fields

	private Integer billId;
	private UserInfo userInfo;
	private CustomerInfo customerInfoByReceiveId;
	private BranchInfo branchInfoBySendBranchId;
	private BillState billState;
	private CustomerInfo customerInfoBySendId;
	private BranchInfo branchInfoByReceiveBranchId;
	private String truckLine;
	private String payerName;
	private String billData;
	private String billMemo;
	private Set cargoVectors = new HashSet(0);
	private Set trafficLogs = new HashSet(0);

	// Constructors

	/** default constructor */
	public BillInfo() {
	}

	/** full constructor */
	public BillInfo(UserInfo userInfo, CustomerInfo customerInfoByReceiveId,
			BranchInfo branchInfoBySendBranchId, BillState billState,
			CustomerInfo customerInfoBySendId,
			BranchInfo branchInfoByReceiveBranchId, String truckLine,
			String payerName, String billData, String billMemo,
			Set cargoVectors, Set trafficLogs) {
		this.userInfo = userInfo;
		this.customerInfoByReceiveId = customerInfoByReceiveId;
		this.branchInfoBySendBranchId = branchInfoBySendBranchId;
		this.billState = billState;
		this.customerInfoBySendId = customerInfoBySendId;
		this.branchInfoByReceiveBranchId = branchInfoByReceiveBranchId;
		this.truckLine = truckLine;
		this.payerName = payerName;
		this.billData = billData;
		this.billMemo = billMemo;
		this.cargoVectors = cargoVectors;
		this.trafficLogs = trafficLogs;
	}

	// Property accessors

	public Integer getBillId() {
		return this.billId;
	}

	public void setBillId(Integer billId) {
		this.billId = billId;
	}

	public UserInfo getUserInfo() {
		return this.userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public CustomerInfo getCustomerInfoByReceiveId() {
		return this.customerInfoByReceiveId;
	}

	public void setCustomerInfoByReceiveId(CustomerInfo customerInfoByReceiveId) {
		this.customerInfoByReceiveId = customerInfoByReceiveId;
	}

	public BranchInfo getBranchInfoBySendBranchId() {
		return this.branchInfoBySendBranchId;
	}

	public void setBranchInfoBySendBranchId(BranchInfo branchInfoBySendBranchId) {
		this.branchInfoBySendBranchId = branchInfoBySendBranchId;
	}

	public BillState getBillState() {
		return this.billState;
	}

	public void setBillState(BillState billState) {
		this.billState = billState;
	}

	public CustomerInfo getCustomerInfoBySendId() {
		return this.customerInfoBySendId;
	}

	public void setCustomerInfoBySendId(CustomerInfo customerInfoBySendId) {
		this.customerInfoBySendId = customerInfoBySendId;
	}

	public BranchInfo getBranchInfoByReceiveBranchId() {
		return this.branchInfoByReceiveBranchId;
	}

	public void setBranchInfoByReceiveBranchId(
			BranchInfo branchInfoByReceiveBranchId) {
		this.branchInfoByReceiveBranchId = branchInfoByReceiveBranchId;
	}

	public String getTruckLine() {
		return this.truckLine;
	}

	public void setTruckLine(String truckLine) {
		this.truckLine = truckLine;
	}

	public String getPayerName() {
		return this.payerName;
	}

	public void setPayerName(String payerName) {
		this.payerName = payerName;
	}

	public String getBillData() {
		return this.billData;
	}

	public void setBillData(String billData) {
		this.billData = billData;
	}

	public String getBillMemo() {
		return this.billMemo;
	}

	public void setBillMemo(String billMemo) {
		this.billMemo = billMemo;
	}

	public Set getCargoVectors() {
		return this.cargoVectors;
	}

	public void setCargoVectors(Set cargoVectors) {
		this.cargoVectors = cargoVectors;
	}

	public Set getTrafficLogs() {
		return this.trafficLogs;
	}

	public void setTrafficLogs(Set trafficLogs) {
		this.trafficLogs = trafficLogs;
	}

}