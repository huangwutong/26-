package com.java;

import java.util.Date;

/**
 * Oilm entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Oilm implements java.io.Serializable {

	// Fields

	private Long oilmid;
	private Carbstb carbstb;
	private String oilcnum;
	private String oilkind;
	private Date oildate;
	private Long oprice;
	private Long ocount;
	private Long amount;
	private String handnm;
	private Long nowmile;
	private Long lastmile;
	private Long lastoil;
	private Long lasttrav;
	private String gasnm;
	private String oildes;

	// Constructors

	/** default constructor */
	public Oilm() {
	}

	/** minimal constructor */
	public Oilm(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	/** full constructor */
	public Oilm(Carbstb carbstb, String oilcnum, String oilkind, Date oildate,
			Long oprice, Long ocount, Long amount, String handnm, Long nowmile,
			Long lastmile, Long lastoil, Long lasttrav, String gasnm,
			String oildes) {
		this.carbstb = carbstb;
		this.oilcnum = oilcnum;
		this.oilkind = oilkind;
		this.oildate = oildate;
		this.oprice = oprice;
		this.ocount = ocount;
		this.amount = amount;
		this.handnm = handnm;
		this.nowmile = nowmile;
		this.lastmile = lastmile;
		this.lastoil = lastoil;
		this.lasttrav = lasttrav;
		this.gasnm = gasnm;
		this.oildes = oildes;
	}

	// Property accessors

	public Long getOilmid() {
		return this.oilmid;
	}

	public void setOilmid(Long oilmid) {
		this.oilmid = oilmid;
	}

	public Carbstb getCarbstb() {
		return this.carbstb;
	}

	public void setCarbstb(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	public String getOilcnum() {
		return this.oilcnum;
	}

	public void setOilcnum(String oilcnum) {
		this.oilcnum = oilcnum;
	}

	public String getOilkind() {
		return this.oilkind;
	}

	public void setOilkind(String oilkind) {
		this.oilkind = oilkind;
	}

	public Date getOildate() {
		return this.oildate;
	}

	public void setOildate(Date oildate) {
		this.oildate = oildate;
	}

	public Long getOprice() {
		return this.oprice;
	}

	public void setOprice(Long oprice) {
		this.oprice = oprice;
	}

	public Long getOcount() {
		return this.ocount;
	}

	public void setOcount(Long ocount) {
		this.ocount = ocount;
	}

	public Long getAmount() {
		return this.amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	public String getHandnm() {
		return this.handnm;
	}

	public void setHandnm(String handnm) {
		this.handnm = handnm;
	}

	public Long getNowmile() {
		return this.nowmile;
	}

	public void setNowmile(Long nowmile) {
		this.nowmile = nowmile;
	}

	public Long getLastmile() {
		return this.lastmile;
	}

	public void setLastmile(Long lastmile) {
		this.lastmile = lastmile;
	}

	public Long getLastoil() {
		return this.lastoil;
	}

	public void setLastoil(Long lastoil) {
		this.lastoil = lastoil;
	}

	public Long getLasttrav() {
		return this.lasttrav;
	}

	public void setLasttrav(Long lasttrav) {
		this.lasttrav = lasttrav;
	}

	public String getGasnm() {
		return this.gasnm;
	}

	public void setGasnm(String gasnm) {
		this.gasnm = gasnm;
	}

	public String getOildes() {
		return this.oildes;
	}

	public void setOildes(String oildes) {
		this.oildes = oildes;
	}

}