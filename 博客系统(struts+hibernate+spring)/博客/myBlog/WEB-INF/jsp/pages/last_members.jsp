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

<dlog:member id="last_users" count="3" query="false"/>
<bean:size id="ucount" name="last_users"/>

<table cellSpacing="1" cellPadding="2" border="0" width="100%" class="tableBorder">
    <tr>
      <td class="tableBorderHead" colspan="2"><html:img page="/images/gray.gif"/> <bean:message key="LAST_MEMBER_HEAD" bundle="html"/></td>
    </tr>
	<logic:iterate id="user" name="last_users">
	<tr>
		<td>
			<html:img page="/images/arrow2.gif" border="0" align="absMiddle"/>&nbsp;<html:link page="/viewuser.jspe" paramId="userid" paramName="user" paramProperty="id"><bean:write name="user" property="displayName"/></html:link>			
		</td>
		<td class="smalltext" align="right" nowrap>
			<logic:notEmpty name="user" property="homePage">
				<a href="<%=format(((dlog4j.formbean.UserForm)user).getHomePage())%>" target="_blank">
				<html:img page="/images/icon_home.gif" border="0" align="absMiddle" width="14" height="14"/>
				</a>
			</logic:notEmpty><bean:write name="user" property="regTime" format="MM-dd"/>
		</td>
  	</tr>
  	</logic:iterate>
	<tr>
  		<td colspan="2" align="right"><html:link styleClass="smalltext" page="/user_list.jspe">show all...</html:link></td>
	</tr>
</table>


<%!
	String format(String url){
		if(url.toLowerCase().startsWith("http://"))
			return url;
		return "http://"+url;
	}
%>