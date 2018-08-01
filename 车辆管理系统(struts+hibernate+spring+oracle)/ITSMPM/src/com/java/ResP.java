package com.java;

/**
 * ResP entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ResP implements java.io.Serializable {

	// Fields

	private Long respid;
	private Comps comps;
	private Resfun resfun;

	// Constructors

	/** default constructor */
	public ResP() {
	}

	/** full constructor */
	public ResP(Comps comps, Resfun resfun) {
		this.comps = comps;
		this.resfun = resfun;
	}

	// Property accessors

	public Long getRespid() {
		return this.respid;
	}

	public void setRespid(Long respid) {
		this.respid = respid;
	}

	public Comps getComps() {
		return this.comps;
	}

	public void setComps(Comps comps) {
		this.comps = comps;
	}

	public Resfun getResfun() {
		return this.resfun;
	}

	public void setResfun(Resfun resfun) {
		this.resfun = resfun;
	}

}