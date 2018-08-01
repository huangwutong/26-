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


<dlog:getlog id="logForm" withReplies="false"/>

<logic:empty name="logForm">
<table border="0" width='95%' align="center">
<tr><td>
	<bean:message key="SHOWLOG_ERROR" bundle="html"/>
</td></tr>
</table>
</logic:empty>
<logic:notEmpty name="logForm">

<table cellSpacing="1" cellPadding="4" width="98%" align="center" border="0" class="tableBorder">
<tr class="tableBorderHead">
	<td colspan=6><bean:message key="TRACKBACK_HEAD" bundle="html" arg0="<%=logForm.getTitle()%>"/><html:link page="/showlog.jspe" paramId="log_id" paramName="logForm" paramProperty="id"><html:img page="/images/back_to_log.gif" border="0" align="absMiddle"/></html:link></td>
</tr>
<tr class="tableBorderHead">
	<td></td>
	<td><bean:message key="TRACKBACK_BLOGNAME" bundle="html"/></td>
	<td><bean:message key="TRACKBACK_TITLE" bundle="html"/></td>
	<td><bean:message key="TRACKBACK_EXCERPT" bundle="html"/></td>
	<td><bean:message key="TRACKBACK_HOST" bundle="html"/></td>
	<td><bean:message key="TRACKBACK_TIME" bundle="html"/></td>	
</tr>
<bean:size id="tbcount" name="logForm" property="trackBacks"/>
<logic:equal name="tbcount" value="0">
<tr>
	<td colspan=6 align=center>[EMPTY]</td>
</tr>
</logic:equal>
<%int i=1;%>
<logic:iterate id="tb" name="logForm" property="trackBacks">
<tr>
	<td align="center"><%=(i++)%></td>
	<td><bean:write name="tb" property="blog_name"/></td>
	<td><a href='<bean:write name="tb" property="url"/>' target='_blank'><bean:write name="tb" property="title"/></a></td>
	<td><bean:write name="tb" property="excerpt"/></td>
	<td><bean:write name="tb" property="remoteAddr"/></td>
	<td><bean:write name="tb" property="refTime" format="yy-MM-dd HH:mm"/></td>	
</tr>
</logic:iterate>
</table>

</logic:notEmpty>