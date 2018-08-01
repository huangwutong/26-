package com.java;

import java.util.HashSet;
import java.util.Set;

/**
 * Comps entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Comps implements java.io.Serializable {

	// Fields

	private Long compsid;
	private String comname;
	private String comdes;
	private Set resPs = new HashSet(0);
	private Set RPs = new HashSet(0);

	// Constructors

	/** default constructor */
	public Comps() {
	}

	/** full constructor */
	public Comps(String comname, String comdes, Set resPs, Set RPs) {
		this.comname = comname;
		this.comdes = comdes;
		this.resPs = resPs;
		this.RPs = RPs;
	}

	// Property accessors

	public Long getCompsid() {
		return this.compsid;
	}

	public void setCompsid(Long compsid) {
		this.compsid = compsid;
	}

	public String getComname() {
		return this.comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	public String getComdes() {
		return this.comdes;
	}

	public void setComdes(String comdes) {
		this.comdes = comdes;
	}

	public Set getResPs() {
		return this.resPs;
	}

	public void setResPs(Set resPs) {
		this.resPs = resPs;
	}

	public Set getRPs() {
		return this.RPs;
	}

	public void setRPs(Set RPs) {
		this.RPs = RPs;
	}

}