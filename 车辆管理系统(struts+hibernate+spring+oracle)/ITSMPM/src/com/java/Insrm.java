package com.java;

import java.util.Date;

/**
 * Insrm entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Insrm implements java.io.Serializable {

	// Fields

	private Long insrmid;
	private Carbstb carbstb;
	private Date insrmdate;
	private String inskind;
	private String insnum;
	private Long insfy;
	private String insemp;
	private String inscompy;
	private Date insend;
	private String insxm;
	private String des;

	// Constructors

	/** default constructor */
	public Insrm() {
	}

	/** minimal constructor */
	public Insrm(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	/** full constructor */
	public Insrm(Carbstb carbstb, Date insrmdate, String inskind,
			String insnum, Long insfy, String insemp, String inscompy,
			Date insend, String insxm, String des) {
		this.carbstb = carbstb;
		this.insrmdate = insrmdate;
		this.inskind = inskind;
		this.insnum = insnum;
		this.insfy = insfy;
		this.insemp = insemp;
		this.inscompy = inscompy;
		this.insend = insend;
		this.insxm = insxm;
		this.des = des;
	}

	// Property accessors

	public Long getInsrmid() {
		return this.insrmid;
	}

	public void setInsrmid(Long insrmid) {
		this.insrmid = insrmid;
	}

	public Carbstb getCarbstb() {
		return this.carbstb;
	}

	public void setCarbstb(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	public Date getInsrmdate() {
		return this.insrmdate;
	}

	public void setInsrmdate(Date insrmdate) {
		this.insrmdate = insrmdate;
	}

	public String getInskind() {
		return this.inskind;
	}

	public void setInskind(String inskind) {
		this.inskind = inskind;
	}

	public String getInsnum() {
		return this.insnum;
	}

	public void setInsnum(String insnum) {
		this.insnum = insnum;
	}

	public Long getInsfy() {
		return this.insfy;
	}

	public void setInsfy(Long insfy) {
		this.insfy = insfy;
	}

	public String getInsemp() {
		return this.insemp;
	}

	public void setInsemp(String insemp) {
		this.insemp = insemp;
	}

	public String getInscompy() {
		return this.inscompy;
	}

	public void setInscompy(String inscompy) {
		this.inscompy = inscompy;
	}

	public Date getInsend() {
		return this.insend;
	}

	public void setInsend(Date insend) {
		this.insend = insend;
	}

	public String getInsxm() {
		return this.insxm;
	}

	public void setInsxm(String insxm) {
		this.insxm = insxm;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

}