package com.java;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Ucapli entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Ucapli implements java.io.Serializable {
	// Fields
	private Long ucapliid;
	private String ucdep;
	private String ucempnm;
	private String phonum;
	private String ucloca;
	private Date ucdate;
	private Date indate;
	private String thing;
	private String dtation;
	private String ucdes;
	private String appstats;
	private String whcar;
	private String appdes;
	private String appnm;
	private Set outcms = new HashSet(0);

	// Constructors

	/** default constructor */
	public Ucapli() {
	}

	/** full constructor */
	public Ucapli(String ucdep, String ucempnm, String phonum, String ucloca,
			Date ucdate, Date indate, String thing, String dtation,
			String ucdes, String appstats, String whcar, String appdes,
			String appnm, Set outcms) {
		this.ucdep = ucdep;
		this.ucempnm = ucempnm;
		this.phonum = phonum;
		this.ucloca = ucloca;
		this.ucdate = ucdate;
		this.indate = indate;
		this.thing = thing;
		this.dtation = dtation;
		this.ucdes = ucdes;
		this.appstats = appstats;
		this.whcar = whcar;
		this.appdes = appdes;
		this.appnm = appnm;
		this.outcms = outcms;
	}

	// Property accessors

	public Long getUcapliid() {
		return this.ucapliid;
	}

	public void setUcapliid(Long ucapliid) {
		this.ucapliid = ucapliid;
	}

	public String getUcdep() {
		return this.ucdep;
	}

	public void setUcdep(String ucdep) {
		this.ucdep = ucdep;
	}

	public String getUcempnm() {
		return this.ucempnm;
	}

	public void setUcempnm(String ucempnm) {
		this.ucempnm = ucempnm;
	}

	public String getPhonum() {
		return this.phonum;
	}

	public void setPhonum(String phonum) {
		this.phonum = phonum;
	}

	public String getUcloca() {
		return this.ucloca;
	}

	public void setUcloca(String ucloca) {
		this.ucloca = ucloca;
	}

	public Date getUcdate() {
		return this.ucdate;
	}

	public void setUcdate(Date ucdate) {
		this.ucdate = ucdate;
	}

	public Date getIndate() {
		return this.indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}

	public String getThing() {
		return this.thing;
	}

	public void setThing(String thing) {
		this.thing = thing;
	}

	public String getDtation() {
		return this.dtation;
	}

	public void setDtation(String dtation) {
		this.dtation = dtation;
	}

	public String getUcdes() {
		return this.ucdes;
	}

	public void setUcdes(String ucdes) {
		this.ucdes = ucdes;
	}

	public String getAppstats() {
		return this.appstats;
	}

	public void setAppstats(String appstats) {
		this.appstats = appstats;
	}

	public String getWhcar() {
		return this.whcar;
	}

	public void setWhcar(String whcar) {
		this.whcar = whcar;
	}

	public String getAppdes() {
		return this.appdes;
	}

	public void setAppdes(String appdes) {
		this.appdes = appdes;
	}

	public String getAppnm() {
		return this.appnm;
	}

	public void setAppnm(String appnm) {
		this.appnm = appnm;
	}

	public Set getOutcms() {
		return this.outcms;
	}

	public void setOutcms(Set outcms) {
		this.outcms = outcms;
	}

}