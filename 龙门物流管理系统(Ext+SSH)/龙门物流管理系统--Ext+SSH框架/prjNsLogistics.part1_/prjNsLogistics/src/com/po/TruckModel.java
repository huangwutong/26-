package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * TruckModel entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class TruckModel implements java.io.Serializable {

	// Fields

	private Integer tmid;
	private String tmname;
	private String tmweight;
	private String tmcubage;
	private Integer tmpassenger;
	private Set truckInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public TruckModel() {
	}

	/** full constructor */
	public TruckModel(String tmname, String tmweight, String tmcubage,
			Integer tmpassenger, Set truckInfos) {
		this.tmname = tmname;
		this.tmweight = tmweight;
		this.tmcubage = tmcubage;
		this.tmpassenger = tmpassenger;
		this.truckInfos = truckInfos;
	}

	// Property accessors

	public Integer getTmid() {
		return this.tmid;
	}

	public void setTmid(Integer tmid) {
		this.tmid = tmid;
	}

	public String getTmname() {
		return this.tmname;
	}

	public void setTmname(String tmname) {
		this.tmname = tmname;
	}

	public String getTmweight() {
		return this.tmweight;
	}

	public void setTmweight(String tmweight) {
		this.tmweight = tmweight;
	}

	public String getTmcubage() {
		return this.tmcubage;
	}

	public void setTmcubage(String tmcubage) {
		this.tmcubage = tmcubage;
	}

	public Integer getTmpassenger() {
		return this.tmpassenger;
	}

	public void setTmpassenger(Integer tmpassenger) {
		this.tmpassenger = tmpassenger;
	}

	public Set getTruckInfos() {
		return this.truckInfos;
	}

	public void setTruckInfos(Set truckInfos) {
		this.truckInfos = truckInfos;
	}

}