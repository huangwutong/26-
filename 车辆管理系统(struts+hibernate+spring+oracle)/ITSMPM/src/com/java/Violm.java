package com.java;

import java.util.Date;

/**
 * Violm entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Violm implements java.io.Serializable {

	// Fields

	private Long violmid;
	private Carbstb carbstb;
	private Date violdate;
	private String violkind;
	private String driver;
	private String points;
	private Long fineje;
	private String violloca;
	private String violdes;
	private String violemp;

	// Constructors

	/** default constructor */
	public Violm() {
	}

	/** minimal constructor */
	public Violm(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	/** full constructor */
	public Violm(Carbstb carbstb, Date violdate, String violkind,
			String driver, String points, Long fineje, String violloca,
			String violdes,String violemp) {
		this.carbstb = carbstb;
		this.violdate = violdate;
		this.violkind = violkind;
		this.driver = driver;
		this.points = points;
		this.fineje = fineje;
		this.violloca = violloca;
		this.violdes = violdes;
		this.violemp = violemp;
	}

	// Property accessors

	public Long getViolmid() {
		return this.violmid;
	}

	public void setViolmid(Long violmid) {
		this.violmid = violmid;
	}

	public Carbstb getCarbstb() {
		return this.carbstb;
	}

	public void setCarbstb(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	public Date getVioldate() {
		return this.violdate;
	}

	public void setVioldate(Date violdate) {
		this.violdate = violdate;
	}

	public String getViolkind() {
		return this.violkind;
	}

	public void setViolkind(String violkind) {
		this.violkind = violkind;
	}

	public String getDriver() {
		return this.driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getPoints() {
		return this.points;
	}

	public void setPoints(String points) {
		this.points = points;
	}

	public Long getFineje() {
		return this.fineje;
	}

	public void setFineje(Long fineje) {
		this.fineje = fineje;
	}

	public String getViolloca() {
		return this.violloca;
	}

	public void setViolloca(String violloca) {
		this.violloca = violloca;
	}

	public String getVioldes() {
		return this.violdes;
	}

	public void setVioldes(String violdes) {
		this.violdes = violdes;
	}

	public String getViolemp() {
		return violemp;
	}

	public void setViolemp(String violemp) {
		this.violemp = violemp;
	}

}