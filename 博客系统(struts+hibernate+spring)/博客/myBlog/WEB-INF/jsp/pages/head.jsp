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
<dlog:category id="categories"/>
<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<bean:parameter id="query" name="query" value=""/>
<bean:parameter id="scope" name="scope" value="log"/>
<table width="100%" height="100%" border="0">
  <form action="<html:rewrite page="/search.do"/>" onsubmit="return checkSearch(this);">
  <tr>
	<td align="right" valign="top">   
		<font color="#ffffff"><b><bean:message key="SEARCH" bundle="html"/>:</b></font>
		<input type="text" value="<bean:write name="query"/>" name="query" onclick="this.select()" size="16">
		<font color="#ffffff"><b><bean:message key="ON" bundle="html"/></b></font>
		<select name="cat_id">
            <option value="-1"><bean:message key="SEARCH_ALL" bundle="html"/></option>
            <option value="-2" <logic:equal name="cat_id" value="-2">SELECTED</logic:equal>><bean:message key="ALL_REPLY" bundle="html"/></option>
			<logic:iterate id="cat" name="categories">
	            <option value="<bean:write name="cat" property="id"/>" <logic:equal name="cat" property="id" value="<%=cat_id%>">SELECTED</logic:equal>><bean:write name="cat" property="name"/></option>
          	</logic:iterate>
      	</select> 
		<html:image page="/images/search.gif" align="absMiddle"/>
	</td>
  </tr>
  </form>
</table>