package com.action.print;

import java.util.Date;

public class SermBean {

	private String carnum;//车牌号
	private Date serdate;//送修日期
	private String seremp;//经办人
	private String sershop;//修理厂
	private Date ytake;//预计取车时间
	private String serron;//送修原因
	private Long serje;//金额
	private Date sjtake;//实际取车时间
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public Date getSerdate() {
		return serdate;
	}
	public void setSerdate(Date serdate) {
		this.serdate = serdate;
	}
	public String getSeremp() {
		return seremp;
	}
	public void setSeremp(String seremp) {
		this.seremp = seremp;
	}
	public String getSershop() {
		return sershop;
	}
	public void setSershop(String sershop) {
		this.sershop = sershop;
	}
	public Date getYtake() {
		return ytake;
	}
	public void setYtake(Date ytake) {
		this.ytake = ytake;
	}
	public String getSerron() {
		return serron;
	}
	public void setSerron(String serron) {
		this.serron = serron;
	}
	public Long getSerje() {
		return serje;
	}
	public void setSerje(Long serje) {
		this.serje = serje;
	}
	public Date getSjtake() {
		return sjtake;
	}
	public void setSjtake(Date sjtake) {
		this.sjtake = sjtake;
	}
	
}
