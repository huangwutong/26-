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

<bean:parameter id="pageIdx" name="page" value="1"/>
<dlog:member id="users" page="<%=pageIdx%>" pageCountId="pageCount" curPageId="curPage" userCountId="userCount"/>
<bean:parameter id="userid" name="userid" value="-1"/>
<bean:parameter id="query" name="query" value=""/>

<security:isRoleOf role="manager">
<script language="javascript">
	document.title += ' [<bean:message key="ADMIN_USER_TITLE" bundle="html"/>]';
</script>
<jsp:include page="mgr/admin_nav_bar.jsp" flush="true">
	<jsp:param name="sel" value="3"/>
</jsp:include>
</security:isRoleOf>
<table width="100%" cellspacing="0" cellpadding="2">
  <tr>
    <td>
      <table width='100%' border='0' cellspacing='1' cellpadding='1' align='center'>
        <tr> 
          <bean:define id="ucount" name="userCount"/>
          <td>&nbsp;<b><logic:notEmpty name="query"><bean:message key="MAIN_SEARCH" bundle="html"/>[<bean:write name="query"/>]</logic:notEmpty> <bean:message key="USER_HEAD" arg0="<%=String.valueOf(ucount)%>" bundle="html"/>: <a href="#" onclick="window.open('<html:rewrite page="/popups/find_user.jsp"/>','<bean:message key="USER_SEARCH" bundle="html"/>','height=30,width=350,toolbar=no, menubar=no,location=no, status=no,scrollbars=no');return false;" titleKey="USER_SEARCH" bundle="html"> <html:img page="/images/find.gif" border="0" align="absMiddle"/></a></b>
          	<font color="red"><html:errors/></font>
          </td>
          <td align="right"><bean:message key="USER_SENDMSG" bundle="html"/></td>
        </tr>
      </table>
      <logic:greaterThan name="pageCount" value="1">
      <table width='100%' border='0' cellspacing='1' cellpadding='1' align='center'>
        <tr> 
          <td>
	    	<dlog:for id="idx" from="1" to="pageCount">
	    		<dlog:compare num1="curPage" num2="idx" method="1"><a href='<html:rewrite page="/user_list.jspe"/>?page=<bean:write name="idx"/>'>[</dlog:compare><bean:write name="idx"/><dlog:compare num1="curPage" num2="idx" method="1">]</a></dlog:compare>
	    	</dlog:for>
          </td>
        </tr>
      </table>
      </logic:greaterThan>
      <table width="100%" border="0" cellspacing="1" cellpadding="2" align='center' class="tableBorder">
          <tr class="clist_title"> 
            <td align="center"><bean:message key="USER_ID" bundle="html"/></td>
            <td align="center"><bean:message key="USER_NICK" bundle="html"/></td>
			<security:isRoleOf role="manager">
            <td align="center"><bean:message key="USER_TYPE" bundle="html"/></td>
            </security:isRoleOf>
            <td align="center"><bean:message key="EDITUSER_REGTIME" bundle="html"/></td>
            <td align="center"><bean:message key="EDITUSER_LASTLOGIN" bundle="html"/></td>
			<security:isRoleOf role="manager">
            <td align="center"></td>
            </security:isRoleOf>
            <td width="16" align="center"></td>
            <td width="16" align="center"></td>
			<security:isRoleOf role="manager">
            <td width="16" align="center"></td>
            </security:isRoleOf>
          </tr>
	  	  <logic:iterate id="user" name="users" indexId="idx">
          <tr bgcolor="<%=(((idx.intValue()%2)==0)?"#ffffff":"#EFF3F7")%>"> 
            <td align="left"><bean:write name="user" property="loginName"/></td>
            <td align="left">
            	<html:link titleKey="USER_VIEW" bundle="html" page="/viewuser.jspe" paramId="userid" paramName="user" paramProperty="id"><bean:write name="user" property="displayName"/></html:link>
            </td>
			<security:isRoleOf role="manager">
            <td align="center"><bean:write name="user" property="roleDesc"/></td>
            </security:isRoleOf>
            <td align="center" class="smalltext"><bean:write name="user" property="regDate"/></td>
            <td align="center" class="smalltext"><bean:write name="user" property="lastDate"/></td>
			<security:isRoleOf role="manager">
            <td width="16" align="center"><a href="<html:rewrite page="/user_list.jspe"/>?userid=<bean:write name="user" property="id"/>&page=<%=pageIdx%>#edituser"><html:img altKey="MODIFY" bundle="html" page="/images/icon_edit2.gif" border="0"/></a></td>
            </security:isRoleOf>
            <td align="center"><a href="sendmsg.jspe?id=<bean:write name="user" property="id"/>&name=<bean:write name="user" property="loginName"/>"><html:img page="/images/icon_email.gif" border="0"/></a></td>
            <td align="center"><logic:notEmpty name="user" property="homePage"><a href="<%=format(((dlog4j.formbean.UserForm)user).getHomePage())%>" target="_blank" title="<bean:message key="USER_VISIT_HOMEPAGE" arg0="<%=((dlog4j.formbean.UserForm)user).getDisplayName()%>" bundle="html"/>"><html:img page="/images/icon_home.gif" border="0"/></a></logic:notEmpty></td>
			<security:isRoleOf role="manager">
            <td width="16" align="center"><a href="<html:rewrite page="/user.do"/>?page=<%=pageIdx%>&eventSubmit_DeleteUser=<bean:write name="user" property="id"/>" onclick="return confirm('<bean:message key="USER_DELETE_CONFIRM" bundle="html" arg0="<%=((dlog4j.formbean.UserForm)user).getDisplayName()%>" arg1="<%=((dlog4j.formbean.UserForm)user).getLoginName()%>"/>')"><html:img page="/images/icon_delete.gif" border="0"/></a></td>
            </security:isRoleOf>
          </tr>
      	  </logic:iterate>
      </table>
    </td>
  </tr>
</table>
<security:isRoleOf role="manager">
<logic:notEqual name="userid" value="-1">
<dlog:edituser id="userForm" scope="request"/>
<table border="0"><tr><td></td></tr></table>
<a name="edituser">
<table width="100%" cellspacing="0" cellpadding="2">
  <tr>
    <td>
      <table width='100%' border='0' cellspacing='1' cellpadding='1' align='center' bgcolor="#e2e2e2">
        <tr> 
          <bean:define id="displayName" name="userForm" property="displayName"/>
          <bean:define id="loginName" name="userForm" property="loginName"/>
          <td bgcolor='#e2e2e2'>&nbsp;<b><font color="#000000"> <bean:message key="USER_MODIFY" bundle="html" arg0="<%=(String)displayName%>" arg1="<%=(String)loginName%>"/>:</font></b></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#e2e2e2">
        <html:form name="userForm" action="/user" type="dlog4j.formbean.UserForm" scope="request">
          <html:hidden name="userForm" property="id"/>
		  <html:hidden name="userForm" property="loginName"/>
		  <input type="hidden" name="mode" value="0"/>
		  <input type="hidden" name="page" value="<%=pageIdx%>">
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center" class="unnamed1"><bean:message key="EDITUSER_REGTIME" bundle="html"/></td>
            <td width="88%"> <bean:write name="userForm" property="regDate"/> </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center" class="unnamed1"><bean:message key="EDITUSER_LASTLOGIN" bundle="html"/></td>
            <td width="88%"> <bean:write name="userForm" property="lastTime"/> </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center"><bean:message key="USER_EMAIL" bundle="html"/></td>
            <td width="88%"> <bean:write name="userForm" property="email"/></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center"><bean:message key="USER_HOMEPAGE" bundle="html"/></td>
            <td width="88%"> <bean:write name="userForm" property="homePage"/></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center"><bean:message key="USER_PASSWORD" bundle="html"/></td>
            <td width="88%"> <html:password name="userForm" property="password"/></td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center"><bean:message key="USER_TYPE" bundle="html"/></td>
            <td width="88%">
            	<select name="userRole">
            		<option value="1" <logic:equal name="userForm" property="userRole" value="1">SELECTED</logic:equal>><bean:message key="USER_ROLE_GUEST" bundle="html"/></option>
            		<option value="2" <logic:equal name="userForm" property="userRole" value="2">SELECTED</logic:equal>><bean:message key="USER_ROLE_COMMON" bundle="html"/></option>
            		<option value="4" <logic:equal name="userForm" property="userRole" value="4">SELECTED</logic:equal>><bean:message key="USER_ROLE_FRIEND" bundle="html"/></option>
            		<option value="8" <logic:equal name="userForm" property="userRole" value="8">SELECTED</logic:equal>><bean:message key="USER_ROLE_BUDDY" bundle="html"/></option>
            		<option value="16" <logic:equal name="userForm" property="userRole" value="16">SELECTED</logic:equal>><bean:message key="USER_ROLE_MANAGER" bundle="html"/></option>
            	</select>
            </td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%" align="center"><bean:message key="USER_CAT_ENABLE" bundle="html"/></td>
            <td width="88%" valign="bottom"><b><bean:message key="USER_CAT_TIP" bundle="html"/></b><BR>
			<dlog:category id="categories" security="true"/>
			<logic:iterate id="cat" name="categories">
			<%
				String cats = ((dlog4j.formbean.UserForm)pageContext.findAttribute("userForm")).getCats();
				int catid = ((dlog4j.formbean.CategoryForm)cat).getId();
			%>
			<logic:notEqual name="cat" property="type" value="1">
			<input type="checkbox" name="allowCat" value="<bean:write name="cat" property="id"/>" <%=(check(cats,catid)?"checked":"")%>>
			<logic:equal name="cat" property="type" value="0">
				<font color="red">
			</logic:equal>
			<logic:equal name="cat" property="type" value="2">
				<font color="blue">
			</logic:equal>
			<bean:write name="cat" property="name"/><BR>
			</font>
			</logic:notEqual>
			</logic:iterate>
			</td>
          </tr>
          <tr bgcolor="#f8f8f8"> 
            <td width="12%"><br> </td>
            <td width="88%" height="40"> 
            	<input type="submit" class="button" name="eventSubmit_SetUserRole" value="<bean:message key="MODIFY" bundle="html"/>"> 
            </td>
          </tr>
        </html:form>
      </table>
     </td>
  </tr>
</table>
</a>
</logic:notEqual>
</security:isRoleOf>

<%!
	boolean check(String cats, int catid){		
		if(cats!=null){
			java.util.StringTokenizer st = new java.util.StringTokenizer(cats,",");
			while(st.hasMoreElements()){
				String sId = st.nextToken();
				try{
					if(catid==Integer.parseInt(sId))
						return true;
				}catch(Exception e){}
			}
		}
		return false;
	}
	String format(String url){
		if(url.toLowerCase().startsWith("http://"))
			return url;
		return "http://"+url;
	}
%>