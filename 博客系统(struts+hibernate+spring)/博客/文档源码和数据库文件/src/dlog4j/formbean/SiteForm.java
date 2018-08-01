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

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

/**
 * 子站点
 * @author Liudong
 */
public class SiteForm extends DlogActionForm {
	
    public final static int STATUS_PENDING	= 0x00; //已申请尚未开通
    public final static int STATUS_NORMAL 	= 0x01; //正常
    public final static int STATUS_PAUSE  	= 0x02; //已暂停
    public final static int STATUS_DELETED 	= 0x04; //已删除
    
	int id;
	String name;
	String displayName;
	String detail;
	String icon;
	String logo;
	String css;
	Date createTime;
	Date lastTime;
	String url;
	int status = STATUS_NORMAL;
	
	List users;
	List categories;
	List params;
	List summaries;

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest req) {
        ActionErrors errors = new ActionErrors();
        if(StringUtils.isEmpty(name))
            errors.add("name",new ActionError("not_empty_allow"));
        if(StringUtils.isEmpty(displayName))
            errors.add("displayName",new ActionError("not_empty_allow"));
        return errors;
    }
    
	public SiteForm() {}
	
	public SiteForm(String sitename) {
	    this.name = sitename;
	}
	/**
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param i
	 */
	public void setId(int i) {
		id = i;
	}

	/**
	 * @param string
	 */
	public void setName(String string) {
		name = string;
	}

	/**
	 * @return
	 */
	public List getCategories() {
		return categories;
	}

	/**
	 * @return
	 */
	public List getParams() {
		return params;
	}

	/**
	 * @return
	 */
	public List getSummaries() {
		return summaries;
	}

	/**
	 * @return
	 */
	public List getUsers() {
		return users;
	}

	/**
	 * @param list
	 */
	public void setCategories(List list) {
		categories = list;
	}

	/**
	 * @param list
	 */
	public void setParams(List list) {
		params = list;
	}

	/**
	 * @param list
	 */
	public void setSummaries(List list) {
		summaries = list;
	}

	/**
	 * @param list
	 */
	public void setUsers(List list) {
		users = list;
	}

    public int hashCode() {
        return id;
    }
    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public String getCss() {
        return css;
    }
    public void setCss(String css) {
        this.css = css;
    }
    public String getDisplayName() {
        return displayName;
    }
    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }
    public String getIcon() {
        return icon;
    }
    public void setIcon(String icon) {
        this.icon = icon;
    }
    public String getLogo() {
        return logo;
    }
    public void setLogo(String logo) {
        this.logo = logo;
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public String getLastTimeString() {
        return new SimpleDateFormat("MM-dd").format((lastTime==null)?new Date():lastTime);
    }
    public Date getLastTime() {
        return lastTime;
    }
    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }
    public String getDetail() {
        return detail;
    }
    public void setDetail(String detail) {
        this.detail = detail;
    }
}
