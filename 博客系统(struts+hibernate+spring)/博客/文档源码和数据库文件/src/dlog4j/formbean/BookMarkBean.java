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

import java.io.Serializable;
import java.util.Date;

/**
 * 日记书签
 * 该对象对应表dlog_bookmark中的一条记录
 * @author Liudong
 */
public class BookMarkBean implements Serializable {

    public final static int BM_LOG = 0x00; //日记书签
    
    int id;
    int type;
    int order;
    SiteForm site;
    LogForm log;
    UserForm user;
    Date createTime;
        
    public BookMarkBean() {
    }
    
    public BookMarkBean(SiteForm site,UserForm user,LogForm log) {
        this.site = site;
        this.user = user;
        this.log = log;
    }

    public Date getCreateTime() {
        return createTime;
    }
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public LogForm getLog() {
        return log;
    }
    public void setLog(LogForm log) {
        this.log = log;
    }
    public int getOrder() {
        return order;
    }
    public void setOrder(int order) {
        this.order = order;
    }
    public SiteForm getSite() {
        return site;
    }
    public void setSite(SiteForm site) {
        this.site = site;
    }
    public int getType() {
        return type;
    }
    public void setType(int type) {
        this.type = type;
    }
    public UserForm getUser() {
        return user;
    }
    public void setUser(UserForm user) {
        this.user = user;
    }
}
