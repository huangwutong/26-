package com.action.print;

import java.util.Date;


public class AnnumBean {

	private String carnum;
	private Date annumdate;//年检日期
	private String anum;//年检章号
	private Long anfy;//年检费用
	private String anemp;///经办人
	private String andep;//年检单位
	private Date anenda;//有效期限
	private String andes;//备注
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public Date getAnnumdate() {
		return annumdate;
	}
	public void setAnnumdate(Date annumdate) {
		this.annumdate = annumdate;
	}
	public String getAnum() {
		return anum;
	}
	public void setAnum(String anum) {
		this.anum = anum;
	}
	public Long getAnfy() {
		return anfy;
	}
	public void setAnfy(Long anfy) {
		this.anfy = anfy;
	}
	public String getAnemp() {
		return anemp;
	}
	public void setAnemp(String anemp) {
		this.anemp = anemp;
	}
	public String getAndep() {
		return andep;
	}
	public void setAndep(String andep) {
		this.andep = andep;
	}
	public Date getAnenda() {
		return anenda;
	}
	public void setAnenda(Date anenda) {
		this.anenda = anenda;
	}
	public String getAndes() {
		return andes;
	}
	public void setAndes(String andes) {
		this.andes = andes;
	}
	
}
