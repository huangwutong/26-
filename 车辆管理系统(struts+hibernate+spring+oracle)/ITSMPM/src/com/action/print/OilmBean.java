package com.action.print;

import java.util.Date;


public class OilmBean {

	private String carnum;//车牌号
	private String oilcnum;//加油卡号
	private String oilkind;//油料品种
	private Date oildate;//加油日期
	private Long oprice;//单价
	private Long ocount;//数量
	private Long amount;//金额
	private String handnm;//经办人
	private Long nowmile;//此时里程
	private Long lastmile;//上次加油里程
	private Long lastoil;//上次加油数量
	private Long lasttrav;//上次行程
	private String gasnm;//加油站名称
	private String oildes;//备注
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public String getOilcnum() {
		return oilcnum;
	}
	public void setOilcnum(String oilcnum) {
		this.oilcnum = oilcnum;
	}
	public String getOilkind() {
		return oilkind;
	}
	public void setOilkind(String oilkind) {
		this.oilkind = oilkind;
	}
	public Date getOildate() {
		return oildate;
	}
	public void setOildate(Date oildate) {
		this.oildate = oildate;
	}
	public Long getOprice() {
		return oprice;
	}
	public void setOprice(Long oprice) {
		this.oprice = oprice;
	}
	public Long getOcount() {
		return ocount;
	}
	public void setOcount(Long ocount) {
		this.ocount = ocount;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getHandnm() {
		return handnm;
	}
	public void setHandnm(String handnm) {
		this.handnm = handnm;
	}
	public Long getNowmile() {
		return nowmile;
	}
	public void setNowmile(Long nowmile) {
		this.nowmile = nowmile;
	}
	public Long getLastmile() {
		return lastmile;
	}
	public void setLastmile(Long lastmile) {
		this.lastmile = lastmile;
	}
	public Long getLastoil() {
		return lastoil;
	}
	public void setLastoil(Long lastoil) {
		this.lastoil = lastoil;
	}
	public Long getLasttrav() {
		return lasttrav;
	}
	public void setLasttrav(Long lasttrav) {
		this.lasttrav = lasttrav;
	}
	public String getGasnm() {
		return gasnm;
	}
	public void setGasnm(String gasnm) {
		this.gasnm = gasnm;
	}
	public String getOildes() {
		return oildes;
	}
	public void setOildes(String oildes) {
		this.oildes = oildes;
	}
	
}
