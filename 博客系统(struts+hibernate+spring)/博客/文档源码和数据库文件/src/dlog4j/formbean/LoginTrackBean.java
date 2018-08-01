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

import javax.servlet.http.HttpServletRequest;

/**
 * 用于跟踪用户登录信息的对象
 * @author Liudong
 */
public class LoginTrackBean implements Serializable {

    int id;
    UserForm user;
    String ipAddr;
    Date loginTime;
    
    public LoginTrackBean() {
    }
    
    public LoginTrackBean(HttpServletRequest request) {
        user = UserForm.getLoginUser(request);
        ipAddr = request.getRemoteAddr();
        loginTime = new Date();
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getIpAddr() {
        return ipAddr;
    }
    public void setIpAddr(String ipAddr) {
        this.ipAddr = ipAddr;
    }
    public Date getLoginTime() {
        return loginTime;
    }
    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }
    public UserForm getUser() {
        return user;
    }
    public void setUser(UserForm user) {
        this.user = user;
    }
}
