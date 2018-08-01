package com.java;

/**
 * RP entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class RP implements java.io.Serializable {

	// Fields

	private Long rpid;
	private Comps comps;
	private Roletb roletb;

	// Constructors

	/** default constructor */
	public RP() {
	}

	/** full constructor */
	public RP(Comps comps, Roletb roletb) {
		this.comps = comps;
		this.roletb = roletb;
	}

	// Property accessors

	public Long getRpid() {
		return this.rpid;
	}

	public void setRpid(Long rpid) {
		this.rpid = rpid;
	}

	public Comps getComps() {
		return this.comps;
	}

	public void setComps(Comps comps) {
		this.comps = comps;
	}

	public Roletb getRoletb() {
		return this.roletb;
	}

	public void setRoletb(Roletb roletb) {
		this.roletb = roletb;
	}

}