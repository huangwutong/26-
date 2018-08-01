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

<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<bean:parameter id="userid" name="userid" value="-1"/>
<bean:parameter id="pageIndex" name="page" value="1"/>
<bean:parameter id="pageBase" name="base" value="0"/>
<bean:parameter id="query" name="query" value=""/>

<dlog:replies id="replies" catid="<%=cat_id%>"/>
<dlog:getuser id="queryUser" userid="<%=userid%>"/>

<script language="javascript">
	document.title += ' [<bean:message key="VIEWUSER_REPLIES" bundle="html"/>]';
</script>

<table width='100%' border='0' cellspacing='0' cellpadding='4'>
<tr>
	<td>
  		<%
			String encoding = (String)application.getAttribute("encoding");
			if(encoding==null)
				encoding = "UTF-8";
  			query = java.net.URLEncoder.encode(query,encoding);
   			int iFrom = Integer.parseInt(pageBase)*10+1;
   			int iTo = iFrom + 10 - 1;
   			if(iTo > pageCount.intValue())
   				iTo = pageCount.intValue();
   		%>
		<html:img page="/images/lead.gif" align="absMiddle"/>
		<logic:notEmpty name="queryUser">
    		<bean:message key="MAIN_USER" bundle="html"/>[<bean:write name="queryUser" property="displayName"/>]
		</logic:notEmpty>
    	<logic:notEmpty name="query">
    		<bean:message key="MAIN_SEARCH" bundle="html"/>[<bean:write name="query"/>]
    	</logic:notEmpty>
		<bean:message key="COMMENT_HEAD" arg0="<%=String.valueOf(replyCount)%>" arg1="<%=String.valueOf(perPage)%>" arg2="<%=String.valueOf(curPage)%>" arg3="<%=String.valueOf(pageCount)%>" bundle="html"/>&nbsp;    				    			
	</td>
	<dlog:compare num1="replyCount" num2="perPage" method="2">
	<td align='right' nowrap>
		<font class='smalltext'>&nbsp;&nbsp;
		<dlog:compare num1="pageBase" num2="0" method="2">
 			 <a href='comment_list.jspe?query=<%=query%>&userid=<bean:write name="userid"/>&cat_id=<bean:write name="cat_id"/>&base=<%=(Integer.parseInt(pageBase)-1)%>&page=<%=(iFrom-1)%>'>[&lt;&lt;]</a> - 
		</dlog:compare>
		<dlog:for id="idx" from="<%=String.valueOf(iFrom)%>" to="<%=String.valueOf(iTo)%>">
			<dlog:compare num1="curPage" num2="idx" method="1"><a href='comment_list.jspe?query=<%=query%>&base=<%=pageBase%>&<logic:notEqual name="userid" value="-1">userid=<bean:write name="userid"/>&</logic:notEqual>page=<bean:write name="idx"/>'>[</dlog:compare><bean:write name="idx"/><dlog:compare num1="curPage" num2="idx" method="1">]</a></dlog:compare>
		</dlog:for>
		<dlog:compare num1="<%=String.valueOf((Integer.parseInt(pageBase)+1)*10)%>" num2="pageCount" method="4">	    		
		 - <a href='comment_list.jspe?query=<%=query%>&userid=<bean:write name="userid"/>&cat_id=<bean:write name="cat_id"/>&base=<%=(Integer.parseInt(pageBase)+1)%>&page=<%=(iTo+1)%>'>[>>]</a>
		</dlog:compare>
		</font>
	</td> 
	</dlog:compare>    
</tr>
</table>
    	
<logic:iterate id="reply" name="replies" indexId="idx">
<bean:define id="cat" name="reply" property="log.category"/>
	    
<table cellSpacing="1" cellPadding="2" width="100%" border="0">
<tr>
	<td><img src="<bean:write name="reply" property="faceUrl" filter="false"/>" align="absMiddle" border="0">
  		<html:link page="/viewuser.jspe" paramId="userid" paramName="reply" paramProperty="authorId"><bean:write name="reply" property="authorName"/></html:link>
       	[<a href="showlog.jspe?log_id=<bean:write name="reply" property="log.id"/>#<bean:write name="reply" property="id"/>"><bean:write name="reply" property="log.title" filter="false"/></a>]</a>
	</td>
</tr>
<tr>
	<td>
   		<dlog:highlight query="<%=query%>" bold="true">
	   	<bean:write name="reply" property="content" filter="<%=(((dlog4j.formbean.ReplyForm)reply).getShowFormerly()==1)%>"/>
		</dlog:highlight>
	</td>
</tr>   
<tr>
	<td class="smalltext" align="right">at <bean:write name="reply" property="writeTime" format="yy-MM-dd HH:mm"/>&nbsp;&nbsp;
	    <%if(loginUser.isAdmin()||((dlog4j.formbean.ReplyForm)reply).getAuthorId()==loginUser.getId()){%>
	      <a onclick="return confirm('<bean:message key="COMMENT_DELETE_TIP" bundle="html"/>')" href="deletereply.do?userid=<bean:write name="userid"/>&page=<bean:write name="curPage"/>&eventSubmit_DeleteReply=<bean:write name="reply" property="id"/>"><html:img altKey="COMMENT_DELETE" bundle="html" page="/images/icon_delete.gif" align="absMiddle" border="0"/></a>
	      <a href="showlog.jspe?log_id=<bean:write name="reply" property="log.id"/>&reply_id=<bean:write name="reply" property="id"/>#reply"><html:img altKey="COMMENT_EDIT" bundle="html" page="/images/icon_edit.gif" align="absMiddle" border="0"/></a>
	    <%}%>
	</td>
</tr>
</table> 
</logic:iterate>	    			
<dlog:compare num1="replyCount" num2="perPage" method="2">
<table width='100%' border='0' cellspacing='0' cellpadding='4'>
<tr>
	<td></td>
	<td align='right' nowrap>
   		<font class='smalltext'>&nbsp;&nbsp;
   		<dlog:compare num1="pageBase" num2="0" method="2">
   			 <a href='comment_list.jspe?query=<dlog:encode><%=query%></dlog:encode>&userid=<bean:write name="userid"/>&cat_id=<bean:write name="cat_id"/>&base=<%=(Integer.parseInt(pageBase)-1)%>&page=<%=(iFrom-1)%>'>[&lt;&lt;]</a> - 
   		</dlog:compare>
   		<dlog:for id="idx" from="<%=String.valueOf(iFrom)%>" to="<%=String.valueOf(iTo)%>">
   			<dlog:compare num1="curPage" num2="idx" method="1"><a href='comment_list.jspe?query=<dlog:encode><%=query%></dlog:encode>&base=<%=pageBase%>&<logic:notEqual name="userid" value="-1">userid=<bean:write name="userid"/>&</logic:notEqual>page=<bean:write name="idx"/>'>[</dlog:compare><bean:write name="idx"/><dlog:compare num1="curPage" num2="idx" method="1">]</a></dlog:compare>
   		</dlog:for>
   		<dlog:compare num1="<%=String.valueOf((Integer.parseInt(pageBase)+1)*10)%>" num2="pageCount" method="4">	    		
   			 - <a href='comment_list.jspe?query=<dlog:encode><%=query%></dlog:encode>&userid=<bean:write name="userid"/>&cat_id=<bean:write name="cat_id"/>&base=<%=(Integer.parseInt(pageBase)+1)%>&page=<%=(iTo+1)%>'>[>>]</a>
   		</dlog:compare>
   		</font>
	</td> 
</tr>
</table>
</dlog:compare>