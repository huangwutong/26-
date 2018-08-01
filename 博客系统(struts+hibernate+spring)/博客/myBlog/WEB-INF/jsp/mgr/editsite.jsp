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
<%@ page import="dlog4j.util.RequestUtils" %>

<security:isNotRoleOf role="manager">
	<jsp:include page="../pages/access_deny.jsp" flush="true"/>
</security:isNotRoleOf>
<security:isRoleOf role="manager">

<script language="javascript">
	document.title += ' [<bean:message key="ADMIN_TITLE" bundle="html"/>]';
</script>
<dlog:getsite id="site"/>
<jsp:include page="admin_nav_bar.jsp" flush="true">
	<jsp:param name="sel" value="1"/>
</jsp:include>
<table cellspacing="4" cellpadding="4" width="100%">
  <tr>
    <td>
      <table width='100%' border='0' cellspacing='1' cellpadding='2' bgcolor="#e2e2e2">
        <tr> 
          <td bgcolor='#e2e2e2'><b><font color="#000000"> <bean:message key="EDITSITE_TITLE" bundle="html"/> (<bean:message key="EDITSITE_REGTIME" bundle="html"/>:<bean:write name="site" property="createTime" format="yyyy-MM-dd HH:mm"/>)</td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#e2e2e2">
        <html:form action="/editsite" onsubmit="return CheckForm(this);">
          <html:hidden name="site" property="id"/>
          <html:hidden name="site" property="name"/>
          <tr bgcolor="#f8f8f8"> 
            <td><bean:message key="EDITSITE_LABEL" bundle="html"/></td>
            <td> <html:text name="site" property="displayName" size="40"/> <font color="#FF0000"> * <html:errors property="displayName"/></font></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td><bean:message key="EDITSITE_DESC" bundle="html"/></td>
            <td>
				<html:text name="site" property="detail" size="40"/><font color="#FF0000"> * </font><logic:messagesPresent property="resume">&nbsp;&nbsp;&nbsp;<font color="#FF0000"><html:errors property="resume"/></font></logic:messagesPresent>
			</td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td><bean:message key="EDITSITE_URL" bundle="html"/></td>
            <td>
            	<logic:notEmpty name="site" property="url">
					<html:text name="site" property="url" size="40"/>
				</logic:notEmpty>
            	<logic:empty name="site" property="url">
					<input type="text" name="url" value="<%=RequestUtils.getBaseURL(request)%>" size="40"/>
				</logic:empty>
				<logic:messagesPresent property="homePage">&nbsp;&nbsp;&nbsp;<font color="#FF0000"><html:errors property="homePage"/></font></logic:messagesPresent>
			</td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td colspan="2"><bean:message key="EDITSITE_LAYOUT" bundle="html"/>&nbsp; <font color=red>(<bean:message key="EDITSITE_LAYOUT_TIP" bundle="html"/>)</font></td>
          </tr>
          <tr bgcolor="#f8f8f8">
            <td colspan="2"> <textarea name="layout" style="width:100%" rows="20"><%@ include file="../layout/html_layout.htm" %></textarea></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td height="40" colspan="2" align="center"> 
            	<input type="submit" class="button" name="eventSubmit_EditSite" value="<bean:message key="EDITSITE_SUBMIT" bundle="html"/>">&nbsp; &nbsp;&nbsp;
            	<input type="reset" class="button" name="btn_reset" value="<bean:message key="EDITSITE_RESET" bundle="html"/>"> 
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
	if (displayName.value.length == 0){
		alert("<bean:message key="EDITSITE_LABEL_TIP" bundle="html"/>");
		displayName.focus();
		return false;
	}	
	if (detail.value.length == 0){
		detail.value = displayName.value;
	}
	}
	return true;
}
</script>
</security:isRoleOf>