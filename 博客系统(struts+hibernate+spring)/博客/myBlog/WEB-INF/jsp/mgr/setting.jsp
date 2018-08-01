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

<security:isNotRoleOf role="manager">
	<jsp:include page="../pages/access_deny.jsp" flush="true"/>
</security:isNotRoleOf>
<security:isRoleOf role="manager">

<script language="javascript">
	document.title += ' [<bean:message key="ADMIN_PARAM_TITLE" bundle="html"/>]';
</script>
<jsp:include page="admin_nav_bar.jsp" flush="true">
	<jsp:param name="sel" value="4"/>
</jsp:include>
<dlog:params id="params"/>
<table><tr><td><font color="red"><html:errors/></font></td></tr></table>
<table cellSpacing="1" cellPadding="1" width="98%" align="center" bgColor="#aaaaaa" border="0">
   <tbody>
      <tr> 
        <td width="15%" height="18" align="center" nowrap bgcolor="#A9C9F3"><b><bean:message key="PARAM_NAME" bundle="html"/></b></td>
        <td width="40%" height="18" align="center" nowrap bgcolor="#A9C9F3"><b><bean:message key="PARAM_DESC" bundle="html"/></b></td>
        <td width="10%" height="18" align="center" nowrap bgcolor="#A9C9F3"><b><bean:message key="PARAM_TYPE" bundle="html"/></b></td>
        <td width="20%" height="18" nowrap bgcolor="#A9C9F3"><b><bean:message key="PARAM_VALUE" bundle="html"/></b></td>
        <td width="10%" height="18" align="center" nowrap bgcolor="#A9C9F3"></td>
      </tr>
   	  <logic:iterate id="param" name="params">
   	  <html:form name="paramForm" type="dlog4j.formbean.ParamForm" action="/param">
   	  <input type="hidden" name="id" value="<bean:write name="param" property="id"/>"/>
   	  <input type="hidden" name="name" value="<bean:write name="param" property="name"/>"/>
   	  <input type="hidden" name="type" value="<bean:write name="param" property="type"/>"/>
      <tr bgcolor="#ffffff"> 
        <td width="15%" height="18" align="left"><bean:write name="param" property="name"/></td>
        <td width="40%" height="18" align="left">
        	<logic:notEmpty name="param" property="desc">
			<bean:write name="param" property="desc"/>
			</logic:notEmpty>
        	<logic:empty name="param" property="desc">
			<%try{%>
			<bean:message key="<%=("PARAM_"+((dlog4j.formbean.ParamForm)param).getName())%>" bundle="html"/>
			<%}catch(Exception e){e.printStackTrace();}%>
			</logic:empty>
		</td>
        <td width="10%" height="18" align="center" nowrap><bean:write name="param" property="typeDesc"/></td>
        <logic:equal name="param" property="type" value="3">
        <td width="20%" height="18">
        	<input type="radio" name="value" value="1" <logic:equal name="param" property="value" value="1">checked</logic:equal>/>YES
        	<input type="radio" name="value" value="0" <logic:equal name="param" property="value" value="0">checked</logic:equal>/>NO</td>
		</logic:equal>
        <logic:notEqual name="param" property="type" value="3">
        <td width="20%" height="18"><html:text name="param" property="value" size="13"/></td>
        </logic:notEqual>
        <td width="10%" height="18"><input type="submit" class="button" name="eventSubmit_UpdateParam" value="<bean:message key="PARAM_SUBMIT_UPDATE" bundle="html"/>"/></td>
      </tr>
      </html:form>
      </logic:iterate>
   </tbody>
</table>
</security:isRoleOf>