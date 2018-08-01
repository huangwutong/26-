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

<dlog:getLoginUser id="loginUser"/>

<dlog:bookmark id="books" countId="count" list="true"/>
<bean:define id="bmcount" name="count"/>

<table width="100%" border="0" cellspacing="0" cellpadding="4">
<tr> 
	<td>
    	<table width='100%' border='0' cellspacing='0' cellpadding='4'>
    	<tr>
    		<td>
    			<html:img page="/images/lead.gif" hspace="4" align="absmiddle"/> <bean:message key="BOOKMARK_HEAD" arg0="<%=String.valueOf(bmcount)%>" bundle="html"/>&nbsp;
    		</td> 
	    </tr>
    	</table>
    	<logic:iterate id="book" name="books" indexId="idx">
	    <table border='0' cellspacing='1' cellpadding='0' width='100%'>
    	<tr>
    		<td>
    			<table border='0' cellspacing='0' cellpadding='2' width='100%' class="tableBorder">
	    		<tr <logic:equal name="book" property="log.status" value="4">bgcolor="#ff0000"</logic:equal>>
    				<td width='3'><html:img page="/images/icon_title.gif" align="top" /></td>
    				<td valign='top'>&nbsp;<b><a href=showlog.jspe?log_id=<bean:write name="book" property="log.id"/>><font class='log_title'><bean:write name="book" property="log.title"/></font></a></b>&nbsp;&nbsp;[<font class="smalltext"><bean:write name="book" property="log.logTime" format="yyyy-MM-dd"/> </font>| <a target='_blank' href='<bean:write name="book" property="log.authorUrl"/>'><bean:write name="book" property="log.author"/></a> ]<br>&nbsp;<IMG src='images/hn2_t_<bean:write name="book" property="log.weather"/>.gif' /> <img src='images/hn2_<bean:write name="book" property="log.weather"/>.gif' align='absmiddle' /> <img src='images/face<bean:write name="book" property="log.moodLevel"/>.gif' alt='<bean:message key="MOOD_LEVEL" bundle="html"/>#<bean:write name="book" property="log.moodLevel"/>' /></font></td><td align=right valign='top'><a href="showlog.jspe?log_id=<bean:write name="book" property="log.id"/>"><bean:message key="MAIN_READ" bundle="html"/></a>&nbsp;</td>
    			</tr>
	    		</table>
	    		<logic:equal name="book" property="log.status" value="0">
    			<table border='0' cellspacing='8' cellpadding='0' width='100%'>
    			<tr>
    				<td valign='top'>
    				<bean:write name="book" property="log.previewContent" filter="false"/>
    				</td>
	    		</tr>
    			</table>
   				<logic:notEmpty name="book" property="log.otherContent">
   				<div align='right'><a href='showlog.jspe?log_id=<bean:write name="book" property="log.id"/>' class='more'><bean:message key="LOG_DETAIL" bundle="html"/></a></div>
   				</logic:notEmpty>
    			</logic:equal>
    			<table border='0' cellspacing='4' cellpadding='0' align='right'>
    			<tr>
    				<td align='right'><font class="smalltext">By [<a href="viewuser.jspe?userid=<bean:write name="book" property="log.ownerId"/>"><bean:write name="book" property="log.ownerName"/></a>] in [<a href='main.jspe?cat_id=<bean:write name="book" property="log.category.id"/>'><bean:write name="book" property="log.category.name"/></a>] at <bean:write name="book" property="log.logTime" format="HH:mm:ss"/> | Comment[<bean:write name="book" property="log.replyCount"/>] | <bean:write name="book" property="log.viewCount"/> views <%if(loginUser.isLogin()){%>&nbsp;&nbsp;<a href='bookmark.do?eventSubmit_DeleteBookMark=<bean:write name="book" property="id"/>'><html:img page="/images/icon_delete.gif" border="0" altKey="BOOKMARK_DELETE" bundle="html" align="absmiddle" onclick="return cm();"/></a><%}%></font></td>
	    		</tr>
    			</table>
    		</td>
	    </tr>
		</table> 
		</logic:iterate>
		<script language="javascript">
			function cm(){
				return confirm('<bean:message key="BOOKMARK_DELETE_CONFIRM" bundle="html"/>');
			}
		</script>
	</td>
</tr>
</table>