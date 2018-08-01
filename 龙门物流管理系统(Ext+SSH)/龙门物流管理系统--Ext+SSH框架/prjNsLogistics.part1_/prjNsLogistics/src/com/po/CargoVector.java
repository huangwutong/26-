package com.po;

/**
 * CargoVector entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CargoVector implements java.io.Serializable {

	// Fields

	private Integer cvid;
	private CargoInfo cargoInfo;
	private BillInfo billInfo;

	// Constructors

	/** default constructor */
	public CargoVector() {
	}

	/** full constructor */
	public CargoVector(CargoInfo cargoInfo, BillInfo billInfo) {
		this.cargoInfo = cargoInfo;
		this.billInfo = billInfo;
	}

	// Property accessors

	public Integer getCvid() {
		return this.cvid;
	}

	public void setCvid(Integer cvid) {
		this.cvid = cvid;
	}

	public CargoInfo getCargoInfo() {
		return this.cargoInfo;
	}

	public void setCargoInfo(CargoInfo cargoInfo) {
		this.cargoInfo = cargoInfo;
	}

	public BillInfo getBillInfo() {
		return this.billInfo;
	}

	public void setBillInfo(BillInfo billInfo) {
		this.billInfo = billInfo;
	}

}