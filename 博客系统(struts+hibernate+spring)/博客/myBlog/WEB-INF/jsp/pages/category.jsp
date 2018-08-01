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

<dlog:category id="categories"/>
<dlog:drafts id="drafts"/>
<bean:size id="draft_count" name="drafts"/>

<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<table cellpadding='2' cellspacing='1' border='0'>
<tr>
   	<td>&nbsp;&nbsp;<b><html:link page="/main.jspe"><bean:message key="CATEGORY_ALL" bundle="html"/></html:link></b></td>
	<logic:iterate id="cat" name="categories">
	<td>|</td>
	<td>
	<b><html:link page="/main.jspe" paramId="cat_id" paramName="cat" paramProperty="id"><logic:equal name="cat" property="id" value="<%=cat_id%>"><font class="selected_category"></logic:equal><bean:write name="cat" property="name"/><logic:equal name="cat" property="id" value="<%=cat_id%>"></font></logic:equal></html:link></b>
	</td>
	</logic:iterate>
	<logic:greaterThan name="draft_count" value="0"> 
	<td>|</td>  
	<td>
	<b><html:link page="/pages/drafts.jspe"><bean:message key="CATEGORY_DRAFT" bundle="html"/>(<bean:write name="draft_count"/>)</html:link></b>
	</td>
	</logic:greaterThan>
</tr>
</table>