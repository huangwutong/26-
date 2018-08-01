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
package dlog4j.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import dlog4j.SiteManager;
import dlog4j.formbean.SiteForm;


/**
 * 用于在处理多用户平台时获取当前访问的站点实例
 * @author Liudong
 */
public class GetCurrentSiteTag extends TagSupport {

    public int doStartTag() throws JspException {
        SiteForm site = SiteManager.getCurrentSite(pageContext.getRequest());
        if(site!=null) {
            pageContext.setAttribute(id, site);
        }
        return SKIP_BODY;
    }
}
