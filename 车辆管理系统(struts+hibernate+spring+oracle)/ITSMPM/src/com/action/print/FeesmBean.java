package com.action.print;

import java.util.Date;


public class FeesmBean {

	private String carnum;//
	private Date feesdate;//缴费日期
	private String feeskid;//缴费类别
	private Long feesje;//缴费金额
	private String feesemp;//经办人
	private String feesdep;//收费单位
	private Long feeszq;//缴费周期
	private String des;//描述
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public Date getFeesdate() {
		return feesdate;
	}
	public void setFeesdate(Date feesdate) {
		this.feesdate = feesdate;
	}
	public String getFeeskid() {
		return feeskid;
	}
	public void setFeeskid(String feeskid) {
		this.feeskid = feeskid;
	}
	public Long getFeesje() {
		return feesje;
	}
	public void setFeesje(Long feesje) {
		this.feesje = feesje;
	}
	public String getFeesemp() {
		return feesemp;
	}
	public void setFeesemp(String feesemp) {
		this.feesemp = feesemp;
	}
	public String getFeesdep() {
		return feesdep;
	}
	public void setFeesdep(String feesdep) {
		this.feesdep = feesdep;
	}
	public Long getFeeszq() {
		return feeszq;
	}
	public void setFeeszq(Long feeszq) {
		this.feeszq = feeszq;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	
	
}
