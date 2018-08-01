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
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<%@ page import="java.util.*"%>
<%@ page import="dlog4j.ManagerBase"%>
<%@ page import="net.sf.hibernate.*"%>
<%@ page import="net.sf.hibernate.expression.*"%>
<%@ page import="dlog4j.formbean.*"%>

<security:isNotRoleOf role="manager">
	<jsp:include page="../pages/access_deny.jsp" flush="true"/>
</security:isNotRoleOf>
<security:isRoleOf role="manager">

<bean:parameter id="site_id" name="id" value=""/>
<%
	int siteid = -1;
	FavoriteForm editSite = null;
	try{
		siteid = Integer.parseInt(site_id);
	}catch(Exception e){}
	Session ssn = null;
	List sites = null;
	try{
		ssn = ManagerBase.getSession();
		Criteria crit = ssn.createCriteria(FavoriteForm.class);
		crit.addOrder(Order.asc("order"));
		sites = crit.list();
		for(int i=0;i<sites.size();i++){
			FavoriteForm tmp = (FavoriteForm)sites.get(i);
			if(tmp.getId()==siteid){
				editSite = tmp;
				pageContext.setAttribute("favoriteForm", editSite);
				break;
			}
		}
	}finally{
		ManagerBase.closeSession(ssn);
	}
	pageContext.setAttribute("sites",sites);
%>

<script language="javascript">
	document.title += ' [<bean:message key="ADMIN_FAVORITE_TITLE" bundle="html"/>]';
</script>
<jsp:include page="admin_nav_bar.jsp" flush="true">
	<jsp:param name="sel" value="7"/>
</jsp:include>

<logic:messagesPresent>
<br>
<font color="red"><b><html:errors/></b></font>
<br>
</logic:messagesPresent>

<table cellSpacing="1" cellPadding="2" border="0" width="100%" bgcolor="#e2e2e2">
<html:form action="/mgr/link" name="favoriteForm" type="dlog4j.formbean.FavoriteForm" onsubmit="return CheckForm(this);">
	<logic:notEmpty name="favoriteForm" property="title">
  	<input type="hidden" name="id" value="<bean:write name="favoriteForm" property="id"/>"/>
  	</logic:notEmpty>
	<tr bgcolor="#f8f8f8"> 
		<td width="80" align="center"><bean:message key="FAVORITE_NAME" bundle="html"/></td>
		<td><html:text name="favoriteForm" property="title" /> <font color="#FF0000"> * </font></td>
	</tr>
	<tr bgcolor="#f8f8f8"> 
		<td align="center"><bean:message key="FAVORITE_URL" bundle="html"/></td>
		<td><html:text name="favoriteForm" property="url" size="50"/> <font color="#FF0000"> * </font></td>
	</tr>
	<tr bgcolor="#f8f8f8"> 
		<td align="center">&nbsp;</td>
		<td><input type="checkbox" name="openInNewWindow" value="1" <logic:equal name="favoriteForm" property="openInNewWindow" value="1">checked</logic:equal>/><bean:message key="FAVORITE_OPEN_IN_NEW_WIN" bundle="html"/></td>
	</tr>
	<tr bgcolor="#f8f8f8"> 
		<td width="80" align="center"><bean:message key="FAVORITE_FORMAT" bundle="html"/></td>
		<td>
			<input type="radio" name="mode" value="HTML" <logic:equal name="favoriteForm" property="mode" value="HTML">checked</logic:equal>/>HTML &nbsp;
			<input type="radio" name="mode" value="XML" <logic:notEqual name="favoriteForm" property="mode" value="HTML">checked</logic:notEqual>/><html:img page="/images/button_xml.gif" border="0" title="Support RDF,RSS,ATOM"/>
		</td>
	</tr>	
    <logic:empty name="favoriteForm" property="title">
    <tr bgcolor="#f8f8f8"> 
        <td width="12%" align="center" class="unnamed1"><bean:message key="CATLIST_POS" bundle="html"/></td>
        <td width="88%"> 
       	<select name="order">          		
       		<option value="-1"><bean:message key="CATLIST_POS_BOTTOM" bundle="html"/></option>
			<logic:iterate id="site" name="sites" indexId="idx">
            <option value="<bean:write name="site" property="id"/>"><bean:write name="site" property="title"/></option>
            </logic:iterate>
        </select><input type="radio" name="position" value="-1"><bean:message key="CATLIST_POS_FRONT" bundle="html"/></input><input type="radio" name="position" value="1" checked><bean:message key="CATLIST_POS_AFTER" bundle="html"/></input>            	
		</td>
    </tr>
    </logic:empty>
	<tr bgcolor="#f8f8f8"> 
		<td>&nbsp;</td>
		<td>  
            <logic:notEmpty name="favoriteForm" property="title">
			<input type="submit" class="button" name="eventSubmit_Update" value="<bean:message key="MODIFY" bundle="html"/>">
			</logic:notEmpty>
            <logic:empty name="favoriteForm" property="title">
			<input type="submit" class="button" name="eventSubmit_Create" value="<bean:message key="ADD" bundle="html"/>">
			</logic:empty>
			<input type="reset" class="button" value="<bean:message key="RESET" bundle="html"/>"> 
		</td>
	</tr>
</html:form>
</table>
<bean:size id="siteCount" name="sites"/>
<logic:greaterThan name="siteCount" value="0">
<br/>
<table cellSpacing="1" cellPadding="2" border="0" width="100%" class="tableBorder">
    <tr class="tableBorderHead">
      <td nowrap><bean:message key="FAVORITE_NAME" bundle="html"/></td>
      <td><bean:message key="FAVORITE_URL" bundle="html"/></td>
      <td><bean:message key="FAVORITE_TIME" bundle="html"/></td>
	  <td width="16" colspan="4"></td>
    </tr>
	<logic:iterate id="site" name="sites" indexId="idx">
	<tr>
		<td nowrap><bean:write name="site" property="title"/></td>
		<td><a href="<bean:write name="site" property="url"/>" target="_blank"><%=getHost(((FavoriteForm)site).getUrl())%></a></td>
		<td nowrap><bean:write name="site" property="createTime" format="yy-MM-dd"/></td>
        <td width="16" align="right"><logic:notEqual name="idx" value="0"><html:link page="/mgr/favorite.do" paramId="eventSubmit_MoveUp" paramName="site" paramProperty="id"><html:img altKey="CATLIST_MOVEUP" page="/images/arrow_up.gif" border="0" bundle="html"/></html:link></logic:notEqual></td>
        <td width="16" align="left"><logic:lessThan name="idx" value="<%=String.valueOf(sites.size()-1)%>"><html:link page="/mgr/favorite.do" paramId="eventSubmit_MoveDown" paramName="site" paramProperty="id"><html:img altKey="CATLIST_MOVEDN" page="/images/arrow_down.gif" border="0" bundle="html"/></html:link></logic:lessThan></td>
		<td width="16" align="center"><a href="?id=<bean:write name="site" property="id"/>"><html:img altKey="MODIFY" page="/images/icon_edit2.gif" border="0" bundle="html"/></a></td>
        <td width="16" align="center"><html:link page="/mgr/favorite.do" paramId="eventSubmit_Delete" paramName="site" paramProperty="id" onclick="return confirmDelete()"><html:img altKey="FAVORITE_DELETE" page="/images/icon_delete.gif" border="0" bundle="html"/></html:link></td>
  	</tr>
  	</logic:iterate>
</table>
</logic:greaterThan>
<script language="JavaScript">

function confirmDelete(){
	return confirm('<bean:message key="FAVORITE_DELETE_CONFIRM" bundle="html"/>');
}
function CheckForm(form1)
{
	with(form1){
	if (title.value.length == 0) {
		title.focus();
		return false;
	}
	if (url.value.length == 0) {
		url.focus();
		return false;
	}
	}
	return true;
}
</script>
</security:isRoleOf>

<%!
	String getHost(String url){
		try{
			url = new java.net.URL(url).getHost();
		}catch(Exception e){}
		if(url.length()>33)
			url = url.substring(0,30) + "...";
		return url;
	}
%>