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
<%@ taglib uri="/WEB-INF/struts-wml.tld" prefix="wml" %>
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<dlog:getsite id="site"/>
<dlog:draft id="draft" log="logForm" scope="request"/>
<card newcontext="true" title="<bean:message key="USERINFO_WRITE_LOG" bundle="html"/>">
<p align="left">
	<logic:messagesPresent>
		<html:errors/><br/>
	</logic:messagesPresent>	
	<dlog:category id="categories"/>
	<bean:message key="CATEGORY" bundle="wml"/>:
	<select name="categoryId"<logic:notEqual name="cat_id" value="-1"> value="<%=cat_id%>"</logic:notEqual>>	
	<logic:iterate id="cat" name="categories">
		<option value="<bean:write name="cat" property="id"/>"><bean:write name="cat" property="name"/></option>
   	</logic:iterate>
	</select>
    <bean:message key="TITLE" bundle="wml"/>:    
    <logic:empty name="logForm"><input type="text" name="title" value=""/></logic:empty>
    <logic:notEmpty name="logForm"><wml:text name="logForm" property="title"/></logic:notEmpty>
	<bean:message key="CONTENT" bundle="wml"/>:    
    <logic:empty name="logForm"><input type="text" name="content" value=""/></logic:empty>
    <logic:notEmpty name="logForm"><wml:text name="logForm" property="content"/></logic:notEmpty>
</p>
<p align="left">
	<br/>
	<anchor>
		<bean:message key="LOG_SUBMIT" bundle="html"/>
		<wml:go page="/wml/log.do" method="post">
    		<postfield name="moodLevel" value="3"/>
    		<postfield name="weather" value="sunny"/>
    		<postfield name="author" value="<bean:message key="LOG_FROM_SELF" bundle="html"/>"/>
    		<postfield name="authorUrl" value="<%=site.getUrl()%>"/>
    		<postfield name="categoryId" value="$(categoryId)"/>
    		<postfield name="title" value="$(title)"/>
    		<postfield name="content" value="$(content)"/>
    		<postfield name="eventSubmit_AddLog" value="1"/>
    	</wml:go>
	</anchor><br/>
    <logic:empty name="draft">
	<anchor>
		<bean:message key="LOG_ADD_DRAFT" bundle="html"/>
		<wml:go page="/wml/log.do" method="post">
    		<postfield name="moodLevel" value="3"/>
    		<postfield name="weather" value="sunny"/>
    		<postfield name="author" value="<bean:message key="LOG_FROM_SELF" bundle="html"/>"/>
    		<postfield name="authorUrl" value="<%=site.getUrl()%>"/>
    		<postfield name="categoryId" value="$(categoryId)"/>
    		<postfield name="title" value="$(title)"/>
    		<postfield name="content" value="$(content)"/>
    		<postfield name="eventSubmit_SaveDraft" value="1"/>
    	</wml:go>
	</anchor>
    </logic:empty>
    <logic:notEmpty name="draft">
	<anchor>
		<bean:message key="LOG_SAVE_DRAFT" bundle="html"/>
		<wml:go page="/wml/log.do" method="post">
    		<postfield name="draft_id" value="<bean:write name="draft" property="id"/>"/>
    		<postfield name="moodLevel" value="3"/>
    		<postfield name="weather" value="sunny"/>
    		<postfield name="author" value="<bean:message key="LOG_FROM_SELF" bundle="html"/>"/>
    		<postfield name="authorUrl" value="<%=site.getUrl()%>"/>
    		<postfield name="categoryId" value="$(categoryId)"/>
    		<postfield name="title" value="$(title)"/>
    		<postfield name="content" value="$(content)"/>
    		<postfield name="eventSubmit_UpdateDraft" value="1"/>
    	</wml:go>
	</anchor><br/>
	<anchor>
		<bean:message key="LOG_DELETE_DRAFT" bundle="html"/>
		<wml:go page="/wml/log.do" method="post">
    		<postfield name="draft_id" value="<bean:write name="draft" property="id"/>"/>
    		<postfield name="moodLevel" value="3"/>
    		<postfield name="weather" value="sunny"/>
    		<postfield name="author" value="<bean:message key="LOG_FROM_SELF" bundle="html"/>"/>
    		<postfield name="authorUrl" value="<%=site.getUrl()%>"/>
    		<postfield name="categoryId" value="$(categoryId)"/>
    		<postfield name="title" value="$(title)"/>
    		<postfield name="content" value="$(content)"/>
    		<postfield name="eventSubmit_DeleteDraft" value="1"/>
    	</wml:go>
	</anchor>
    </logic:notEmpty>
	<br/>
	<wml:link page="/index.jspw"><bean:message key="BACK_TO_HOME" bundle="html"/></wml:link>
</p>
</card>