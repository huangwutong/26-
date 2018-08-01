package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * DepartmentInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class DepartmentInfo implements java.io.Serializable {

	// Fields

	private Integer departmentId;
	private String departmentName;
	private Set userInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public DepartmentInfo() {
	}

	/** full constructor */
	public DepartmentInfo(String departmentName, Set userInfos) {
		this.departmentName = departmentName;
		this.userInfos = userInfos;
	}

	// Property accessors

	public Integer getDepartmentId() {
		return this.departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return this.departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Set getUserInfos() {
		return this.userInfos;
	}

	public void setUserInfos(Set userInfos) {
		this.userInfos = userInfos;
	}

}