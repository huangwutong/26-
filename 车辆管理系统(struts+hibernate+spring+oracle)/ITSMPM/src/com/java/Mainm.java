package com.java;

import java.util.Date;

/**
 * Mainm entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Mainm implements java.io.Serializable {

	// Fields

	private Long mainmid;
	private Carbstb carbstb;
	private Date maindate;
	private String mainkind;
	private String mainemp;
	private String mloca;
	private Long mje;
	private Long mamile;
	private String maxm;
	private String mades;

	// Constructors

	/** default constructor */
	public Mainm() {
	}

	/** minimal constructor */
	public Mainm(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	/** full constructor */
	public Mainm(Carbstb carbstb, Date maindate, String mainkind,
			String mainemp, String mloca, Long mje, Long mamile, String maxm,
			String mades) {
		this.carbstb = carbstb;
		this.maindate = maindate;
		this.mainkind = mainkind;
		this.mainemp = mainemp;
		this.mloca = mloca;
		this.mje = mje;
		this.mamile = mamile;
		this.maxm = maxm;
		this.mades = mades;
	}

	// Property accessors

	public Long getMainmid() {
		return this.mainmid;
	}

	public void setMainmid(Long mainmid) {
		this.mainmid = mainmid;
	}

	public Carbstb getCarbstb() {
		return this.carbstb;
	}

	public void setCarbstb(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	public Date getMaindate() {
		return this.maindate;
	}

	public void setMaindate(Date maindate) {
		this.maindate = maindate;
	}

	public String getMainkind() {
		return this.mainkind;
	}

	public void setMainkind(String mainkind) {
		this.mainkind = mainkind;
	}

	public String getMainemp() {
		return this.mainemp;
	}

	public void setMainemp(String mainemp) {
		this.mainemp = mainemp;
	}

	public String getMloca() {
		return this.mloca;
	}

	public void setMloca(String mloca) {
		this.mloca = mloca;
	}

	public Long getMje() {
		return this.mje;
	}

	public void setMje(Long mje) {
		this.mje = mje;
	}

	public Long getMamile() {
		return this.mamile;
	}

	public void setMamile(Long mamile) {
		this.mamile = mamile;
	}

	public String getMaxm() {
		return this.maxm;
	}

	public void setMaxm(String maxm) {
		this.maxm = maxm;
	}

	public String getMades() {
		return this.mades;
	}

	public void setMades(String mades) {
		this.mades = mades;
	}

}