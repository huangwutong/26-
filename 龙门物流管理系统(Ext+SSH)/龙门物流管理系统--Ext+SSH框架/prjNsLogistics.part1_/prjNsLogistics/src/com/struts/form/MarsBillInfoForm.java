/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.struts.form;

import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 08-15-2008
 * 
 * XDoclet definition:
 * @struts.form name="marsBillInfoForm"
 */
public class MarsBillInfoForm extends ActionForm {
	/*
	 * Generated fields
	 */

	/** receivebranchname property */
	private String receivebranchname;

	/** billid property */
	private String billid;

	/** sendbranchname property */
	private String sendbranchname;

	/** billdata property */
	private String billdata;

	/** receivecusname property */
	private String receivecusname;

	/** sendbranchid property */
	private String sendbranchid;

	/** sendid property */
	private String sendid;

	/** sendcusname property */
	private String sendcusname;

	/** cgvcs property */
	private Vector cgvcs;

	/** truckline property */
	private String truckline;

	/** payername property */
	private String payername;

	/** userid property */
	private String userid;

	/** billmemo property */
	private String billmemo;

	/** receiveid property */
	private String receiveid;

	/** cgid property */
	private String[] cgid;

	/** billstateid property */
	private String billstateid;

	/** username property */
	private String username;

	/** receivebranchid property */
	private String receivebranchid;

	/** billstatename property */
	private String billstatename;

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
	 * Returns the receivebranchname.
	 * @return String
	 */
	public String getReceivebranchname() {
		return receivebranchname;
	}

	/** 
	 * Set the receivebranchname.
	 * @param receivebranchname The receivebranchname to set
	 */
	public void setReceivebranchname(String receivebranchname) {
		this.receivebranchname = receivebranchname;
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
	 * Returns the sendbranchname.
	 * @return String
	 */
	public String getSendbranchname() {
		return sendbranchname;
	}

	/** 
	 * Set the sendbranchname.
	 * @param sendbranchname The sendbranchname to set
	 */
	public void setSendbranchname(String sendbranchname) {
		this.sendbranchname = sendbranchname;
	}

	/** 
	 * Returns the billdata.
	 * @return String
	 */
	public String getBilldata() {
		return billdata;
	}

	/** 
	 * Set the billdata.
	 * @param billdata The billdata to set
	 */
	public void setBilldata(String billdata) {
		this.billdata = billdata;
	}

	/** 
	 * Returns the receivecusname.
	 * @return String
	 */
	public String getReceivecusname() {
		return receivecusname;
	}

	/** 
	 * Set the receivecusname.
	 * @param receivecusname The receivecusname to set
	 */
	public void setReceivecusname(String receivecusname) {
		this.receivecusname = receivecusname;
	}

	/** 
	 * Returns the sendbranchid.
	 * @return String
	 */
	public String getSendbranchid() {
		return sendbranchid;
	}

	/** 
	 * Set the sendbranchid.
	 * @param sendbranchid The sendbranchid to set
	 */
	public void setSendbranchid(String sendbranchid) {
		this.sendbranchid = sendbranchid;
	}

	/** 
	 * Returns the sendid.
	 * @return String
	 */
	public String getSendid() {
		return sendid;
	}

	/** 
	 * Set the sendid.
	 * @param sendid The sendid to set
	 */
	public void setSendid(String sendid) {
		this.sendid = sendid;
	}

	/** 
	 * Returns the sendcusname.
	 * @return String
	 */
	public String getSendcusname() {
		return sendcusname;
	}

	/** 
	 * Set the sendcusname.
	 * @param sendcusname The sendcusname to set
	 */
	public void setSendcusname(String sendcusname) {
		this.sendcusname = sendcusname;
	}

	/** 
	 * Returns the cgvcs.
	 * @return Vector
	 */
	public Vector getCgvcs() {
		return cgvcs;
	}

	/** 
	 * Set the cgvcs.
	 * @param cgvcs The cgvcs to set
	 */
	public void setCgvcs(Vector cgvcs) {
		this.cgvcs = cgvcs;
	}

	/** 
	 * Returns the truckline.
	 * @return String
	 */
	public String getTruckline() {
		return truckline;
	}

	/** 
	 * Set the truckline.
	 * @param truckline The truckline to set
	 */
	public void setTruckline(String truckline) {
		this.truckline = truckline;
	}

	/** 
	 * Returns the payername.
	 * @return String
	 */
	public String getPayername() {
		return payername;
	}

	/** 
	 * Set the payername.
	 * @param payername The payername to set
	 */
	public void setPayername(String payername) {
		this.payername = payername;
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
	 * Returns the billmemo.
	 * @return String
	 */
	public String getBillmemo() {
		return billmemo;
	}

	/** 
	 * Set the billmemo.
	 * @param billmemo The billmemo to set
	 */
	public void setBillmemo(String billmemo) {
		this.billmemo = billmemo;
	}

	/** 
	 * Returns the receiveid.
	 * @return String
	 */
	public String getReceiveid() {
		return receiveid;
	}

	/** 
	 * Set the receiveid.
	 * @param receiveid The receiveid to set
	 */
	public void setReceiveid(String receiveid) {
		this.receiveid = receiveid;
	}

	/** 
	 * Returns the cgid.
	 * @return String[]
	 */
	public String[] getCgid() {
		return cgid;
	}

	/** 
	 * Set the cgid.
	 * @param cgid The cgid to set
	 */
	public void setCgid(String[] cgid) {
		this.cgid = cgid;
	}

	/** 
	 * Returns the billstateid.
	 * @return String
	 */
	public String getBillstateid() {
		return billstateid;
	}

	/** 
	 * Set the billstateid.
	 * @param billstateid The billstateid to set
	 */
	public void setBillstateid(String billstateid) {
		this.billstateid = billstateid;
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
	 * Returns the receivebranchid.
	 * @return String
	 */
	public String getReceivebranchid() {
		return receivebranchid;
	}

	/** 
	 * Set the receivebranchid.
	 * @param receivebranchid The receivebranchid to set
	 */
	public void setReceivebranchid(String receivebranchid) {
		this.receivebranchid = receivebranchid;
	}

	/** 
	 * Returns the billstatename.
	 * @return String
	 */
	public String getBillstatename() {
		return billstatename;
	}

	/** 
	 * Set the billstatename.
	 * @param billstatename The billstatename to set
	 */
	public void setBillstatename(String billstatename) {
		this.billstatename = billstatename;
	}
}