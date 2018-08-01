package com.po;

/**
 * Operation entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Operation implements java.io.Serializable {

	// Fields

	private Integer opId;
	private Integer opFid;
	private String opName;
	private String opUrl;

	// Constructors

	/** default constructor */
	public Operation() {
	}

	/** full constructor */
	public Operation(Integer opFid, String opName, String opUrl) {
		this.opFid = opFid;
		this.opName = opName;
		this.opUrl = opUrl;
	}

	// Property accessors

	public Integer getOpId() {
		return this.opId;
	}

	public void setOpId(Integer opId) {
		this.opId = opId;
	}

	public Integer getOpFid() {
		return this.opFid;
	}

	public void setOpFid(Integer opFid) {
		this.opFid = opFid;
	}

	public String getOpName() {
		return this.opName;
	}

	public void setOpName(String opName) {
		this.opName = opName;
	}

	public String getOpUrl() {
		return this.opUrl;
	}

	public void setOpUrl(String opUrl) {
		this.opUrl = opUrl;
	}

}