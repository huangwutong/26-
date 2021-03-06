package com.accp.myoa.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Position generated by MyEclipse Persistence Tools
 */

public class Position implements java.io.Serializable {

	// Fields

	private Integer positionId;
	private String positionName;
	private String positionRemark;
	//private Set deptPositions = new HashSet(0);

	// Constructors

	/** default constructor */
	public Position() {
	}

	/** minimal constructor */
	public Position(String positionName) {
		this.positionName = positionName;
	}

	/** full constructor */
	public Position(String positionName, String positionRemark
			) {
		this.positionName = positionName;
		this.positionRemark = positionRemark;
		
	}

	// Property accessors

	public Integer getPositionId() {
		return this.positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}

	public String getPositionName() {
		return this.positionName;
	}

	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}

	public String getPositionRemark() {
		return this.positionRemark;
	}

	public void setPositionRemark(String positionRemark) {
		this.positionRemark = positionRemark;
	}

//	public Set getDeptPositions() {
//		return this.deptPositions;
//	}
//
//	public void setDeptPositions(Set deptPositions) {
//		this.deptPositions = deptPositions;
//	}

}