package com.action.print;

import java.util.Date;


public class ViolmBean {

	private String carnum;//车牌号
	private Date violdate;//违章日期
	private String violkind;//违章类别
	private String driver;//驾驶员
	private String points;//扣分
	private Long fineje;//罚款金额
	private String violloca;//违章地点
	private String violdes;//备注
	private String violemp;//经办人
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public Date getVioldate() {
		return violdate;
	}
	public void setVioldate(Date violdate) {
		this.violdate = violdate;
	}
	public String getViolkind() {
		return violkind;
	}
	public void setViolkind(String violkind) {
		this.violkind = violkind;
	}
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getPoints() {
		return points;
	}
	public void setPoints(String points) {
		this.points = points;
	}
	public Long getFineje() {
		return fineje;
	}
	public void setFineje(Long fineje) {
		this.fineje = fineje;
	}
	public String getViolloca() {
		return violloca;
	}
	public void setViolloca(String violloca) {
		this.violloca = violloca;
	}
	public String getVioldes() {
		return violdes;
	}
	public void setVioldes(String violdes) {
		this.violdes = violdes;
	}
	public String getViolemp() {
		return violemp;
	}
	public void setViolemp(String violemp) {
		this.violemp = violemp;
	}
	
}
