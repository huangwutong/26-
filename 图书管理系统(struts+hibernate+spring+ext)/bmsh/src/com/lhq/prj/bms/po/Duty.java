package com.lhq.prj.bms.po;

import java.io.Serializable;

/**
 * Duty.java Create on 2008-9-18 ����08:02:11
 * 
 * ְ��
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author �����
 * @version 1.0
 */
@SuppressWarnings("serial")
public class Duty implements Serializable {

	public Duty() {
	}

	public Duty(Integer dutyId, String dutyName, String remark) {
		this.dutyId = dutyId;
		this.dutyName = dutyName;
		this.remark = remark;
	}

	/** ְ��id */
	private Integer dutyId;

	/** ְ������ */
	private String dutyName;

	/** ��ע */
	private String remark;

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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
