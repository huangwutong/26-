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
 * Creation date: 08-16-2007
 * 
 * XDoclet definition:
 * @struts.form name="optCargoVectorForm"
 */
public class OptCargoVectorForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** cvid property */
	private String cvid;

	/** billid property */
	private String billid;

	/** cargoid property */
	private String cargoid;

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
	 * Returns the cvid.
	 * @return String
	 */
	public String getCvid() {
		return cvid;
	}

	/** 
	 * Set the cvid.
	 * @param cvid The cvid to set
	 */
	public void setCvid(String cvid) {
		this.cvid = cvid;
	}

	/** 
	 * Returns the billid.
	 * @return String
	 */
	public String getBillid() {
		return billid;
	}

	/** 
	 * Set the billid.
	 * @param billid The billid to set
	 */
	public void setBillid(String billid) {
		this.billid = billid;
	}

	/** 
	 * Returns the cargoid.
	 * @return String
	 */
	public String getCargoid() {
		return cargoid;
	}

	/** 
	 * Set the cargoid.
	 * @param cargoid The cargoid to set
	 */
	public void setCargoid(String cargoid) {
		this.cargoid = cargoid;
	}
}