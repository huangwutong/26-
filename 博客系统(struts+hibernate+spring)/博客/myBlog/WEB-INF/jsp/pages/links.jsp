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

<%@ page import="java.util.*"%>
<%@ page import="dlog4j.ManagerBase"%>
<%@ page import="net.sf.hibernate.*"%>
<%@ page import="net.sf.hibernate.expression.*"%>
<%@ page import="dlog4j.formbean.*"%>

<bean:parameter id="url" name="url" value=""/>
<%
	Session ssn = null;
	List sites = null;
	try{
		ssn = ManagerBase.getSession();
		Criteria crit = ssn.createCriteria(FavoriteForm.class);
		crit.addOrder(Order.asc("order"));
		sites = crit.list();
	}finally{
		ManagerBase.closeSession(ssn);
	}
	pageContext.setAttribute("sites",sites);
	url = java.net.URLDecoder.decode(url, "UTF-8");
%>
<%if(sites.size()>0){%>
<table cellSpacing="1" cellPadding="2" border="0" width="100%" class="tableBorder">
    <tr>
      <td class="tableBorderHead"><html:img page="/images/gray.gif"/> <bean:message key="FAVORITE_TITLE" bundle="html"/></td>
    </tr>
	<logic:iterate id="site" name="sites">
	<tr><td>
	<logic:equal name="site" property="mode" value="HTML">
		<a href="<bean:write name="site" property="url"/>"<logic:equal name="site" property="openInNewWindow" value="1"> target="_blank"</logic:equal>><bean:write name="site" property="title"/></a>
	</logic:equal>
	<logic:notEqual name="site" property="mode" value="HTML">
		<html:link page="/pages/rssview.jspe" paramId="url" paramName="site" paramProperty="url"><logic:equal name="site" property="url" value="<%=url%>"><b><i></logic:equal><bean:write name="site" property="title"/><logic:equal name="site" property="url" value="<%=url%>"></i></b></logic:equal></html:link>
	</logic:notEqual>
	</td></tr>
  	</logic:iterate>
</table>
<%}%>