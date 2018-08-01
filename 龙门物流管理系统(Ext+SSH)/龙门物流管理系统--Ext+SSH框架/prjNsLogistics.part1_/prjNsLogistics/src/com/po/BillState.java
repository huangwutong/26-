package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * BillState entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class BillState implements java.io.Serializable {

	// Fields

	private Integer billStateId;
	private String billStateName;
	private Set billInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public BillState() {
	}

	/** full constructor */
	public BillState(String billStateName, Set billInfos) {
		this.billStateName = billStateName;
		this.billInfos = billInfos;
	}

	// Property accessors

	public Integer getBillStateId() {
		return this.billStateId;
	}

	public void setBillStateId(Integer billStateId) {
		this.billStateId = billStateId;
	}

	public String getBillStateName() {
		return this.billStateName;
	}

	public void setBillStateName(String billStateName) {
		this.billStateName = billStateName;
	}

	public Set getBillInfos() {
		return this.billInfos;
	}

	public void setBillInfos(Set billInfos) {
		this.billInfos = billInfos;
	}

}