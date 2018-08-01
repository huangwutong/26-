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
import javax.servlet.jsp.PageContext;

import net.sf.hibernate.Session;
import dlog4j.LogManager;
import dlog4j.SiteManager;
import dlog4j.formbean.DraftForm;
import dlog4j.formbean.LogForm;
import dlog4j.formbean.SiteForm;

/**
 * 用于根据草稿件的编号获取草稿详细信息的标签
 * @author Liudong
 */
public class DraftTag extends DlogBaseTag {
    public final static String PARAM_DRAFT = "draft_id";
    
    private int draftId = -1;
    private String log = null;
    private String scope = null;
    
    public int doEndTag() throws JspException {
        release();
        return EVAL_PAGE;
    }
    public void release() {
        draftId = -1;
        log = null;
        scope = null;
    }
    /**
     * 查询草稿详细信息并输出变量到页面
     */
    public int doStartTag() throws JspException {
        int did = draftId;
        if(did==-1) 
        try {
            did = Integer.parseInt(getParameter(PARAM_DRAFT));
        }catch(Exception e) {}
        Session ssn = null;
        try {
            ssn = getSession();
            SiteForm site = SiteManager.getCurrentSite(pageContext.getRequest());
            DraftForm draft = LogManager.getDraft(ssn,site,did);
            if(draft!=null)
                pageContext.setAttribute(id,draft);
            if(draft!=null&& log!=null) {
                int iScope = PageContext.SESSION_SCOPE;
                if("request".equalsIgnoreCase(scope))
                    iScope = PageContext.REQUEST_SCOPE;        
        		LogForm logForm = (LogForm)pageContext.getAttribute(id,iScope);
        		if(logForm==null) 
        		    logForm = new LogForm();        		
        		logForm.setAuthor(draft.getAuthor());
        		logForm.setAuthorUrl(draft.getAuthorUrl());
        		logForm.setContent(draft.getContent());
        		logForm.setLogTime(new java.util.Date());
        		logForm.setMoodLevel(draft.getMoodLevel());
        		logForm.setOwner(getLoginUser());
        		logForm.setRefUrl(draft.getRefUrl());
        		logForm.setShowFormerly(draft.getShowFormerly());
        		logForm.setSite(getCurrentSite());
        		logForm.setTitle(draft.getTitle());
        		logForm.setUseFace(draft.getUseFace());
        		logForm.setUseUbb(draft.getUseUbb());
        		logForm.setWeather(draft.getWeather());
	            pageContext.setAttribute(log,logForm,iScope);
            }
        }catch(Exception e) {
            throw new JspException(e.fillInStackTrace());
        }finally {
            close(ssn);
        }
        return SKIP_BODY;
    }
    public int getDraftId() {
        return draftId;
    }
    public void setDraftId(int draftId) {
        this.draftId = draftId;
    }
    public void setDraftId(Integer draftId) {
        this.draftId = draftId.intValue();
    }
    public void setDraftId(String draftId) {
        this.draftId = Integer.parseInt(draftId);
    }
    public String getLog() {
        return log;
    }
    public void setLog(String log) {
        this.log = log;
    }
    public String getScope() {
        return scope;
    }
    public void setScope(String scope) {
        this.scope = scope;
    }
}
