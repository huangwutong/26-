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
import java.util.List;

import javax.servlet.jsp.JspException;

import dlog4j.formbean.BookMarkBean;
import dlog4j.formbean.SiteForm;
import dlog4j.formbean.UserForm;


import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;

/**
 * 用于读取书签信息的标签库
 * @author Liudong
 */
public class BookmarkTag extends DlogBaseTag {
    
    String countId = null;
    boolean list = true;

    public int doStartTag() throws JspException {
        
        Session ssn = null;
        UserForm loginUser = getLoginUser();
        SiteForm site = getCurrentSite();
        List books = null;
        int bcount = 0;
        if(loginUser!=null&&loginUser.isLogin())
        try {
            ssn = getSession();
            if(list) {
                String hql = "FROM "+BookMarkBean.class.getName()+" AS b WHERE b.site.id=? AND b.user.id=?";
                Query q = ssn.createQuery(hql);
                q.setInteger(0,site.getId());
                q.setInteger(1,loginUser.getId());
                books = q.list();
                bcount = books.size();
            }
            else {
                String hql = "SELECT COUNT(b.id) FROM "+BookMarkBean.class.getName()+" AS b WHERE b.site.id=? AND b.user.id=?";
                Query q = ssn.createQuery(hql);
                q.setInteger(0,site.getId());
                q.setInteger(1,loginUser.getId());
                bcount = ((Integer)q.list().get(0)).intValue();
            }
        }catch(HibernateException e) {
            e.printStackTrace();
        }catch(SQLException e) {
            e.printStackTrace();
        }finally {
            close(ssn);
        }
        if(list)
        	pageContext.setAttribute(id,(books==null)?new ArrayList():books);
        pageContext.setAttribute(countId,new Integer(bcount));
        
        return SKIP_BODY;
    }
    public String getCountId() {
        return countId;
    }
    public void setCountId(String countId) {
        this.countId = countId;
    }
    public boolean isList() {
        return list;
    }
    public void setList(boolean list) {
        this.list = list;
    }
}
