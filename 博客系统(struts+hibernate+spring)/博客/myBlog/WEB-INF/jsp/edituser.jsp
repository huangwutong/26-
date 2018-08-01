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
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<dlog:getLoginUser id="loginUser"/>

<security:isLogin>
<script language="javascript">
	document.title += ' [<bean:message key="EDITUSER_HEAD" bundle="html"/>]';
</script>
<table cellspacing="0" cellpadding="2">
  <tr>
    <td>
      <table width='100%' border='0' cellspacing='1' cellpadding='2' bgcolor="#e2e2e2">
        <tr> 
          <td bgcolor='#e2e2e2'>&nbsp;<b><font color="#000000"> <bean:message key="EDITUSER_HEAD" bundle="html"/>:</font></b></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="1" cellpadding="2" bgcolor="#e2e2e2">
        <html:form action="/edituser" onsubmit="return CheckForm(this);">
          <html:hidden name="loginUser" property="id"/>
          <tr bgcolor="#f8f8f8"> 
            <td width="80" align="center"><bean:message key="EDITUSER_REGTIME" bundle="html"/></td>
            <td> <bean:write name="loginUser" property="regDate"/> </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_LASTLOGIN" bundle="html"/></td>
            <td> <bean:write name="loginUser" property="lastTime"/> </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_NICK" bundle="html"/></td>
            <td> <html:text name="loginUser" property="displayName" /> <font color="#FF0000"> * <html:errors property="displayName"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_PIC" bundle="html"/></td>
            <td>
            	<jsp:include page="pages/portrait.jsp" flush="true">
            		<jsp:param name="name" value="portrait"/>
            	</jsp:include>
            </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_EMAIL" bundle="html"/></td>
            <td> <html:text name="loginUser" property="email" size="60"/>&nbsp;&nbsp;&nbsp;<font color="#FF0000"><html:errors property="email"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_HOMEPAGE" bundle="html"/></td>
            <td> <html:text name="loginUser" property="homePage" size="60" />&nbsp;&nbsp;&nbsp;<font color="#FF0000"><html:errors property="homePage"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center" valign="top"><bean:message key="EDITUSER_DESC" bundle="html"/></td>
            <td> <html:textarea name="loginUser" property="resume" cols="60" rows="5" />&nbsp;&nbsp;&nbsp;<font color="#FF0000"><html:errors property="resume"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td colspan="2" align="left">&nbsp;<font color="red"><bean:message key="EDITUSER_PASSWORD_TIP" bundle="html"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_PASSWORD" bundle="html"/></td>
            <td> <input type="password" name="password" value=""> <font color="#FF0000"> <html:errors property="password"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td align="center"><bean:message key="EDITUSER_PASSWORD_CONFIRM" bundle="html"/></td>
            <td> <input type="password" name="password1" value=""> </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td colspan="2" height="40" align="center"> 
            	<input type="submit" class="button" name="eventSubmit_EditUser" value="<bean:message key="EDITUSER_SUBMIT_EDIT" bundle="html"/>"> 
            	<input type="reset" class="button" name="btn_reset" value="<bean:message key="EDITUSER_RESET" bundle="html"/>"> 
            	<input type="button" class="button" name="btn_return" value="<bean:message key="EDITUSER_BACK" bundle="html"/>" onclick="history.go(-1)">
            </td>
          </tr>
        </html:form>
      </table></td>
  </tr>
</table>

<script language="JavaScript">
function CheckForm(form1)
{
	with(form1){
	if (displayName.value==""){
		alert("<bean:message key="EDITUSER_NICK_TIP" bundle="html"/>");
		displayName.focus();
		return false;
	}
	if (password.value != password1.value) {
		alert("<bean:message key="EDITUSER_PASSWORD_NOT_MATCH" bundle="html"/>");
		password.focus();
		return false;
	}
	if (email.value.length > 0 && !email.value.match( /^.+@.+$/ ) ) {
		alert("<bean:message key="EDITUSER_EMAIL_TIP" bundle="html"/>");
		email.focus();
		return false;
	}
	}
	return true;
}
</script>
</security:isLogin>