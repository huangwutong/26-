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
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<bean:message key="WEATHER" bundle="html"/> 
<select id="select" name="weather" align="absMiddle">
	<option value="sunny" <logic:equal name="logForm" property="weather" value="sunny">selected</logic:equal>>sunny</option>
	<option value="ptcl" <logic:equal name="logForm" property="weather" value="ptcl">selected</logic:equal>>ptcloudy</option>
	<option value="cloudy" <logic:equal name="logForm" property="weather" value="cloudy">selected</logic:equal>>cloudy</option>
	<option value="showers" <logic:equal name="logForm" property="weather" value="showers">selected</logic:equal>>showers</option>
	<option value="rain" <logic:equal name="logForm" property="weather" value="rain">selected</logic:equal>>rain</option>
	<option value="storms" <logic:equal name="logForm" property="weather" value="storms">selected</logic:equal>>storms</option>
	<option value="snow" <logic:equal name="logForm" property="weather" value="snow">selected</logic:equal>>snow</option>
	<option value="flurries" <logic:equal name="logForm" property="weather" value="flurries">selected</logic:equal>>flurries</option>
	<option value="ice" <logic:equal name="logForm" property="weather" value="ice">selected</logic:equal>>ice</option>
</select>