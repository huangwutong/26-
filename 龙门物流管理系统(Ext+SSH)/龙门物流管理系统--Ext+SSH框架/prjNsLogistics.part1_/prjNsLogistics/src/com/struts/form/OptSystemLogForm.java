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
 * @struts.form name="optSystemLogForm"
 */
public class OptSystemLogForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** systemlogid property */
	private String systemlogid;

	/** branchname property */
	private String branchname;

	/** userid property */
	private String userid;

	/** username property */
	private String username;

	/** systemlogmemo property */
	private String systemlogmemo;

	/** branchid property */
	private String branchid;

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
	 * Returns the systemlogid.
	 * @return String
	 */
	public String getSystemlogid() {
		return systemlogid;
	}

	/** 
	 * Set the systemlogid.
	 * @param systemlogid The systemlogid to set
	 */
	public void setSystemlogid(String systemlogid) {
		this.systemlogid = systemlogid;
	}

	/** 
	 * Returns the branchname.
	 * @return String
	 */
	public String getBranchname() {
		return branchname;
	}

	/** 
	 * Set the branchname.
	 * @param branchname The branchname to set
	 */
	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}

	/** 
	 * Returns the userid.
	 * @return String
	 */
	public String getUserid() {
		return userid;
	}

	/** 
	 * Set the userid.
	 * @param userid The userid to set
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}

	/** 
	 * Returns the username.
	 * @return String
	 */
	public String getUsername() {
		return username;
	}

	/** 
	 * Set the username.
	 * @param username The username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/** 
	 * Returns the systemlogmemo.
	 * @return String
	 */
	public String getSystemlogmemo() {
		return systemlogmemo;
	}

	/** 
	 * Set the systemlogmemo.
	 * @param systemlogmemo The systemlogmemo to set
	 */
	public void setSystemlogmemo(String systemlogmemo) {
		this.systemlogmemo = systemlogmemo;
	}

	/** 
	 * Returns the branchid.
	 * @return String
	 */
	public String getBranchid() {
		return branchid;
	}

	/** 
	 * Set the branchid.
	 * @param branchid The branchid to set
	 */
	public void setBranchid(String branchid) {
		this.branchid = branchid;
	}
}