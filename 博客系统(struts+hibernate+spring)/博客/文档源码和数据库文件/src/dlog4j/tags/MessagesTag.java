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

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.jsp.JspException;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import dlog4j.formbean.MessageForm;
import dlog4j.formbean.UserForm;

/**
 * 读取点对点消息的标签库
 * @author Liudong
 */
public class MessagesTag extends DlogBaseTag {

    boolean read = false;
    int status = MessageForm.STATUS_NEW;
    /**
     * 读取发送给当前登录用户所有的未读信息
     */
    public int doStartTag() throws JspException {
        UserForm loginUser = getLoginUser();
        if(loginUser!=null&&loginUser.isLogin()) {
            Session ssn = null;
            try {
                ssn = getSession();
                String hql = "FROM "+MessageForm.class.getName()+" AS msg WHERE msg.toUser.id=? AND msg.status=? ORDER BY msg.sendTime DESC";
                Query query = ssn.createQuery(hql);
                query.setInteger(0, loginUser.getId());
                query.setInteger(1,status);
                List msgs = query.list();
                pageContext.setAttribute(id,msgs);
                if(read && status==MessageForm.STATUS_NEW) {
                    Date d = new Date();
                    for(int i=0;i<msgs.size();i++) {
                        MessageForm m = (MessageForm)msgs.get(i);
                        m.setStatus(MessageForm.STATUS_READ);
                        m.setReadTime(d);
                        ssn.update(m);
                    }
                }
            } catch (SQLException e) {
                Log log = LogFactory.getLog(MessagesTag.class);
                log.error("读取发送给"+loginUser.getLoginName()+"的消息失败(SQL)",e);
            } catch (HibernateException e) {                
                Log log = LogFactory.getLog(MessagesTag.class);
                log.error("读取发送给"+loginUser.getLoginName()+"的消息失败(Hibernate)",e);
            } finally {
                try {
                    commitSession(ssn,true);
                }catch(Exception e) {}
            }
        }
        else
            pageContext.setAttribute(id,new ArrayList());
        return super.doStartTag();
    }
    public boolean isRead() {
        return read;
    }
    public void setRead(boolean read) {
        this.read = read;
    }
    public void setRead(Boolean read) {
        this.read = read.booleanValue();
    }
    public void setRead(String read) {
        this.read = "true".equalsIgnoreCase(read);
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public void setStatus(Integer status) {
        this.status = status.intValue();
    }
    public void setStatus(String status) {
        this.status = Integer.parseInt(status);
    }
}
