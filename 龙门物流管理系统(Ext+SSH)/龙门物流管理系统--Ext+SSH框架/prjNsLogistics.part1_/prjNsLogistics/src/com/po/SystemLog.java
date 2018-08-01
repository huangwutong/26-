package com.po;

/**
 * SystemLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class SystemLog implements java.io.Serializable {

	// Fields

	private Integer systemLogId;
	private BranchInfo branchInfo;
	private UserInfo userInfo;
	private String systemLogMemo;

	// Constructors

	/** default constructor */
	public SystemLog() {
	}

	/** full constructor */
	public SystemLog(BranchInfo branchInfo, UserInfo userInfo,
			String systemLogMemo) {
		this.branchInfo = branchInfo;
		this.userInfo = userInfo;
		this.systemLogMemo = systemLogMemo;
	}

	// Property accessors

	public Integer getSystemLogId() {
		return this.systemLogId;
	}

	public void setSystemLogId(Integer systemLogId) {
		this.systemLogId = systemLogId;
	}

	public BranchInfo getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public UserInfo getUserInfo() {
		return this.userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public String getSystemLogMemo() {
		return this.systemLogMemo;
	}

	public void setSystemLogMemo(String systemLogMemo) {
		this.systemLogMemo = systemLogMemo;
	}

}