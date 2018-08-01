/*
 * @(#)Dept.java 2008-9-16 
 *
 * Copyright 2008 MTA, Inc. All rights reserved.
 */

package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * ������
 * 
 * @author lhq
 * @version 1.0 ����04:49:30
 */
@SuppressWarnings("serial")
public class Dept implements Serializable {
	public Dept() {
		super();
	}

	/** ����ID���Զ���ֵ�� */
	private Integer deptId;

	/** �������� not null 50 */
	private String deptName;

	/** �����ֹ�˾id not null */
	private Integer companyId;

	/** �����ֹ�˾���ƣ������ֶΣ�not null 50 */
	private String companyName;

	/** (����)��ַ 200 */
	private String address;

	/** (����)�绰 20 */
	private String tellPhone;

	/** (����)���������� 20 */
	private String leader;

	/** (����)�����˵绰 20 */
	private String mobilePhone;

	/** ��ע 200 */
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
