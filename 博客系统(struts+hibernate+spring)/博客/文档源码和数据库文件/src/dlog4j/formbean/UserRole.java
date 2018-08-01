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

/**
 * 用户操作权限,对应dlog_siteuser的一条记录
 * @author Liudong
 */
public class UserRole implements Serializable {

    int id;
    SiteForm site;
    UserForm user;
    int role;
    
    public UserRole() {
    }
    public UserRole(SiteForm site, UserForm user, int role) {
        this.site = site;
        this.user = user;
        this.role = role;
    }

    public int getRole() {
        return role;
    }
    public void setRole(int role) {
        this.role = role;
    }
    public SiteForm getSite() {
        return site;
    }
    public void setSite(SiteForm site) {
        this.site = site;
    }
    public UserForm getUser() {
        return user;
    }
    public void setUser(UserForm user) {
        this.user = user;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
}
