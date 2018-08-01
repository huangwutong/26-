package com.java;

import java.util.Date;

/**
 * Annum entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Annum implements java.io.Serializable {

	// Fields

	private Long annumid;
	private Carbstb carbstb;
	private Date annumdate;
	private String anum;
	private Long anfy;
	private String anemp;
	private String andep;
	private Date anenda;
	private String andes;

	// Constructors

	/** default constructor */
	public Annum() {
	}

	/** minimal constructor */
	public Annum(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	/** full constructor */
	public Annum(Carbstb carbstb, Date annumdate, String anum, Long anfy,
			String anemp, String andep, Date anenda, String andes) {
		this.carbstb = carbstb;
		this.annumdate = annumdate;
		this.anum = anum;
		this.anfy = anfy;
		this.anemp = anemp;
		this.andep = andep;
		this.anenda = anenda;
		this.andes = andes;
	}

	// Property accessors

	public Long getAnnumid() {
		return this.annumid;
	}

	public void setAnnumid(Long annumid) {
		this.annumid = annumid;
	}

	public Carbstb getCarbstb() {
		return this.carbstb;
	}

	public void setCarbstb(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	public Date getAnnumdate() {
		return this.annumdate;
	}

	public void setAnnumdate(Date annumdate) {
		this.annumdate = annumdate;
	}

	public String getAnum() {
		return this.anum;
	}

	public void setAnum(String anum) {
		this.anum = anum;
	}

	public Long getAnfy() {
		return this.anfy;
	}

	public void setAnfy(Long anfy) {
		this.anfy = anfy;
	}

	public String getAnemp() {
		return this.anemp;
	}

	public void setAnemp(String anemp) {
		this.anemp = anemp;
	}

	public String getAndep() {
		return this.andep;
	}

	public void setAndep(String andep) {
		this.andep = andep;
	}

	public Date getAnenda() {
		return this.anenda;
	}

	public void setAnenda(Date anenda) {
		this.anenda = anenda;
	}

	public String getAndes() {
		return this.andes;
	}

	public void setAndes(String andes) {
		this.andes = andes;
	}

}