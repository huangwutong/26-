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
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<card title="<bean:message key="CATEGORY_DRAFT" bundle="html"/>">
<p align="left">
<dlog:drafts id="drafts"/>
<bean:size id="draft_count" name="drafts"/>
<%int i=1;%>
<logic:iterate id="draft" name="drafts">
<%=(i++)%>.<wml:link page="/addlog.jspw" paramId="draft_id" paramName="draft" paramProperty="id"><bean:write name="draft" property="title"/></wml:link><br/>
</logic:iterate>
</p>
<p align="left"><br/>
	<wml:link page="/index.jspw"><bean:message key="BACK_TO_HOME" bundle="html"/></wml:link>
</p>
</card>