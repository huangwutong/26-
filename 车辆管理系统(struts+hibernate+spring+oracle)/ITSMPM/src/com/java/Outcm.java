package com.java;

import java.util.Date;

/**
 * Outcm entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Outcm implements java.io.Serializable {
	private Long outcmid;
	private Driverm driverm;
	private Ucapli ucapli;
	private Carbstb carbstb;
	private String outcnum;
	private Date outdate;
	private String driver;
	private String ucem;
	private String outloca;
	private Date incomdate;
	private String outcron;
	private Date sjincomdate;
	private String whincom;
	private String outdes;

	// Constructors

	/** default constructor */
	public Outcm() {
	}

	/** minimal constructor */
	public Outcm(Driverm driverm, Ucapli ucapli, Carbstb carbstb) {
		this.driverm = driverm;
		this.ucapli = ucapli;
		this.carbstb = carbstb;
	}

	/** full constructor */
	public Outcm(Driverm driverm, Ucapli ucapli, Carbstb carbstb,
			String outcnum, Date outdate, String driver, String ucem,
			String outloca, Date incomdate, String outcron, Date sjincomdate,
			String whincom, String outdes) {
		this.driverm = driverm;
		this.ucapli = ucapli;
		this.carbstb = carbstb;
		this.outcnum = outcnum;
		this.outdate = outdate;
		this.driver = driver;
		this.ucem = ucem;
		this.outloca = outloca;
		this.incomdate = incomdate;
		this.outcron = outcron;
		this.sjincomdate = sjincomdate;
		this.whincom = whincom;
		this.outdes = outdes;
	}

	// Property accessors

	public Long getOutcmid() {
		return this.outcmid;
	}

	public void setOutcmid(Long outcmid) {
		this.outcmid = outcmid;
	}

	public Driverm getDriverm() {
		return this.driverm;
	}

	public void setDriverm(Driverm driverm) {
		this.driverm = driverm;
	}

	public Ucapli getUcapli() {
		return this.ucapli;
	}

	public void setUcapli(Ucapli ucapli) {
		this.ucapli = ucapli;
	}

	public Carbstb getCarbstb() {
		return this.carbstb;
	}

	public void setCarbstb(Carbstb carbstb) {
		this.carbstb = carbstb;
	}

	public String getOutcnum() {
		return this.outcnum;
	}

	public void setOutcnum(String outcnum) {
		this.outcnum = outcnum;
	}

	public Date getOutdate() {
		return this.outdate;
	}

	public void setOutdate(Date outdate) {
		this.outdate = outdate;
	}

	public String getDriver() {
		return this.driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getUcem() {
		return this.ucem;
	}

	public void setUcem(String ucem) {
		this.ucem = ucem;
	}

	public String getOutloca() {
		return this.outloca;
	}

	public void setOutloca(String outloca) {
		this.outloca = outloca;
	}

	public Date getIncomdate() {
		return this.incomdate;
	}

	public void setIncomdate(Date incomdate) {
		this.incomdate = incomdate;
	}

	public String getOutcron() {
		return this.outcron;
	}

	public void setOutcron(String outcron) {
		this.outcron = outcron;
	}

	public Date getSjincomdate() {
		return this.sjincomdate;
	}

	public void setSjincomdate(Date sjincomdate) {
		this.sjincomdate = sjincomdate;
	}

	public String getWhincom() {
		return this.whincom;
	}

	public void setWhincom(String whincom) {
		this.whincom = whincom;
	}

	public String getOutdes() {
		return this.outdes;
	}

	public void setOutdes(String outdes) {
		this.outdes = outdes;
	}

}