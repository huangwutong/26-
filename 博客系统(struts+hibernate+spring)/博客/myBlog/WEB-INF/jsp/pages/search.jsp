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
<bean:parameter id="sort" name="sort" value=""/>
<bean:parameter id="query" name="query" value=""/>
<bean:parameter id="scope" name="scope" value="log"/>

<table cellSpacing="1" cellPadding="2" width="100%" border="0" class="tableBorder">
    <tr>
      <td class="tableBorderHead"><html:img page="/images/gray.gif"/> <bean:message key="SEARCH_HEAD" bundle="html"/></td>
    </tr>
    <tr>
	  <form action='<html:rewrite page="/search.do"/>' method='get' onsubmit="return checkSearch(this);">
	  	<logic:notEmpty name="sort">
  		<input type="hidden" name="sort" value="<bean:write name="sort"/>"/>
  		</logic:notEmpty>
        <td><select name="cat_id">
            <option value="-1"><bean:message key="SEARCH_ALL" bundle="html"/></option>
			<logic:iterate id="cat" name="categories" indexId="index">
	            <option value="<bean:write name="cat" property="id"/>" <logic:equal name="cat" property="id" value="<%=cat_id%>">SELECTED</logic:equal>><bean:write name="cat" property="name"/></option>
          	</logic:iterate>
      		</select><br>
      		<input type="radio" name="scope" value="log" <logic:equal name="scope" value="log">checked</logic:equal>><bean:message key="SEARCH_LOG" bundle="html"/>
      		<input type="radio" name="scope" value="comment" <logic:equal name="scope" value="comment">checked</logic:equal>><bean:message key="SEARCH_REPLY" bundle="html"/><br>
          	<input type="text" value="<bean:write name="query"/>" name="query" onclick="this.select()" size="16">
          	<input type="submit" class="button" value="GO"></td>
      </form>
    </tr>
</table>

  <script language="javascript">
  	function checkSearch(form1){
  		if(form1.query.value==""){
  			form1.query.focus();
  			return false;
  		}
  		return true;
  	}
  </script>