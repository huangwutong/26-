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

<dlog:drafts id="drafts"/>
<bean:size id="draft_count" name="drafts"/>

<script language="javascript">
	document.title += ' [<bean:message key="CATEGORY_DRAFT" bundle="html"/>]';
</script>
<table width='100%' border='0' cellspacing='0' cellpadding='4'>
<tr>
	<td><html:img page="/images/lead.gif" hspace="4" align="absmiddle"/> <bean:message key="DRAFT_HEAD" arg0="<%=String.valueOf(draft_count)%>" bundle="html"/>&nbsp;</td> 
</tr>
</table>
<logic:iterate id="draft" name="drafts" indexId="idx">
<table border='0' cellspacing='0' cellpadding='4' width='100%'>
<tr>
	<td>
		<table border='0' cellspacing='0' cellpadding='2' width='100%'>
  		<tr>
			<td class='log_title' width='3'><html:img page="/images/icon_title.gif" align="top" /></td>
			<td valign='top'>&nbsp;<b><html:link page="/addlog.jspe" paramId="draft_id" paramName="draft" paramProperty="id"><font color='black'><bean:write name="draft" property="title" filter="false"/></font></html:link></b>&nbsp;&nbsp;<font style='font-size:10px' class='eng'>[<bean:write name="draft" property="logTime" format="yyyy-MM-dd"/>]&nbsp;&nbsp;<font style='font-size:10px' class='eng'>[ from <bean:write name="draft" property="author"/> ]<br>&nbsp;<IMG src='<html:rewrite page="/images"/>/hn2_t_<bean:write name="draft" property="weather"/>.gif' /> <img src='<html:rewrite page="/images"/>/hn2_<bean:write name="draft" property="weather"/>.gif' align='absmiddle' /> <img src='<html:rewrite page="/images"/>/face<bean:write name="draft" property="moodLevel"/>.gif' alt='<bean:message key="MOOD_LEVEL" bundle="html"/>#<bean:write name="draft" property="moodLevel"/>' /></font></td><td align=right valign='top'><html:link page="/addlog.jspe" paramId="draft_id" paramName="draft" paramProperty="id" titleKey="DRAFT_EDIT" bundle="html">[<bean:message key="DRAFT_REEDIT" bundle="html"/>]</html:link>&nbsp;</td>
		</tr>
  		</table>
		<table border='0' cellspacing='0' cellpadding='2' width='100%'>
		<tr>
			<td valign='top' class='content'>
			<bean:write name="draft" property="previewContent" filter="false"/>
			<logic:notEmpty name="draft" property="otherContent">
			<p align='right'><html:link page="/addlog.jspe" paramId="draft_id" paramName="draft" paramProperty="id" styleClass="more"><bean:message key="LOG_DETAIL" bundle="html"/></html:link></p>
			</logic:notEmpty>
			</td>
  		</tr>
		</table>
	</td>
</tr>
</table> 
</logic:iterate>