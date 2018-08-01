package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * RoleInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class RoleInfo implements java.io.Serializable {

	// Fields

	private Integer roleId;
	private String roleName;
	private Integer roleClient;
	private Integer roleTicket;
	private Integer roleBranch;
	private Integer roleTraffic;
	private Integer roleQuery;
	private Integer roleBasicInfo;
	private Set userInfos = new HashSet(0);

	// Constructors

	/** default constructor */
	public RoleInfo() {
	}

	/** full constructor */
	public RoleInfo(String roleName, Integer roleClient, Integer roleTicket,
			Integer roleBranch, Integer roleTraffic, Integer roleQuery,
			Integer roleBasicInfo, Set userInfos) {
		this.roleName = roleName;
		this.roleClient = roleClient;
		this.roleTicket = roleTicket;
		this.roleBranch = roleBranch;
		this.roleTraffic = roleTraffic;
		this.roleQuery = roleQuery;
		this.roleBasicInfo = roleBasicInfo;
		this.userInfos = userInfos;
	}

	// Property accessors

	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getRoleClient() {
		return this.roleClient;
	}

	public void setRoleClient(Integer roleClient) {
		this.roleClient = roleClient;
	}

	public Integer getRoleTicket() {
		return this.roleTicket;
	}

	public void setRoleTicket(Integer roleTicket) {
		this.roleTicket = roleTicket;
	}

	public Integer getRoleBranch() {
		return this.roleBranch;
	}

	public void setRoleBranch(Integer roleBranch) {
		this.roleBranch = roleBranch;
	}

	public Integer getRoleTraffic() {
		return this.roleTraffic;
	}

	public void setRoleTraffic(Integer roleTraffic) {
		this.roleTraffic = roleTraffic;
	}

	public Integer getRoleQuery() {
		return this.roleQuery;
	}

	public void setRoleQuery(Integer roleQuery) {
		this.roleQuery = roleQuery;
	}

	public Integer getRoleBasicInfo() {
		return this.roleBasicInfo;
	}

	public void setRoleBasicInfo(Integer roleBasicInfo) {
		this.roleBasicInfo = roleBasicInfo;
	}

	public Set getUserInfos() {
		return this.userInfos;
	}

	public void setUserInfos(Set userInfos) {
		this.userInfos = userInfos;
	}

}