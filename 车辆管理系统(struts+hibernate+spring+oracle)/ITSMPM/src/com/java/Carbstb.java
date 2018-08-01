package com.java;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Carbstb implements java.io.Serializable {
	private Long carbstbid;
	private String carnum;
	private String brand;
	private String cmode;
	private String carkind;
	private String fconsu;
	private String enginum;
	private String framenum;
	private String carload;
	private String seatnum;
	private String driver;
	private Date buydate;
	private String buyunit;
	private Long buyprice;
	private Long initmile;
	private Long mainmile;
	private Long maincycle;
	private String departm;
	private String carstats;
	private String cardes;
	private Set serms  = new HashSet(0);
	private Set annums = new HashSet(0);
	private Set mainms = new HashSet(0);
	private Set feesms = new HashSet(0);
	private Set oilms  = new HashSet(0);
	private Set outcms = new HashSet(0);
	private Set violms = new HashSet(0);
	private Set insrms = new HashSet(0);

	// Constructors

	/** default constructor */
	public Carbstb() {
	}

	/** full constructor */
	public Carbstb(String carnum, String brand, String cmode, String carkind,
			String fconsu, String enginum, String framenum, String carload,
			String seatnum, String driver, Date buydate, String buyunit,
			Long buyprice, Long initmile, Long mainmile, Long maincycle,
			String departm, String carstats, String cardes, Set serms,
			Set annums, Set mainms, Set feesms, Set oilms, Set outcms,
			Set violms, Set insrms) {
		this.carnum = carnum;
		this.brand = brand;
		this.cmode = cmode;
		this.carkind = carkind;
		this.fconsu = fconsu;
		this.enginum = enginum;
		this.framenum = framenum;
		this.carload = carload;
		this.seatnum = seatnum;
		this.driver = driver;
		this.buydate = buydate;
		this.buyunit = buyunit;
		this.buyprice = buyprice;
		this.initmile = initmile;
		this.mainmile = mainmile;
		this.maincycle = maincycle;
		this.departm = departm;
		this.carstats = carstats;
		this.cardes = cardes;
		this.serms = serms;
		this.annums = annums;
		this.mainms = mainms;
		this.feesms = feesms;
		this.oilms = oilms;
		this.outcms = outcms;
		this.violms = violms;
		this.insrms = insrms;
	}

	// Property accessors

	public Long getCarbstbid() {
		return this.carbstbid;
	}

	public void setCarbstbid(Long carbstbid) {
		this.carbstbid = carbstbid;
	}

	public String getCarnum() {
		return this.carnum;
	}

	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	public String getBrand() {
		return this.brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCmode() {
		return this.cmode;
	}

	public void setCmode(String cmode) {
		this.cmode = cmode;
	}

	public String getCarkind() {
		return this.carkind;
	}

	public void setCarkind(String carkind) {
		this.carkind = carkind;
	}

	public String getFconsu() {
		return this.fconsu;
	}

	public void setFconsu(String fconsu) {
		this.fconsu = fconsu;
	}

	public String getEnginum() {
		return this.enginum;
	}

	public void setEnginum(String enginum) {
		this.enginum = enginum;
	}

	public String getFramenum() {
		return this.framenum;
	}

	public void setFramenum(String framenum) {
		this.framenum = framenum;
	}

	public String getCarload() {
		return this.carload;
	}

	public void setCarload(String carload) {
		this.carload = carload;
	}

	public String getSeatnum() {
		return this.seatnum;
	}

	public void setSeatnum(String seatnum) {
		this.seatnum = seatnum;
	}

	public String getDriver() {
		return this.driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public Date getBuydate() {
		return this.buydate;
	}

	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}

	public String getBuyunit() {
		return this.buyunit;
	}

	public void setBuyunit(String buyunit) {
		this.buyunit = buyunit;
	}

	public Long getBuyprice() {
		return this.buyprice;
	}

	public void setBuyprice(Long buyprice) {
		this.buyprice = buyprice;
	}

	public Long getInitmile() {
		return this.initmile;
	}

	public void setInitmile(Long initmile) {
		this.initmile = initmile;
	}

	public Long getMainmile() {
		return this.mainmile;
	}

	public void setMainmile(Long mainmile) {
		this.mainmile = mainmile;
	}

	public Long getMaincycle() {
		return this.maincycle;
	}

	public void setMaincycle(Long maincycle) {
		this.maincycle = maincycle;
	}

	public String getDepartm() {
		return this.departm;
	}

	public void setDepartm(String departm) {
		this.departm = departm;
	}

	public String getCarstats() {
		return this.carstats;
	}

	public void setCarstats(String carstats) {
		this.carstats = carstats;
	}

	public String getCardes() {
		return this.cardes;
	}

	public void setCardes(String cardes) {
		this.cardes = cardes;
	}

	public Set getSerms() {
		return this.serms;
	}

	public void setSerms(Set serms) {
		this.serms = serms;
	}

	public Set getAnnums() {
		return this.annums;
	}

	public void setAnnums(Set annums) {
		this.annums = annums;
	}

	public Set getMainms() {
		return this.mainms;
	}

	public void setMainms(Set mainms) {
		this.mainms = mainms;
	}

	public Set getFeesms() {
		return this.feesms;
	}

	public void setFeesms(Set feesms) {
		this.feesms = feesms;
	}

	public Set getOilms() {
		return this.oilms;
	}

	public void setOilms(Set oilms) {
		this.oilms = oilms;
	}

	public Set getOutcms() {
		return this.outcms;
	}

	public void setOutcms(Set outcms) {
		this.outcms = outcms;
	}

	public Set getViolms() {
		return this.violms;
	}

	public void setViolms(Set violms) {
		this.violms = violms;
	}

	public Set getInsrms() {
		return this.insrms;
	}

	public void setInsrms(Set insrms) {
		this.insrms = insrms;
	}

}