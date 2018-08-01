package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * CustomerInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CustomerInfo implements java.io.Serializable {

	// Fields

	private Integer customerId;
	private BranchInfo branchInfo;
	private String customerName;
	private String customerLinkMan;
	private String customerSex;
	private String customerPhone;
	private String customerFax;
	private String customerPostId;
	private String customerEmail;
	private String customerRegData;
	private Set billInfosForReceiveId = new HashSet(0);
	private Set billInfosForSendId = new HashSet(0);

	// Constructors

	/** default constructor */
	public CustomerInfo() {
	}

	/** full constructor */
	public CustomerInfo(BranchInfo branchInfo, String customerName,
			String customerLinkMan, String customerSex, String customerPhone,
			String customerFax, String customerPostId, String customerEmail,
			String customerRegData, Set billInfosForReceiveId,
			Set billInfosForSendId) {
		this.branchInfo = branchInfo;
		this.customerName = customerName;
		this.customerLinkMan = customerLinkMan;
		this.customerSex = customerSex;
		this.customerPhone = customerPhone;
		this.customerFax = customerFax;
		this.customerPostId = customerPostId;
		this.customerEmail = customerEmail;
		this.customerRegData = customerRegData;
		this.billInfosForReceiveId = billInfosForReceiveId;
		this.billInfosForSendId = billInfosForSendId;
	}

	// Property accessors

	public Integer getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public BranchInfo getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public String getCustomerName() {
		return this.customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerLinkMan() {
		return this.customerLinkMan;
	}

	public void setCustomerLinkMan(String customerLinkMan) {
		this.customerLinkMan = customerLinkMan;
	}

	public String getCustomerSex() {
		return this.customerSex;
	}

	public void setCustomerSex(String customerSex) {
		this.customerSex = customerSex;
	}

	public String getCustomerPhone() {
		return this.customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerFax() {
		return this.customerFax;
	}

	public void setCustomerFax(String customerFax) {
		this.customerFax = customerFax;
	}

	public String getCustomerPostId() {
		return this.customerPostId;
	}

	public void setCustomerPostId(String customerPostId) {
		this.customerPostId = customerPostId;
	}

	public String getCustomerEmail() {
		return this.customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerRegData() {
		return this.customerRegData;
	}

	public void setCustomerRegData(String customerRegData) {
		this.customerRegData = customerRegData;
	}

	public Set getBillInfosForReceiveId() {
		return this.billInfosForReceiveId;
	}

	public void setBillInfosForReceiveId(Set billInfosForReceiveId) {
		this.billInfosForReceiveId = billInfosForReceiveId;
	}

	public Set getBillInfosForSendId() {
		return this.billInfosForSendId;
	}

	public void setBillInfosForSendId(Set billInfosForSendId) {
		this.billInfosForSendId = billInfosForSendId;
	}

}