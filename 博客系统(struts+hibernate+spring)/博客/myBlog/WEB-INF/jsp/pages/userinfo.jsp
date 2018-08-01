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
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>

<security:isNotRoleOf role="guest" orNull="true">
	<jsp:include page="userinfo_opt_panel.jsp" flush="true"/>
</security:isNotRoleOf>

<security:isRoleOf role="guest" orNull="true">
<script language="javascript">
	function fetch_pwd(){
		with(loginUser){
		if(loginName.value==""){
			alert("<bean:message key="LOGIN_USERNAME_TIP" bundle="html"/>");
			loginName.focus();
			return;
		}
		var url = '<html:rewrite page="/fetchpwd.jsp"/>?userid='+loginName.value; 
		window.open(url,'<bean:message key="LOGIN_FETCH_PASSWORD" bundle="html"/>','height=100,width=300,toolbar=no, menubar=no,location=no, status=no,scrollbars=yes')
		}
	}
	function checkSubmit(){
		with(loginUser){
		if(loginName.value==""){
			alert("<bean:message key="LOGIN_USERNAME_TIP" bundle="html"/>");
			loginName.focus();
			return false;
		}
		if(password.value==""){
			alert("<bean:message key="LOGIN_PASSWORD_TIP" bundle="html"/>");
			password.focus();
			return false;
		}
		return true;
		}
	}
</script>
<table cellSpacing="1" cellPadding="2" height="10" width="100%" border="0" class="tableBorder">
    <tr>
      <td class="tableBorderHead" valign="bottom"><html:img page="/images/gray.gif"/> <bean:message key="LOGIN_HEAD" bundle="html"/>
      <logic:messagesPresent property="login"><font color="red"><html:errors/></font></logic:messagesPresent></td>
    </tr>
    <tr bgcolor="white">
		<html:form action="/login" onsubmit="return checkSubmit();" scope="request">
		<input type="hidden" name="curPage" value=""/>
		<td align="center">
			<table border=0 width='100%'>
			<tr><td><bean:message key="LOGIN_USERNAME" bundle="html"/>:</td><td><input name="loginName" type="text" value="" size="12" maxlength="20" /></td></tr>
      		<tr><td><bean:message key="LOGIN_PASSWORD" bundle="html"/>:</td><td><input name="password" type="password" value="" size="12" maxlength="20" /></td></tr>
      		<tr><td colspan=2>
      		<input name="eventSubmit_Login" type="submit" value="<bean:message key="LOGIN_LOGIN" bundle="html"/>" class="button" onclick="curPage.value=location.href"/>&nbsp;
      		<input name="Reg" type="button" value="<bean:message key="LOGIN_REG" bundle="html"/>" class="button" onclick="location.href='<html:rewrite page="/reg.jspe"/>';"/>&nbsp;
      		<a href="#" target="_blank" onclick="fetch_pwd();return false;"><bean:message key="LOGIN_FORGET_PASSWORD" bundle="html"/></a>
      		</td></tr></table>
		</td>
		</html:form>
    </tr>
</table>
<logic:messagesPresent property="login">
<script language="javascript">document.loginUser.loginName.focus();</script>
</logic:messagesPresent>

</security:isRoleOf>

