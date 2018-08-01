package com.java;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Driverm entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Driverm implements java.io.Serializable {

	// Fields

	private Long drivermid;
	private String drivnm;
	private String empnum;
	private String sex;
	private Date birthdy;
	private String nation;
	private String birthpl;
	private String phnum;
	private String email;
	private String drnum;
	private String kind;
	private String fdep;
	private Date fdate;
	private String address;
	private String stats;
	private String des;
	private Set outcms = new HashSet(0);

	// Constructors

	/** default constructor */
	public Driverm() {
	}

	/** full constructor */
	public Driverm(String drivnm, String empnum, String sex, Date birthdy,
			String nation, String birthpl, String phnum, String email,
			String drnum, String kind, String fdep, Date fdate, String address,
			String stats, String des, Set outcms) {
		this.drivnm = drivnm;
		this.empnum = empnum;
		this.sex = sex;
		this.birthdy = birthdy;
		this.nation = nation;
		this.birthpl = birthpl;
		this.phnum = phnum;
		this.email = email;
		this.drnum = drnum;
		this.kind = kind;
		this.fdep = fdep;
		this.fdate = fdate;
		this.address = address;
		this.stats = stats;
		this.des = des;
		this.outcms = outcms;
	}

	// Property accessors

	public Long getDrivermid() {
		return this.drivermid;
	}

	public void setDrivermid(Long drivermid) {
		this.drivermid = drivermid;
	}

	public String getDrivnm() {
		return this.drivnm;
	}

	public void setDrivnm(String drivnm) {
		this.drivnm = drivnm;
	}

	public String getEmpnum() {
		return this.empnum;
	}

	public void setEmpnum(String empnum) {
		this.empnum = empnum;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthdy() {
		return this.birthdy;
	}

	public void setBirthdy(Date birthdy) {
		this.birthdy = birthdy;
	}

	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getBirthpl() {
		return this.birthpl;
	}

	public void setBirthpl(String birthpl) {
		this.birthpl = birthpl;
	}

	public String getPhnum() {
		return this.phnum;
	}

	public void setPhnum(String phnum) {
		this.phnum = phnum;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDrnum() {
		return this.drnum;
	}

	public void setDrnum(String drnum) {
		this.drnum = drnum;
	}

	public String getKind() {
		return this.kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getFdep() {
		return this.fdep;
	}

	public void setFdep(String fdep) {
		this.fdep = fdep;
	}

	public Date getFdate() {
		return this.fdate;
	}

	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStats() {
		return this.stats;
	}

	public void setStats(String stats) {
		this.stats = stats;
	}

	public String getDes() {
		return this.des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Set getOutcms() {
		return this.outcms;
	}

	public void setOutcms(Set outcms) {
		this.outcms = outcms;
	}

}