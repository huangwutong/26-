package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * CargoInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CargoInfo implements java.io.Serializable {

	// Fields

	private Integer cargoId;
	private BranchInfo branchInfo;
	private String cargoName;
	private String cargoWeight;
	private String cargoBulk;
	private String cargoNum;
	private String cargoUnit;
	private String cargoValue;
	private String cargoFreight;
	private String cargoAmends;
	private String cargoMemo;
	private Integer cargoState;
	private String cargoStartData;
	private String cargoEndData;
	private Set cargoVectors = new HashSet(0);

	// Constructors

	/** default constructor */
	public CargoInfo() {
	}

	/** full constructor */
	public CargoInfo(BranchInfo branchInfo, String cargoName,
			String cargoWeight, String cargoBulk, String cargoNum,
			String cargoUnit, String cargoValue, String cargoFreight,
			String cargoAmends, String cargoMemo, Integer cargoState,
			String cargoStartData, String cargoEndData, Set cargoVectors) {
		this.branchInfo = branchInfo;
		this.cargoName = cargoName;
		this.cargoWeight = cargoWeight;
		this.cargoBulk = cargoBulk;
		this.cargoNum = cargoNum;
		this.cargoUnit = cargoUnit;
		this.cargoValue = cargoValue;
		this.cargoFreight = cargoFreight;
		this.cargoAmends = cargoAmends;
		this.cargoMemo = cargoMemo;
		this.cargoState = cargoState;
		this.cargoStartData = cargoStartData;
		this.cargoEndData = cargoEndData;
		this.cargoVectors = cargoVectors;
	}

	// Property accessors

	public Integer getCargoId() {
		return this.cargoId;
	}

	public void setCargoId(Integer cargoId) {
		this.cargoId = cargoId;
	}

	public BranchInfo getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public String getCargoName() {
		return this.cargoName;
	}

	public void setCargoName(String cargoName) {
		this.cargoName = cargoName;
	}

	public String getCargoWeight() {
		return this.cargoWeight;
	}

	public void setCargoWeight(String cargoWeight) {
		this.cargoWeight = cargoWeight;
	}

	public String getCargoBulk() {
		return this.cargoBulk;
	}

	public void setCargoBulk(String cargoBulk) {
		this.cargoBulk = cargoBulk;
	}

	public String getCargoNum() {
		return this.cargoNum;
	}

	public void setCargoNum(String cargoNum) {
		this.cargoNum = cargoNum;
	}

	public String getCargoUnit() {
		return this.cargoUnit;
	}

	public void setCargoUnit(String cargoUnit) {
		this.cargoUnit = cargoUnit;
	}

	public String getCargoValue() {
		return this.cargoValue;
	}

	public void setCargoValue(String cargoValue) {
		this.cargoValue = cargoValue;
	}

	public String getCargoFreight() {
		return this.cargoFreight;
	}

	public void setCargoFreight(String cargoFreight) {
		this.cargoFreight = cargoFreight;
	}

	public String getCargoAmends() {
		return this.cargoAmends;
	}

	public void setCargoAmends(String cargoAmends) {
		this.cargoAmends = cargoAmends;
	}

	public String getCargoMemo() {
		return this.cargoMemo;
	}

	public void setCargoMemo(String cargoMemo) {
		this.cargoMemo = cargoMemo;
	}

	public Integer getCargoState() {
		return this.cargoState;
	}

	public void setCargoState(Integer cargoState) {
		this.cargoState = cargoState;
	}

	public String getCargoStartData() {
		return this.cargoStartData;
	}

	public void setCargoStartData(String cargoStartData) {
		this.cargoStartData = cargoStartData;
	}

	public String getCargoEndData() {
		return this.cargoEndData;
	}

	public void setCargoEndData(String cargoEndData) {
		this.cargoEndData = cargoEndData;
	}

	public Set getCargoVectors() {
		return this.cargoVectors;
	}

	public void setCargoVectors(Set cargoVectors) {
		this.cargoVectors = cargoVectors;
	}

}