/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.struts.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 08-13-2008
 * 
 * XDoclet definition:
 * @struts.form name="carmackDriverInfoForm"
 */
public class CarmackDriverInfoForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** driverCardID property */
	private String driverCardID;

	/** branchID property */
	private String branchID;

	/** driverPhoto property */
	private String driverPhoto;

	/** driverID property */
	private String driverID;

	/** driverName property */
	private String driverName;

	/** driverIsVacancy property */
	private String driverIsVacancy;

	/** driverMemo property */
	private String driverMemo;

	/** driverAge property */
	private String driverAge;

	/** driverPhone property */
	private String driverPhone;

	/** driverDriveCardID property */
	private String driverDriveCardID;

	/** driverSex property */
	private String driverSex;

	/*
	 * Generated Methods
	 */

	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}

	/** 
	 * Returns the driverCardID.
	 * @return String
	 */
	public String getDriverCardID() {
		return driverCardID;
	}

	/** 
	 * Set the driverCardID.
	 * @param driverCardID The driverCardID to set
	 */
	public void setDriverCardID(String driverCardID) {
		this.driverCardID = driverCardID;
	}

	/** 
	 * Returns the branchID.
	 * @return String
	 */
	public String getBranchID() {
		return branchID;
	}

	/** 
	 * Set the branchID.
	 * @param branchID The branchID to set
	 */
	public void setBranchID(String branchID) {
		this.branchID = branchID;
	}

	/** 
	 * Returns the driverPhoto.
	 * @return String
	 */
	public String getDriverPhoto() {
		return driverPhoto;
	}

	/** 
	 * Set the driverPhoto.
	 * @param driverPhoto The driverPhoto to set
	 */
	public void setDriverPhoto(String driverPhoto) {
		this.driverPhoto = driverPhoto;
	}

	/** 
	 * Returns the driverID.
	 * @return String
	 */
	public String getDriverID() {
		return driverID;
	}

	/** 
	 * Set the driverID.
	 * @param driverID The driverID to set
	 */
	public void setDriverID(String driverID) {
		this.driverID = driverID;
	}

	/** 
	 * Returns the driverName.
	 * @return String
	 */
	public String getDriverName() {
		return driverName;
	}

	/** 
	 * Set the driverName.
	 * @param driverName The driverName to set
	 */
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	/** 
	 * Returns the driverIsVacancy.
	 * @return String
	 */
	public String getDriverIsVacancy() {
		return driverIsVacancy;
	}

	/** 
	 * Set the driverIsVacancy.
	 * @param driverIsVacancy The driverIsVacancy to set
	 */
	public void setDriverIsVacancy(String driverIsVacancy) {
		this.driverIsVacancy = driverIsVacancy;
	}

	/** 
	 * Returns the driverMemo.
	 * @return String
	 */
	public String getDriverMemo() {
		return driverMemo;
	}

	/** 
	 * Set the driverMemo.
	 * @param driverMemo The driverMemo to set
	 */
	public void setDriverMemo(String driverMemo) {
		this.driverMemo = driverMemo;
	}

	/** 
	 * Returns the driverAge.
	 * @return String
	 */
	public String getDriverAge() {
		return driverAge;
	}

	/** 
	 * Set the driverAge.
	 * @param driverAge The driverAge to set
	 */
	public void setDriverAge(String driverAge) {
		this.driverAge = driverAge;
	}

	/** 
	 * Returns the driverPhone.
	 * @return String
	 */
	public String getDriverPhone() {
		return driverPhone;
	}

	/** 
	 * Set the driverPhone.
	 * @param driverPhone The driverPhone to set
	 */
	public void setDriverPhone(String driverPhone) {
		this.driverPhone = driverPhone;
	}

	/** 
	 * Returns the driverDriveCardID.
	 * @return String
	 */
	public String getDriverDriveCardID() {
		return driverDriveCardID;
	}

	/** 
	 * Set the driverDriveCardID.
	 * @param driverDriveCardID The driverDriveCardID to set
	 */
	public void setDriverDriveCardID(String driverDriveCardID) {
		this.driverDriveCardID = driverDriveCardID;
	}

	/** 
	 * Returns the driverSex.
	 * @return String
	 */
	public String getDriverSex() {
		return driverSex;
	}

	/** 
	 * Set the driverSex.
	 * @param driverSex The driverSex to set
	 */
	public void setDriverSex(String driverSex) {
		this.driverSex = driverSex;
	}
}