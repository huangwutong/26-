package com.java;

import java.util.HashSet;
import java.util.Set;

/**
 * Roletb entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Roletb implements java.io.Serializable {

	// Fields

	private Long roletbid;
	private String rolename;
	private String roledes;
	private Set URs = new HashSet(0);
	private Set RPs = new HashSet(0);

	// Constructors

	/** default constructor */
	public Roletb() {
	}

	/** full constructor */
	public Roletb(String rolename, String roledes, Set URs, Set RPs) {
		this.rolename = rolename;
		this.roledes = roledes;
		this.URs = URs;
		this.RPs = RPs;
	}

	// Property accessors

	public Long getRoletbid() {
		return this.roletbid;
	}

	public void setRoletbid(Long roletbid) {
		this.roletbid = roletbid;
	}

	public String getRolename() {
		return this.rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public String getRoledes() {
		return this.roledes;
	}

	public void setRoledes(String roledes) {
		this.roledes = roledes;
	}

	public Set getURs() {
		return this.URs;
	}

	public void setURs(Set URs) {
		this.URs = URs;
	}

	public Set getRPs() {
		return this.RPs;
	}

	public void setRPs(Set RPs) {
		this.RPs = RPs;
	}

}