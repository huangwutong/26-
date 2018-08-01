package com.po;

/**
 * AfficheInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class AfficheInfo implements java.io.Serializable {

	// Fields

	private Integer affichelD;
	private BranchInfo branchInfo;
	private UserInfo userInfo;
	private String afficheTitle;
	private String afficheContent;
	private String afficheData;

	// Constructors

	/** default constructor */
	public AfficheInfo() {
	}

	/** full constructor */
	public AfficheInfo(BranchInfo branchInfo, UserInfo userInfo,
			String afficheTitle, String afficheContent, String afficheData) {
		this.branchInfo = branchInfo;
		this.userInfo = userInfo;
		this.afficheTitle = afficheTitle;
		this.afficheContent = afficheContent;
		this.afficheData = afficheData;
	}

	// Property accessors

	public Integer getAffichelD() {
		return this.affichelD;
	}

	public void setAffichelD(Integer affichelD) {
		this.affichelD = affichelD;
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

	public String getAfficheTitle() {
		return this.afficheTitle;
	}

	public void setAfficheTitle(String afficheTitle) {
		this.afficheTitle = afficheTitle;
	}

	public String getAfficheContent() {
		return this.afficheContent;
	}

	public void setAfficheContent(String afficheContent) {
		this.afficheContent = afficheContent;
	}

	public String getAfficheData() {
		return this.afficheData;
	}

	public void setAfficheData(String afficheData) {
		this.afficheData = afficheData;
	}

}