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

<dlog:getsite id="site"/>
<dlog:category id="categories"/>
<dlog:drafts id="drafts"/>
<bean:size id="draft_count" name="drafts"/>

<card title="<bean:write name="site" property="displayName"/>">
<p align="left">
	<wml:link page="/main.jspw"><bean:message key="ALL" bundle="wml"/></wml:link><br/>
	<logic:iterate id="cat" name="categories">
		<wml:link page="/main.jspw" paramId="cat_id" paramName="cat" paramProperty="id"><bean:write name="cat" property="name"/></wml:link><br/>
	</logic:iterate>
	<logic:greaterThan name="draft_count" value="0">
		<html:link page="/draft.jspw"><bean:message key="CATEGORY_DRAFT" bundle="html"/>(<bean:write name="draft_count"/>)</html:link>
	</logic:greaterThan>
</p>
<p align="left">
	<br/>
	<wml:link page="/replies.jspw"><bean:message key="NEWEST_COMMENT" bundle="wml"/></wml:link><br/>
	<security:isRoleOf role="guest" orNull="true">
	<wml:link page="/login.jspw"><bean:message key="LOGIN_LOGIN" bundle="html"/></wml:link><br/>
	</security:isRoleOf>
	<security:isNotRoleOf role="guest" orNull="true">
		<security:canAccess resource="log" operation="maintain" range="self">
			<wml:link page="/addlog.jspw"><bean:message key="USERINFO_WRITE_LOG" bundle="html"/></wml:link><br/>
		</security:canAccess>
		<wml:link page="/wml/logout.do?eventSubmit_Logout=1"><bean:message key="USERINFO_LOGOUT" bundle="html"/></wml:link><br/>
	</security:isNotRoleOf>
</p>
</card>
