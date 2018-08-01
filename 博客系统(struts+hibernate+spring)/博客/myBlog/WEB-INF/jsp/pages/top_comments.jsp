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

<dlog:param id="count" name="TOP_COMMENT_COUNT" value="10"/>
<dlog:comment id="comments" count="<%=count.getValue()%>"/>
<bean:size id="ccount" name="comments"/>
<logic:greaterThan name="ccount" value="0">
<table cellSpacing="1" cellPadding="2" border="0" width="100%" class="tableBorder">
    <tr>
      <td class="tableBorderHead"><html:img page="/images/gray.gif"/> <bean:message key="TOP_COMMENT_HEAD" bundle="html"/></td>
    </tr>
    <tr>
      <td>
		<logic:iterate id="comment" name="comments" indexId="idx">
		<bean:define id="log" name="comment" property="log"/>
      	<b class="smalltext"><%=(((Integer)idx).intValue()+1)%></b>. 
		<a title='<bean:message key="TOP_COMMENT_TIP" arg0="<%=((dlog4j.formbean.ReplyForm)comment).getAuthorName()%>" bundle="html"/>' href='<html:rewrite page="/showlog.jspe"/>?log_id=<bean:write name="log" property="id"/>#<bean:write name="comment" property="id"/>'><bean:write name="comment" property="brief"/></a><br>
      	</logic:iterate>
      </td>
    </tr>
    <logic:equal name="ccount" value="<%=count.getValue()%>">
	<tr>
	  <td align="right"><html:link styleClass="smalltext" page="/comment_list.jspe">more...</html:link></td>
	</tr>
	</logic:equal>
</table>
</logic:greaterThan>

