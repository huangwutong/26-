package com.java;

/**
 * UR entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class UR implements java.io.Serializable {

	// Fields

	private Long urid;
	private Roletb roletb;
	private Xxuser xxuser;

	// Constructors

	/** default constructor */
	public UR() {
	}

	/** full constructor */
	public UR(Roletb roletb, Xxuser xxuser) {
		this.roletb = roletb;
		this.xxuser = xxuser;
	}

	// Property accessors

	public Long getUrid() {
		return this.urid;
	}

	public void setUrid(Long urid) {
		this.urid = urid;
	}

	public Roletb getRoletb() {
		return this.roletb;
	}

	public void setRoletb(Roletb roletb) {
		this.roletb = roletb;
	}

	public Xxuser getXxuser() {
		return this.xxuser;
	}

	public void setXxuser(Xxuser xxuser) {
		this.xxuser = xxuser;
	}

}