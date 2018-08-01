<%
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
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<dlog:getLoginUser id="loginUser"/>

<dlog:getuser id="user" detail="false"/>
<table cellspacing="4" cellpadding="4">
  <tr>
    <td>
      <table width='100%' border='0' cellspacing='1' cellpadding='2' bgcolor="#e2e2e2">
        <tr> 
          <td bgcolor='#e2e2e2'>&nbsp;<b><bean:message key="VIEWUSER_HEAD" bundle="html"/>:</b></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="1" cellpadding="2" bgcolor="#e2e2e2">
          <tr bgcolor="#f8f8f8"> 
            <td width="80" align="center"><bean:message key="LOGIN_USERNAME" bundle="html"/></td>
            <td> <bean:write name="user" property="loginName"/></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_REGTIME" bundle="html"/></td>
            <td> <bean:write name="user" property="regTime" format="yyyy-MM-dd HH:mm"/> </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_LASTLOGIN" bundle="html"/></td>
            <td> <bean:write name="user" property="lastTime" format="yyyy-MM-dd HH:mm"/> </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="VIEWUSER_LOG_COUNT" bundle="html"/></td>
            <td> <bean:write name="user" property="logCount"/> &nbsp;&nbsp;&nbsp;&nbsp;<a href="main.jspe?userid=<bean:write name="user" property="id"/>"><bean:message key="VIEWUSER_LOGS" bundle="html"/></a><span class="arrow">4</span></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="VIEWUSER_REPLY_COUNT" bundle="html"/></td>
            <td> <bean:write name="user" property="replyCount"/> &nbsp;&nbsp;&nbsp;&nbsp;<a href="comment_list.jspe?userid=<bean:write name="user" property="id"/>"><bean:message key="VIEWUSER_REPLIES" bundle="html"/></a><span class="arrow">4</span></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_NICK" bundle="html"/></td>
            <td> <bean:write name="user" property="displayName" /> </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_EMAIL" bundle="html"/></td>
            <td> <logic:notEmpty name="user" property="email"><a href="mailto:<bean:write name="user" property="email" />"></logic:notEmpty><bean:write name="user" property="email" /><logic:notEmpty name="user" property="email"></a></logic:notEmpty></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_HOMEPAGE" bundle="html"/></td>
            <td> <logic:notEmpty name="user" property="email"><a href="<%=format(user.getHomePage())%>" target="_blank"></logic:notEmpty><bean:write name="user" property="homePage"/><logic:notEmpty name="user" property="email"></a></logic:notEmpty></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center" valign="top"><bean:message key="EDITUSER_DESC" bundle="html"/></td>
            <td> <html:textarea name="user" property="resume" cols="60" rows="5" styleClass="bk" readonly="true"/>&nbsp;&nbsp;&nbsp;<font color="#FF0000"><html:errors property="resume"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td height="40" align="center" colspan="2"> 
            	<input type="button" class="button" name="btn_return" value="<bean:message key="BACK" bundle="html"/>" onclick="history.go(-1)">
            	<%if(loginUser.isLogin()){%>
            	<input type="button" class="button" name="btn_sendmsg" value="<bean:message key="SENDMSG_SUBMIT" bundle="html"/>" onclick="location.href='sendmsg.jspe?id=<bean:write name="user" property="id"/>&name=<bean:write name="user" property="loginName"/>'">
            	<%}%>
            </td>
          </tr>
      </table></td>
  </tr>
</table>
<%!
	String format(String url){
		if(url.toLowerCase().startsWith("http://"))
			return url;
		return "http://"+url;
	}
%>
