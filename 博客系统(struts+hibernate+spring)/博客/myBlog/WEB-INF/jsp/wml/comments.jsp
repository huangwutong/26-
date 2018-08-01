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
<%@ taglib uri="/WEB-INF/struts-wml.tld" prefix="wml" %>
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<bean:parameter id="log_id" name="log_id" value="-1"/>
<bean:parameter id="pageIdx" name="page" value="1"/>

<card title="<bean:message key="SHOW_COMMENT" bundle="wml"/>">
<dlog:getlog id="log" withReplies="true" previd="prev_log" nextid="next_log"/>
<logic:empty name="log">
<p align="left">
	<bean:message key="SHOWLOG_ERROR" bundle="wml"/>
</p>
</logic:empty>
<logic:notEmpty name="log">
<p mode="nowrap">
<bean:message key="TITLE" bundle="wml"/>:<bean:write name="log" property="titleText"/><br/>
</p>
<p align="left"><br/>
<% int i=1; %>
<logic:iterate id="reply" name="log" property="replies">
<%=(i++)%>.<bean:write name="reply" property="authorName"/>:<bean:write name="reply" property="wmlContent"/><br/>
</logic:iterate>
</p>
<p align="left"><br/>
<security:isNotRoleOf role="guest" orNull="true">
<wml:link page="/reply.jspw" paramId="log_id" paramName="log_id"><bean:message key="TO_COMMENT" bundle="wml"/></wml:link><br/>
</security:isNotRoleOf>
<wml:link page="/index.jspw"><bean:message key="BACK_TO_HOME" bundle="html"/></wml:link><br/>
</p>
</logic:notEmpty>
</card>