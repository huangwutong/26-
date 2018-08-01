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
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<dlog:getLoginUser id="loginUser"/>

<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<bean:parameter id="msg" name="msg" value="1"/>

<table cellSpacing="0" cellPadding="2" width="100%" border="0" class="tableBorder">
    <tr class="tableBorderHead">
      <td class="tableBorderHead" valign="bottom">
		<html:img page="/images/gray.gif"/> <bean:message key="USERINFO_HEAD" arg0="<%=loginUser.getDisplayName()%>" bundle="html"/>
	  </td>
      <td valign="bottom">
	    <logic:equal name="msg" value="1">
		<dlog:messages id="messages"/>
		<bean:size id="msgcount" name="messages"/>
	    <logic:greaterThan name="msgcount" value="0">      
		<div id="newMessage" style="visibility:visible" >
			<html:link page="/showmsg.jspe?msg=0" onclick="javascript:newMessage.style.visibility = 'hidden';">
				<html:img src="/images/newmsg.gif" align="absmiddle" border="0"/>
			</html:link>
		</div>
		<bgsound src='<html:rewrite page="/sounds/newmsg.wav"/>' border='0'>
	    </logic:greaterThan>
	    </logic:equal>
	  </td>
    </tr>
	<tr bgcolor="white">
	  <td colspan=2>
  	  <table border="0" width="100%">
  		<tr>
  			<td valign="top">
				<html:link page="/edituser.jspe" titleKey="MODIFY_MY_DETAIL" bundle="html"><html:img page="/images/modify.gif" align="absMiddle" border="0"/> <bean:message key="USERINFO_MODIFY" bundle="html"/></html:link><BR>
				<html:link page="/showmsg.jspe?msg=0&status=1" titleKey="VIEW_MY_MESSAGE" bundle="html"><html:img page="/images/message.gif" align="absMiddle" border="0"/> <bean:message key="USERINFO_MSG" bundle="html"/></html:link><BR>
				<logic:greaterThan name="loginUser" property="logCount" value="0" >
				<html:link page="/main.jspe" paramId="userid" paramName="loginUser" paramProperty="id" titleKey="VIEW_MY_LOG" bundle="html"><html:img page="/images/icon_post.gif" align="absMiddle" border="0"/> <bean:message key="USERINFO_LOG" bundle="html"/></html:link><BR>
			    </logic:greaterThan>
				<security:canAccess resource="log" operation="maintain" range="self">
				<html:link page="/addlog.jspe" paramId="cat_id" paramName="cat_id"><html:img page="/images/writelog.gif" align="absMiddle" border="0"/> <bean:message key="USERINFO_WRITE_LOG" bundle="html"/></html:link>				    
				</security:canAccess>
  			</td>
  			<td valign="top">
				<html:link page="/login.do?eventSubmit_Logout=1"><html:img page="/images/logout.gif" align="absMiddle" border="0"/> <bean:message key="USERINFO_LOGOUT" bundle="html"/></html:link><BR>
				<logic:greaterThan name="loginUser" property="bookMarkCount" value="0">
				<html:link page="/bookmark.jspe" titleKey="VIEW_MY_BOOKMARK" bundle="html"><html:img page="/images/bookmark.gif" align="absMiddle" border="0"/> <bean:message key="USERINFO_BOOKMARK" bundle="html"/></html:link><BR>
			    </logic:greaterThan>
			    <logic:greaterThan name="loginUser" property="replyCount" value="0" >
				<html:link page="/comment_list.jspe" paramId="userid" paramName="loginUser" paramProperty="id" titleKey="VIEW_MY_REPLY" bundle="html"><html:img page="/images/newwin.gif" align="absMiddle" border="0"/> <bean:message key="USERINFO_REPLY" bundle="html"/></html:link><BR>
				</logic:greaterThan>
				<security:isRoleOf role="manager">
				<html:link page="/mgr/index.jspe" titleKey="SITE_MANAGER_TIP" bundle="html"><html:img page="/images/green_arrow.gif" align="absMiddle" border="0"/> <bean:message key="USERINFO_ADMIN" bundle="html"/></html:link>				    
				</security:isRoleOf>
			</td>
  		</tr>
	  </table>    
	  </td>
	</tr>
</table>