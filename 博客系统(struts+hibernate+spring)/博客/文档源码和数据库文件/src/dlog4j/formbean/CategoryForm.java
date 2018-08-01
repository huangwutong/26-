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

import javax.servlet.http.HttpServletRequest;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * CategoryForm.java created by EasyStruts - XsltGen.
 * http://easystruts.sf.net
 * created on 02-03-2004
 * 
 * XDoclet definition:
 * @struts:form name="categoryForm"
 */
public class CategoryForm extends ActionForm {

	public final static int TYPE_OWNER 		= 0x00;		//只有日记所有者才可以看
	public final static int TYPE_GENERAL 	= 0x01;		//一般的日记分类
	public final static int TYPE_COMMON 	= 0x02;		//只要是角色为ROLE_FRIEND的都可以发表日志
	// --------------------------------------------------------- Instance Variables

	/** iconUrl property */
	private String iconUrl;

	/** type property */
	private int type;

	/** order property */
	private int order = -1;//该初始值请不要修改,用于创建分类时order字段的自动处理

	/** name property */
	private String name;

	/** id property */
	private int id = -1;
	
	/** logs property */
	private List logs;
	
	private SiteForm site;
	
	private int logCount = 0;

	// --------------------------------------------------------- Methods
	public boolean isCommon(){
		return type == TYPE_COMMON;
	}
	public boolean isOwnerOnly(){
		return type == TYPE_OWNER;
	}
	/** 
	 * Method validate
	 * @param ActionMapping mapping
	 * @param HttpServletRequest request
	 * @return ActionErrors
	 */
	public ActionErrors validate(
		ActionMapping mapping,
		HttpServletRequest request) {
		ActionErrors aes = new ActionErrors();
		if(type!=TYPE_OWNER&&type!=TYPE_GENERAL&&type!=TYPE_COMMON)
			aes.add("edit",new ActionError("category_type_not_accept"));
		if(name!=null && StringUtils.isEmpty(name))
		    aes.add("edit",new ActionError("not_empty_allow"));
		return aes;
	}

	/** 
	 * Returns the iconUrl.
	 * @return String
	 */
	public String getIconUrl() {
		return iconUrl;
	}

	/** 
	 * Set the iconUrl.
	 * @param iconUrl The iconUrl to set
	 */
	public void setIconUrl(String iconUrl) {
	    if(!"".equals(iconUrl))
	        this.iconUrl = iconUrl;
	}

	/** 
	 * Returns the type.
	 * @return int
	 */
	public int getType() {
		return type;
	}
	
	public String getTypeDesc() {
	    switch(type) {
	    case TYPE_OWNER:
	        return "隐藏分类";
	    case TYPE_GENERAL:
	        return "普通分类";
	    case TYPE_COMMON:
	        return "开放分类";
	    }
	    return null;
	}

	/** 
	 * Set the type.
	 * @param type The type to set
	 */
	public void setType(int type) {
		this.type = type;
	}

	/** 
	 * Returns the order.
	 * @return int
	 */
	public int getOrder() {
		return order;
	}

	/** 
	 * Set the order.
	 * @param order The order to set
	 */
	public void setOrder(int order) {
		this.order = order;
	}

	/** 
	 * Returns the name.
	 * @return String
	 */
	public String getName() {
		return name;
	}

	/** 
	 * Set the name.
	 * @param name The name to set
	 */
	public void setName(String name) {
		this.name = name;
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

	/**
	 * @return
	 */
	public List getLogs() {
		return logs;
	}

	/**
	 * @param list
	 */
	public void setLogs(List list) {
		logs = list;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		return name;
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

    public int getLogCount() {
        return logCount;
    }
    public void setLogCount(int logCount) {
        this.logCount = logCount;
    }
}
