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

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

/**
 * @author Liudong
 * 系统参数对象
 */
public class ParamForm extends DlogActionForm {
	
	public final static int TYPE_INTEGER = 0x01;
	public final static int TYPE_STRING  = 0x02;
	public final static int TYPE_BOOLEAN = 0x03;
	public final static int TYPE_DATE	 = 0x04;
	public final static int TYPE_TIME	 = 0x08;
	public final static int TYPE_DATETIME= 0x10;
	
	private int id;
	private String name;
	private int type;
	private String value;
	private String desc;
	
	private SiteForm site;

	/* (non-Javadoc)
	 * @see org.apache.struts.action.ActionForm#validate(org.apache.struts.action.ActionMapping, javax.servlet.http.HttpServletRequest)
	 */
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest req) {
		ActionErrors es = new ActionErrors();
		if(type==TYPE_INTEGER && !StringUtils.isNumeric(value))
		    es.add("value",new ActionError("illegal_input_value"));
		return es;
	}
	/**
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return
	 */
	public int getType() {
		return type;
	}
	
	public String getTypeDesc() {
	    switch(type) {
	    case TYPE_INTEGER:
	        return "INTEGER";
	    case TYPE_STRING:
	        return "STRING";
	    case TYPE_BOOLEAN:
	    	return "BOOLEAN";
	    case TYPE_DATE:
	        return "DATE";
	    case TYPE_TIME:
	        return "TIME";
	    case TYPE_DATETIME:
	        return "DATETIME";
	    }
        return "UNKNOWN";
	}

	/**
	 * @return
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param string
	 */
	public void setName(String string) {
		name = string;
	}

	/**
	 * @param i
	 */
	public void setType(int i) {
		type = i;
	}

	/**
	 * @param string
	 */
	public void setValue(String string) {
		value = string;
	}


	/**
	 * @return
	 */
	public String getDesc() {
		return desc;
	}

	/**
	 * @param string
	 */
	public void setDesc(String string) {
		desc = string;
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

	/**
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param i
	 */
	public void setId(int i) {
		id = i;
	}

}
