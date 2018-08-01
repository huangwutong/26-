package com.po;

import java.util.HashSet;
import java.util.Set;

/**
 * TruckInfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class TruckInfo implements java.io.Serializable {

	// Fields

	private Integer truckId;
	private TruckModel truckModel;
	private BranchInfo branchInfo;
	private String truckNum;
	private String truckEngineNum;
	private String truckRunNum;
	private String truckInsuranceNum;
	private String truckColor;
	private String truckPhoto;
	private String truckBuyData;
	private Integer truckIsVacancy;
	private Set truckLogs = new HashSet(0);

	// Constructors

	/** default constructor */
	public TruckInfo() {
	}

	/** full constructor */
	public TruckInfo(TruckModel truckModel, BranchInfo branchInfo,
			String truckNum, String truckEngineNum, String truckRunNum,
			String truckInsuranceNum, String truckColor, String truckPhoto,
			String truckBuyData, Integer truckIsVacancy, Set truckLogs) {
		this.truckModel = truckModel;
		this.branchInfo = branchInfo;
		this.truckNum = truckNum;
		this.truckEngineNum = truckEngineNum;
		this.truckRunNum = truckRunNum;
		this.truckInsuranceNum = truckInsuranceNum;
		this.truckColor = truckColor;
		this.truckPhoto = truckPhoto;
		this.truckBuyData = truckBuyData;
		this.truckIsVacancy = truckIsVacancy;
		this.truckLogs = truckLogs;
	}

	// Property accessors

	public Integer getTruckId() {
		return this.truckId;
	}

	public void setTruckId(Integer truckId) {
		this.truckId = truckId;
	}

	public TruckModel getTruckModel() {
		return this.truckModel;
	}

	public void setTruckModel(TruckModel truckModel) {
		this.truckModel = truckModel;
	}

	public BranchInfo getBranchInfo() {
		return this.branchInfo;
	}

	public void setBranchInfo(BranchInfo branchInfo) {
		this.branchInfo = branchInfo;
	}

	public String getTruckNum() {
		return this.truckNum;
	}

	public void setTruckNum(String truckNum) {
		this.truckNum = truckNum;
	}

	public String getTruckEngineNum() {
		return this.truckEngineNum;
	}

	public void setTruckEngineNum(String truckEngineNum) {
		this.truckEngineNum = truckEngineNum;
	}

	public String getTruckRunNum() {
		return this.truckRunNum;
	}

	public void setTruckRunNum(String truckRunNum) {
		this.truckRunNum = truckRunNum;
	}

	public String getTruckInsuranceNum() {
		return this.truckInsuranceNum;
	}

	public void setTruckInsuranceNum(String truckInsuranceNum) {
		this.truckInsuranceNum = truckInsuranceNum;
	}

	public String getTruckColor() {
		return this.truckColor;
	}

	public void setTruckColor(String truckColor) {
		this.truckColor = truckColor;
	}

	public String getTruckPhoto() {
		return this.truckPhoto;
	}

	public void setTruckPhoto(String truckPhoto) {
		this.truckPhoto = truckPhoto;
	}

	public String getTruckBuyData() {
		return this.truckBuyData;
	}

	public void setTruckBuyData(String truckBuyData) {
		this.truckBuyData = truckBuyData;
	}

	public Integer getTruckIsVacancy() {
		return this.truckIsVacancy;
	}

	public void setTruckIsVacancy(Integer truckIsVacancy) {
		this.truckIsVacancy = truckIsVacancy;
	}

	public Set getTruckLogs() {
		return this.truckLogs;
	}

	public void setTruckLogs(Set truckLogs) {
		this.truckLogs = truckLogs;
	}

}