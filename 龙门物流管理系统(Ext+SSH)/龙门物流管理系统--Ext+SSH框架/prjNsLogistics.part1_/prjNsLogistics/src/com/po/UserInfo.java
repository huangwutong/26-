package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * UserInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class UserInfo implements java.io.Serializable {

	// Fields

	private Integer userId;
	private DepartmentInfo departmentInfo;
	private BranchInfo branchInfo;
	private RoleInfo roleInfo;
	private String userName;
	private String userRname;
	private String userPassword;
	private String userSex;
	private String userPhone;
	private String userCardId;
	private String userLoginNum;
	private String userLoginData;
	private String userRegData;
	private Set systemLogs = new HashSet(0);
	private Set afficheInfos = new HashSet(0);
	private Set billInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public UserInfo() {
	}

	/** full constructor */
	public UserInfo(DepartmentInfo departmentInfo, BranchInfo branchInfo,
			RoleInfo roleInfo, String userName, String userRname,
			String userPassword, String userSex, String userPhone,
			String userCardId, String userLoginNum, String userLoginData,
			String userRegData, Set systemLogs, Set afficheInfos, Set billInfos) {
		this.departmentInfo = departmentInfo;
		this.branchInfo = branchInfo;
		this.roleInfo = roleInfo;
		this.userName = userName;
		this.userRname = userRname;
		this.userPassword = userPassword;
		this.userSex = userSex;
		this.userPhone = userPhone;
		this.userCardId = userCardId;
		this.userLoginNum = userLoginNum;
		this.userLoginData = userLoginData;
		this.userRegData = userRegData;
		this.systemLogs = systemLogs;
		this.afficheInfos = afficheInfos;
		this.billInfos = billInfos;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public DepartmentInfo getDepartmentInfo() {
		return this.departmentInfo;
	}

	public void setDepartmentInfo(DepartmentInfo departmentInfo) {
		this.departmentInfo = departmentInfo;
	}

	public BranchInfo getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public RoleInfo getRoleInfo() {
		return this.roleInfo;
	}

	public void setRoleInfo(RoleInfo roleInfo) {
		this.roleInfo = roleInfo;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRname() {
		return this.userRname;
	}

	public void setUserRname(String userRname) {
		this.userRname = userRname;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserSex() {
		return this.userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserPhone() {
		return this.userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserCardId() {
		return this.userCardId;
	}

	public void setUserCardId(String userCardId) {
		this.userCardId = userCardId;
	}

	public String getUserLoginNum() {
		return this.userLoginNum;
	}

	public void setUserLoginNum(String userLoginNum) {
		this.userLoginNum = userLoginNum;
	}

	public String getUserLoginData() {
		return this.userLoginData;
	}

	public void setUserLoginData(String userLoginData) {
		this.userLoginData = userLoginData;
	}

	public String getUserRegData() {
		return this.userRegData;
	}

	public void setUserRegData(String userRegData) {
		this.userRegData = userRegData;
	}

	public Set getSystemLogs() {
		return this.systemLogs;
	}

	public void setSystemLogs(Set systemLogs) {
		this.systemLogs = systemLogs;
	}

	public Set getAfficheInfos() {
		return this.afficheInfos;
	}

	public void setAfficheInfos(Set afficheInfos) {
		this.afficheInfos = afficheInfos;
	}

	public Set getBillInfos() {
		return this.billInfos;
	}

	public void setBillInfos(Set billInfos) {
		this.billInfos = billInfos;
	}

}