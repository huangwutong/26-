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
<%@ page import="web.rss.*" %>

<bean:parameter id="url" name="url"/>

<%
	Channel site = RssHunter.parse(url);
	pageContext.setAttribute("site",site);
%>

<table border='0' cellspacing='4' cellpadding='0' width='100%'>
   	<tr><td align="left">
		<bean:message key="RSS_TITLE" bundle="html" arg0="<%=site.getTitle()%>" arg1="<%=site.getLink()%>" arg2="<%=String.valueOf(site.getItems().size())%>"/>
   	</td></tr>
	<logic:notEmpty name="site" property="description">
   	<tr><td align="right">
		<bean:write name="site" property="description"/>
   	</td></tr>
	</logic:notEmpty>
</table> <hr/>
<bean:define id="items" name="site" property="items"/>
<logic:iterate id="item" name="items" indexId="idx">
<table border='0' cellspacing='4' cellpadding='0' width='100%'>
   	<tr><td>
   		<table cellspacing='0' cellpadding='0' width='100%'>
    		<tr><td width='2' background="<html:rewrite page="/images/icon_title.gif"/>"></td>
   				<td valign='top'>&nbsp;<b><a href="<bean:write name="item" property="link"/>" target="_blank"><font class='log_title'><bean:write name="item" property="title" filter="false"/></font></a></b></td>
   				<td align=right valign='top' nowrap><a href="<bean:write name="item" property="link"/>" target="_blank"><bean:message key="MAIN_READ" bundle="html"/></a>&nbsp;</td>
   			</tr>
   		</table>
   		</td>
   	</tr>
   	<tr><td valign='top'><br/>
   			<bean:write name="item" property="description" filter="false"/>
   		</td>
    </tr>
</table> 
<br/><br/>
</logic:iterate>