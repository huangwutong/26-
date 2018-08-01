package com.java;

import java.util.HashSet;
import java.util.Set;

/**
 * Resfun entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Resfun implements java.io.Serializable {

	// Fields

	private Long resfunid;
	private String pname;
	private String cname;
	private String caction;
	private Set resPs = new HashSet(0);

	// Constructors

	/** default constructor */
	public Resfun() {
	}

	/** full constructor */
	public Resfun(String pname, String cname, String caction, Set resPs) {
		this.pname = pname;
		this.cname = cname;
		this.caction = caction;
		this.resPs = resPs;
	}

	// Property accessors

	public Long getResfunid() {
		return this.resfunid;
	}

	public void setResfunid(Long resfunid) {
		this.resfunid = resfunid;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCaction() {
		return this.caction;
	}

	public void setCaction(String caction) {
		this.caction = caction;
	}

	public Set getResPs() {
		return this.resPs;
	}

	public void setResPs(Set resPs) {
		this.resPs = resPs;
	}

}