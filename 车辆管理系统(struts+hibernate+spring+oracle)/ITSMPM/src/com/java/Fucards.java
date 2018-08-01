package com.java;

import java.util.Date;

/**
 * Fucards entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Fucards implements java.io.Serializable {

	// Fields

	private Long fucardsid;
	private String funum;
	private String fuemp;
	private Long fuje;
	private String fuloca;
	private Date fucdate;
	private String des;

	// Constructors

	/** default constructor */
	public Fucards() {
	}

	/** full constructor */
	public Fucards(String funum, String fuemp, Long fuje, String fuloca,
			Date fucdate, String des) {
		this.funum = funum;
		this.fuemp = fuemp;
		this.fuje = fuje;
		this.fuloca = fuloca;
		this.fucdate = fucdate;
		this.des = des;
	}

	// Property accessors

	public Long getFucardsid() {
		return this.fucardsid;
	}

	public void setFucardsid(Long fucardsid) {
		this.fucardsid = fucardsid;
	}

	public String getFunum() {
		return this.funum;
	}

	public void setFunum(String funum) {
		this.funum = funum;
	}

	public String getFuemp() {
		return this.fuemp;
	}

	public void setFuemp(String fuemp) {
		this.fuemp = fuemp;
	}

	public Long getFuje() {
		return this.fuje;
	}

	public void setFuje(Long fuje) {
		this.fuje = fuje;
	}

	public String getFuloca() {
		return this.fuloca;
	}

	public void setFuloca(String fuloca) {
		this.fuloca = fuloca;
	}

	public Date getFucdate() {
		return this.fucdate;
	}

	public void setFucdate(Date fucdate) {
		this.fucdate = fucdate;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

}