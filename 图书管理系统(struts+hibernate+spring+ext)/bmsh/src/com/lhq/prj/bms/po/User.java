package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * User.java Create on 2008-9-18 ����09:32:48
 * 
 * �û���
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author �����
 * @version 1.0
 */
@SuppressWarnings("serial")
public class User implements Serializable {

	public User() {
	}

	/** �û�id */
	private Integer userId;

	/** Ա������ */
	private String emplName;

	/** Ա������ */
	private String emplNo;

	/** �ƶ��绰 */
	private String mobilePhone;

	/** �Ա� */
	private String sex;

	/** ���� */
	private Integer age;

	/** �û��� */
	private String userName;

	/** ���� */
	private String password;

	/** �����ֹ�˾��id */
	private Integer companyId;

	/** �����ֹ�˾ */
	private String companyName;

	/** �������ŵ�id */
	private Integer deptId;

	/** �������� */
	private String deptName;

	/** ְ��id */
	private Integer dutyId;

	/** ְ������ */
	private String dutyName;

	/** �Ƿ����Ա */
	private boolean manager;

	/** ��ע */
	private String remark;

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
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

	public Integer getDeptId() {
		return deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public Integer getDutyId() {
		return dutyId;
	}

	public void setDutyId(Integer dutyId) {
		this.dutyId = dutyId;
	}

	public String getDutyName() {
		return dutyName;
	}

	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}

	public String getEmplName() {
		return emplName;
	}

	public void setEmplName(String emplName) {
		this.emplName = emplName;
	}

	public String getEmplNo() {
		return emplNo;
	}

	public void setEmplNo(String emplNo) {
		this.emplNo = emplNo;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}

	public boolean isManager() {
		return manager;
	}

	public void setManager(boolean manager) {
		this.manager = manager;
	}


}
