/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j.formbean;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;


import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

import dlog4j.util.HtmlUtil;

/** 
 * ReplayForm.java created by EasyStruts - XsltGen.
 * http://easystruts.sf.net
 * created on 02-03-2004
 * 
 * XDoclet definition:
 * @struts:form name="replyForm"
 */
public class ReplyForm extends ContentPreviewForm {

	// --------------------------------------------------------- Instance Variables

	/** faceUrl property */
	private String faceUrl;

	/** writeTime property */
	private Date writeTime;

	/** id property */
	private int id;

	/** parant log property */
	private LogForm log;

	/** author property */
	private UserForm author;
	
	private SiteForm site;

	int useFace = 1;
	int useUbb = 1;
	int showFormerly = 0;
	// --------------------------------------------------------- Methods

	/** 
	 * Method validate
	 * @param ActionMapping mapping
	 * @param HttpServletRequest request
	 * @return ActionErrors
	 */
	public ActionErrors validate(
		ActionMapping mapping,
		HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		return errors;
	}

    public void reset(ActionMapping mapping, HttpServletRequest req) {
        writeTime = null;
        faceUrl = null;
        useFace = 1;
        useUbb = 1;
        showFormerly = 0;
        content = null;
    }
	/** 
	 * Returns the faceUrl.
	 * @return String
	 */
	public String getFaceUrl() {
		return faceUrl;
	}

	/** 
	 * Set the faceUrl.
	 * @param faceUrl The faceUrl to set
	 */
	public void setFaceUrl(String faceUrl) {
		this.faceUrl = faceUrl;
	}

	public static void main(String[] args) {
	    ReplyForm r = new ReplyForm();
	    r.setContent("<FONT style=\"BACKGROUND-COLOR: #ffccff\" color=#660033><TABLE cellSpacing=1 cellPadding=2 width=\"100%\" border=1><TBODY><TR><TD></TD><TD></TD><TD></TD></TR><TR><TD></TD><TD></TD><TD></TD></TR><TR><TD></TD><TD></TD><TD></TD></TR><TR><TD></TD><TD></TD><TD></TD></TR></TBODY></TABLE><BR>现在要搞评论的修改了！</FONT> ");
	    System.out.print(r.getBrief());
	}

	public String getHtmlContent(){
		return HtmlUtil.makeHtml(content, useFace==1, useUbb==1);
	}

	/** 
	 * Returns the writeTime.
	 * @return Date
	 */
	public Date getWriteTime() {
		return writeTime;
	}
	/** 
	 * Set the writeTime.
	 * @param writeTime The writeTime to set
	 */
	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}

	/** 
	 * Returns the id.
	 * @return int
	 */
	public int getId() {
		return id;
	}

	/** 
	 * Set the id.
	 * @param id The id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	public int getAuthorId() {
		return author.getId();
	}
	public void setAuthorId(int aid) {
		if (author == null)
			author = new UserForm();
		author.setId(aid);
	}
	public String getAuthorName() {
		return author.getDisplayName();
	}
	/**
	 * @return
	 */
	public UserForm getAuthor() {
		return author;
	}

	/**
	 * @param form
	 */
	public void setAuthor(UserForm form) {
		author = form;
	}

	/**
	 * @return
	 */
	public LogForm getLog() {
		return log;
	}

	/**
	 * @param form
	 */
	public void setLog(LogForm form) {
		log = form;
	}

	/**
	 * @return
	 */
	public int getLogId() {
		return log.getId();
	}

	/**
	 * @param form
	 */
	public void setLogId(int logid) {
		if (log == null)
			log = new LogForm();
		log.setId(logid);
	}

	/**
	 * @return
	 */
	public int getUseFace() {
		return useFace;
	}

	/**
	 * @return
	 */
	public int getUseUbb() {
		return useUbb;
	}

	/**
	 * @param i
	 */
	public void setUseFace(int i) {
		useFace = i;
	}

	/**
	 * @param i
	 */
	public void setUseUbb(int i) {
		useUbb = i;
	}

	/**
	 * @return
	 */
	public int getShowFormerly() {
		return showFormerly;
	}

	/**
	 * @param i
	 */
	public void setShowFormerly(int i) {
		showFormerly = i;
	}

	/**
	 * @return
	 */
	public SiteForm getSite() {
		return site;
	}

	/**
	 * @param form
	 */
	public void setSite(SiteForm form) {
		site = form;
	}

}
