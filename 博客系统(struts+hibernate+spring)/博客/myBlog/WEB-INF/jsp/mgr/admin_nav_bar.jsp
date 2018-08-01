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

<bean:parameter id="sel" name="sel" value="0"/>

<table border="0" cellspacing="4" cellpadding="4" width="100%">
  <tr> 
    <td nowrap><html:link page="/mgr/editsite.jspe"><b><logic:equal name="sel" value="1"><font color="red"></logic:equal><bean:message key="ADMIN_TITLE" bundle="html"/><logic:equal name="sel" value="1"></font></logic:equal></b></html:link></td>
    <td nowrap><html:link page="/mgr/cat_list.jspe"><b><logic:equal name="sel" value="2"><font color="red"></logic:equal><bean:message key="ADMIN_CATEGORY_TITLE" bundle="html"/><logic:equal name="sel" value="2"></font></logic:equal></b></html:link></td>
    <td nowrap><html:link page="/user_list.jspe"><b><logic:equal name="sel" value="3"><font color="red"></logic:equal><bean:message key="ADMIN_USER_TITLE" bundle="html"/><logic:equal name="sel" value="3"></font></logic:equal></b></html:link></td>
    <td nowrap><html:link page="/mgr/setting.jspe"><b><logic:equal name="sel" value="4"><font color="red"></logic:equal><bean:message key="ADMIN_PARAM_TITLE" bundle="html"/><logic:equal name="sel" value="4"></font></logic:equal></b></html:link></td>
    <td nowrap><html:link page="/visitstat.jspe"><b><logic:equal name="sel" value="5"><font color="red"></logic:equal><bean:message key="ADMIN_STAT_TITLE" bundle="html"/><logic:equal name="sel" value="5"></font></logic:equal></b></html:link></td>
    <td nowrap><html:link page="/mgr/referer.jspe"><b><logic:equal name="sel" value="6"><font color="red"></logic:equal><bean:message key="ADMIN_REFERER_TITLE" bundle="html"/><logic:equal name="sel" value="6"></font></logic:equal></b></html:link></td>
    <td nowrap><html:link page="/mgr/links.jspe"><b><logic:equal name="sel" value="7"><font color="red"></logic:equal><bean:message key="ADMIN_FAVORITE_TITLE" bundle="html"/><logic:equal name="sel" value="7"></font></logic:equal></b></html:link></td>
    <td nowrap><html:link page="/mgr/template.jspe"><b><logic:equal name="sel" value="8"><font color="red"></logic:equal><bean:message key="ADMIN_TEMPLATE_TITLE" bundle="html"/><logic:equal name="sel" value="8"></font></logic:equal></b></html:link></td>
    <td width='100%'>&nbsp;</td>
  </tr>
</table>