package com.java;

/**
 * Grareg entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Grareg implements java.io.Serializable {

	// Fields

	private Long graregid;
	private String granum;
	private String local;
	private Long areas;
	private String relship;

	// Constructors

	/** default constructor */
	public Grareg() {
	}

	/** full constructor */
	public Grareg(String granum, String local, Long areas, String relship) {
		this.granum = granum;
		this.local = local;
		this.areas = areas;
		this.relship = relship;
	}

	// Property accessors

	public Long getGraregid() {
		return this.graregid;
	}

	public void setGraregid(Long graregid) {
		this.graregid = graregid;
	}

	public String getGranum() {
		return this.granum;
	}

	public void setGranum(String granum) {
		this.granum = granum;
	}

	public String getLocal() {
		return this.local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public Long getAreas() {
		return this.areas;
	}

	public void setAreas(Long areas) {
		this.areas = areas;
	}

	public String getRelship() {
		return this.relship;
	}

	public void setRelship(String relship) {
		this.relship = relship;
	}

}