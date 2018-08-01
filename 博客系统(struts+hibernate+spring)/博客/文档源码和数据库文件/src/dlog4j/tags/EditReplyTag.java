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
import dlog4j.formbean.ReplyForm;

/**
 * �༭���۵ı�ǩ��(����showlog.jsp)
 * @author Liudong
 */
public class EditReplyTag extends DlogBaseTag {

    String scope = "session";
    String replyId = null;
    
    public int doStartTag() throws JspException {
        int iScope = PageContext.SESSION_SCOPE;
        if("request".equalsIgnoreCase(scope))
            iScope = PageContext.REQUEST_SCOPE;        
		ReplyForm replyForm = (ReplyForm)pageContext.getAttribute(id,iScope);
		if(replyForm==null) {
		    int rid = -1;
		    try {
		        rid = Integer.parseInt(replyId);
		    }catch(Exception e) {}
		    if(rid == -1) {
			    try {
			        rid = Integer.parseInt(pageContext.getRequest().getParameter("reply_id"));
			    }catch(Exception e) {}		       
		    }
		    if(rid!=-1) {
		        Session ssn = null;
		        try {
		            ssn = getSession();
		            replyForm = (ReplyForm)ssn.load(ReplyForm.class,new Integer(rid));
		            pageContext.setAttribute(id,replyForm,iScope);
		        } catch (Exception e) {
		            throw new JspException(e);
                }finally {
		            try {
		                closeSession(ssn);
		            }catch(Exception e) {}
		        }
		    }
		}		
        return SKIP_BODY;
    }
    public int doEndTag() throws JspException {
        release();
        return EVAL_PAGE;
    }
    public void release() {
        scope = "session";
        replyId = null;
    }
    public String getScope() {
        return scope;
    }
    public void setScope(String scope) {
        this.scope = scope;
    }
    public String getReplyId() {
        return replyId;
    }
    public void setReplyId(String replyId) {
        this.replyId = replyId;
    }
}
