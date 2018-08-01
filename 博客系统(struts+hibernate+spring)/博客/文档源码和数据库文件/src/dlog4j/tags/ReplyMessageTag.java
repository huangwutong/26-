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
import dlog4j.formbean.MessageForm;

/**
 * 用于回复短消息的标签库
 * @author Liudong
 */
public class ReplyMessageTag extends DlogBaseTag {

    String scope = "session";
    String msgid = null;
    
    public int doStartTag() throws JspException {
        int iScope = PageContext.SESSION_SCOPE;
        if("request".equalsIgnoreCase(scope))
            iScope = PageContext.REQUEST_SCOPE;        
		MessageForm msgForm = (MessageForm)pageContext.getAttribute(id,iScope);
		if(msgForm==null) {
		    int rid = -1;
		    try {
		        rid = Integer.parseInt(msgid);
		    }catch(Exception e) {}
		    if(rid == -1) {
			    try {
			        rid = Integer.parseInt(pageContext.getRequest().getParameter("msgid"));
			    }catch(Exception e) {}		       
		    }
		    if(rid!=-1) {
		        Session ssn = null;
		        try {
		            ssn = getSession();
		            msgForm = (MessageForm)ssn.load(MessageForm.class,new Integer(rid));
		            msgForm.setContent("<BR>----- Original Message -----<BR>"+msgForm.getContent());
		            pageContext.setAttribute(id,msgForm,iScope);
		        } catch (Exception e) {
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
        msgid = null;
    }
    public String getScope() {
        return scope;
    }
    public void setScope(String scope) {
        this.scope = scope;
    }
    public String getMsgid() {
        return msgid;
    }
    public void setMsgid(String msgid) {
        this.msgid = msgid;
    }
}
