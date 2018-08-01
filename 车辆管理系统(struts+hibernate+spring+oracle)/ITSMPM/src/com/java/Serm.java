package com.java;

import java.util.Date;

/**
 * Serm entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Serm implements java.io.Serializable {

	// Fields

	private Long sermid;
	private Carbstb carbstb;
	private Date serdate;
	private String seremp;
	private String sershop;
	private Date ytake;
	private String serron;
	private Long serje;
	private Date sjtake;

	// Constructors

	/** default constructor */
	public Serm() {
	}

	/** minimal constructor */
	public Serm(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	/** full constructor */
	public Serm(Carbstb carbstb, Date serdate, String seremp, String sershop,
			Date ytake, String serron, Long serje, Date sjtake) {
		this.carbstb = carbstb;
		this.serdate = serdate;
		this.seremp = seremp;
		this.sershop = sershop;
		this.ytake = ytake;
		this.serron = serron;
		this.serje = serje;
		this.sjtake = sjtake;
	}

	// Property accessors

	public Long getSermid() {
		return this.sermid;
	}

	public void setSermid(Long sermid) {
		this.sermid = sermid;
	}

	public Carbstb getCarbstb() {
		return this.carbstb;
	}

	public void setCarbstb(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	public Date getSerdate() {
		return this.serdate;
	}

	public void setSerdate(Date serdate) {
		this.serdate = serdate;
	}

	public String getSeremp() {
		return this.seremp;
	}

	public void setSeremp(String seremp) {
		this.seremp = seremp;
	}

	public String getSershop() {
		return this.sershop;
	}

	public void setSershop(String sershop) {
		this.sershop = sershop;
	}

	public Date getYtake() {
		return this.ytake;
	}

	public void setYtake(Date ytake) {
		this.ytake = ytake;
	}

	public String getSerron() {
		return this.serron;
	}

	public void setSerron(String serron) {
		this.serron = serron;
	}

	public Long getSerje() {
		return this.serje;
	}

	public void setSerje(Long serje) {
		this.serje = serje;
	}

	public Date getSjtake() {
		return this.sjtake;
	}

	public void setSjtake(Date sjtake) {
		this.sjtake = sjtake;
	}

}