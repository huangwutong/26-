package com.service;
import com.bu.yasak.*;

public class Yasak_BusinessService {
	private CustomerInfoBusiness customerbu;
	private BranchInfoBusiness branchbu;
	private BillInfoBusiness billbu;
	private BillInBranchBusiness bibbu;
	private BillInCustomerBusiness bcbu;
	private BillOutCustomerBusiness bocbu;
	private AfficheInfoBusiness aibu;
	
	public CustomerInfoBusiness getCustomerbu() {
		return customerbu;
	}
	public void setCustomerbu(CustomerInfoBusiness customerbu) {
		this.customerbu = customerbu;
	}
	public BranchInfoBusiness getBranchbu() {
		return branchbu;
	}
	public void setBranchbu(BranchInfoBusiness branchbu) {
		this.branchbu = branchbu;
	}
	public BillInfoBusiness getBillbu() {
		return billbu;
	}
	public void setBillbu(BillInfoBusiness billbu) {
		this.billbu = billbu;
	}
	public BillInBranchBusiness getBibbu() {
		return bibbu;
	}
	public void setBibbu(BillInBranchBusiness bibbu) {
		this.bibbu = bibbu;
	}
	public BillInCustomerBusiness getBcbu() {
		return bcbu;
	}
	public void setBcbu(BillInCustomerBusiness bcbu) {
		this.bcbu = bcbu;
	}
	public BillOutCustomerBusiness getBocbu() {
		return bocbu;
	}
	public void setBocbu(BillOutCustomerBusiness bocbu) {
		this.bocbu = bocbu;
	}
	public AfficheInfoBusiness getAibu() {
		return aibu;
	}
	public void setAibu(AfficheInfoBusiness aibu) {
		this.aibu = aibu;
	}
}
