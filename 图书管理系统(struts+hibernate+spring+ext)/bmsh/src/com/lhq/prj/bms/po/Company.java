package com.lhq.prj.bms.po;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Company implements Serializable {
	/** ��˾id */
	private Integer companyId;

	/** ��˾���� */
	private String companyName;

	/** ��˾��ַ */
	private String address;

	/** ��˾�绰 */
	private String tellPhone;

	/** ��˾������ */
	private String leader;

	/** ��˾�����˵绰 */
	private String mobilePhone;

	/** ��ע */
	private String remark;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTellPhone() {
		return tellPhone;
	}

	public void setTellPhone(String tellPhone) {
		this.tellPhone = tellPhone;
	}

}
