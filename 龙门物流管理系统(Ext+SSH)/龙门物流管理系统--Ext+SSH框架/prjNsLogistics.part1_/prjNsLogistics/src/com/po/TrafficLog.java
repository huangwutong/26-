package com.po;

/**
 * TrafficLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class TrafficLog implements java.io.Serializable {

	// Fields

	private Integer trafficLogId;
	private TruckLog truckLog;
	private BranchInfo branchInfo;
	private BillInfo billInfo;

	// Constructors

	/** default constructor */
	public TrafficLog() {
	}

	/** full constructor */
	public TrafficLog(TruckLog truckLog, BranchInfo branchInfo,
			BillInfo billInfo) {
		this.truckLog = truckLog;
		this.branchInfo = branchInfo;
		this.billInfo = billInfo;
	}

	// Property accessors

	public Integer getTrafficLogId() {
		return this.trafficLogId;
	}

	public void setTrafficLogId(Integer trafficLogId) {
		this.trafficLogId = trafficLogId;
	}

	public TruckLog getTruckLog() {
		return this.truckLog;
	}

	public void setTruckLog(TruckLog truckLog) {
		this.truckLog = truckLog;
	}

	public BranchInfo getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public BillInfo getBillInfo() {
		return this.billInfo;
	}

	public void setBillInfo(BillInfo billInfo) {
		this.billInfo = billInfo;
	}

}