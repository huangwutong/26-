package com.java;

import java.util.Date;

/**
 * Feesm entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Feesm implements java.io.Serializable {

	// Fields

	private Long feesmid;
	private Carbstb carbstb;
	private Date feesdate;
	private String feeskid;
	private Long feesje;
	private String feesemp;
	private String feesdep;
	private Long feeszq;
	private String des;

	// Constructors

	/** default constructor */
	public Feesm() {
	}

	/** minimal constructor */
	public Feesm(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	/** full constructor */
	public Feesm(Carbstb carbstb, Date feesdate, String feeskid, Long feesje,
			String feesemp, String feesdep, Long feeszq, String des) {
		this.carbstb = carbstb;
		this.feesdate = feesdate;
		this.feeskid = feeskid;
		this.feesje = feesje;
		this.feesemp = feesemp;
		this.feesdep = feesdep;
		this.feeszq = feeszq;
		this.des = des;
	}

	// Property accessors

	public Long getFeesmid() {
		return this.feesmid;
	}

	public void setFeesmid(Long feesmid) {
		this.feesmid = feesmid;
	}

	public Carbstb getCarbstb() {
		return this.carbstb;
	}

	public void setCarbstb(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	public Date getFeesdate() {
		return this.feesdate;
	}

	public void setFeesdate(Date feesdate) {
		this.feesdate = feesdate;
	}

	public String getFeeskid() {
		return this.feeskid;
	}

	public void setFeeskid(String feeskid) {
		this.feeskid = feeskid;
	}

	public Long getFeesje() {
		return this.feesje;
	}

	public void setFeesje(Long feesje) {
		this.feesje = feesje;
	}

	public String getFeesemp() {
		return this.feesemp;
	}

	public void setFeesemp(String feesemp) {
		this.feesemp = feesemp;
	}

	public String getFeesdep() {
		return this.feesdep;
	}

	public void setFeesdep(String feesdep) {
		this.feesdep = feesdep;
	}

	public Long getFeeszq() {
		return this.feeszq;
	}

	public void setFeeszq(Long feeszq) {
		this.feeszq = feeszq;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

}