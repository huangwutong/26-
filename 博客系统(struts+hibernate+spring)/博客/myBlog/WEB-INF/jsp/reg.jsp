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

<table width="520" cellspacing="4" cellpadding="4">
  <tr>
    <td>
      <table width='100%' border='0' cellspacing='1' cellpadding='2' align='center' bgcolor="#e2e2e2">
        <tr> 
          <td bgcolor='#e2e2e2'>&nbsp;<b><font color="#000000"> <bean:message key="REG_HEAD" bundle="html"/>:</font></b></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#e2e2e2">
        <html:form action="/adduser" onsubmit="return CheckForm(this);">
          <input type="hidden" name="mode" value="1"/>
  		  <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center" class="unnamed1"><bean:message key="LOGIN_USERNAME" bundle="html"/></td>
            <td width="88%"> <html:text property="loginName" /> <font color="#FF0000"> * <html:errors property="loginName"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center" class="unnamed1"><bean:message key="EDITUSER_NICK" bundle="html"/></td>
            <td width="88%"> <html:text property="displayName" /> <font color="#FF0000"> * <html:errors property="displayName"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center" class="unnamed1"><bean:message key="EDITUSER_PIC" bundle="html"/></td>
            <td width="88%">
            	<jsp:include page="pages/portrait.jsp" flush="true">
            		<jsp:param name="name" value="portrait"/>
            	</jsp:include>
            </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center"><bean:message key="EDITUSER_PASSWORD" bundle="html"/></td>
            <td width="88%"> <html:password property="password" /> <font color="#FF0000"> * <html:errors property="password"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center"><bean:message key="EDITUSER_PASSWORD_CONFIRM" bundle="html"/></td>
            <td width="88%"> <html:password property="password" /> <font color="#FF0000"> * </font> </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center" valign="top"><bean:message key="EDITUSER_EMAIL" bundle="html"/></td>
            <td width="88%"><bean:message key="REG_EMAIL_TIP" bundle="html"/><BR> <html:text property="email" />&nbsp;&nbsp;&nbsp;<font color="#FF0000"><html:errors property="email"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center"><bean:message key="EDITUSER_HOMEPAGE" bundle="html"/></td>
            <td width="88%"> <html:text property="homePage" size="60" />&nbsp;&nbsp;&nbsp;<font color="#FF0000"><html:errors property="homePage"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center" valign="top"><bean:message key="EDITUSER_DESC" bundle="html"/></td>
            <td width="88%"> <html:textarea property="resume" cols="60" rows="5" />&nbsp;&nbsp;&nbsp;<font color="#FF0000"><html:errors property="resume"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center"><bean:message key="REG_VERIFY_CODE" bundle="html"/></td>
            <td width="88%"> <input type="text" name="verifyCode" size="5">&nbsp;&nbsp;&nbsp;<html:img page="/verifyCode.jsp" align="absMiddle" border="0"/> <font color="#FF0000"><html:errors property="verifyCode"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%"><br> </td>
            <td width="88%" height="40"> 
            	<input type="submit" class="button" name="eventSubmit_AddUser" value="<bean:message key="REG_SUBMIT" bundle="html"/>"> 
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
	if (loginName.value.length == 0) {
		alert("<bean:message key="REG_USERNAME_TIP" bundle="html"/>");
		loginName.focus();
		return false;
	}
	if (loginName.value.indexOf("<")!=-1 || loginName.value.indexOf(">")!=-1){
		alert("<bean:message key="REG_USERNAME_TIP2" bundle="html"/>");
		loginName.focus();
		return false;
	}
	if (loginName.value.indexOf("'")!=-1){
		alert("<bean:message key="REG_USERNAME_TIP3" bundle="html"/>");
		loginName.focus();
		return false;
	}
	if (displayName.value.length == 0){
		alert("<bean:message key="REG_NICK_TIP" bundle="html"/>");
		displayName.focus();
		return false;
	}
	if (password[0].value.length == 0) {
		alert("<bean:message key="REG_PWD_TIP" bundle="html"/>");
		password[0].focus();
		return false;
	}
	if (password[1].value.length == 0) {
		alert("<bean:message key="REG_PWD_TIP2" bundle="html"/>");
		password[1].focus();
		return false;
	}
	if (password[0].value != password[1].value) {
		alert("<bean:message key="EDITUSER_PASSWORD_NOT_MATCH" bundle="html"/>");
		password[1].focus();
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