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
<%@ taglib uri="/WEB-INF/struts-wml.tld" prefix="wml" %>
<%@ taglib uri="/WEB-INF/security.tld" prefix="security" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<%@ page import="java.util.*" %>

<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<bean:parameter id="log_id" name="log_id" value="-1"/>
<bean:parameter id="pageIdx" name="page" value="0"/>

<dlog:getlog id="log" withReplies="true" previd="prev_log" nextid="next_log"/>
<logic:empty name="log">
<p align="left">
	<bean:message key="SHOWLOG_ERROR" bundle="wml"/>
</p>
</logic:empty>
<logic:notEmpty name="log">
<card title="<bean:message key="SHOWLOG" bundle="wml"/>">
<p mode="nowrap">
<bean:message key="TITLE" bundle="wml"/>:<bean:write name="log" property="titleText"/><br/>
<bean:message key="CREATETIME" bundle="wml"/>:<bean:write name="log" property="logTime" format="MM-dd HH:mm"/><br/>
<bean:message key="CONTENT" bundle="wml"/>:<br/>
<%
	int iPage = 0;
	try{
		iPage = Integer.parseInt(pageIdx);
	}catch(Exception e){}
	String[] contents = split(log.getWmlContent());
	if(iPage>=contents.length)
		iPage = contents.length - 1;
	out.println(contents[iPage]);
%>
</p>
<p align="left"><br/>
	<%if(iPage>0){%>
	<anchor>
		<bean:message key="PREVIOUS_PAGE" bundle="wml"/>
		<wml:go page="/showlog.jspw" method="get">
    		<postfield name="cat_id" value="<%=cat_id%>"/>
    		<postfield name="log_id" value="<%=log_id%>"/>
    		<postfield name="page" value="<%=(iPage-1)%>"/>
    	</wml:go>
	</anchor><br/>
	<%}%>

	<%if(iPage<(contents.length-1)){%>
	<anchor>
		<bean:message key="NEXT_PAGE" bundle="wml"/>
		<wml:go page="/showlog.jspw" method="get">
    		<postfield name="cat_id" value="<%=cat_id%>"/>
    		<postfield name="log_id" value="<%=log_id%>"/>
    		<postfield name="page" value="<%=(iPage+1)%>"/>
    	</wml:go>
	</anchor><br/>
	<%}%>
	<security:isNotRoleOf role="guest" orNull="true">
		<wml:link page="/reply.jspw" paramId="log_id" paramName="log_id"><bean:message key="TO_COMMENT" bundle="wml"/></wml:link><br/>
	</security:isNotRoleOf>
	<security:isRoleOf role="guest" orNull="true">
		<bean:message key="COMMENT_LOGIN_TIP" bundle="html"/><br/>
	</security:isRoleOf>
	<logic:greaterThan name="log" property="replyCount" value="0">
		<wml:link page="/comments.jspw" paramId="log_id" paramName="log_id"><bean:message key="SHOW_COMMENT" bundle="wml"/>(<bean:write name="log" property="replyCount"/>)</wml:link><br/>
	</logic:greaterThan>
	<wml:link page="/index.jspw"><bean:message key="BACK_TO_HOME" bundle="html"/></wml:link><br/>
</p>
</logic:notEmpty>
</card>

<%!
	static int WORD_COUNT_PER_PAGE = 400;
	
	String[] split(String content){
		List tmp = new ArrayList();
		for(int i=0;i<content.length();){
			if((i+WORD_COUNT_PER_PAGE)<content.length())
				tmp.add(content.substring(i, i+WORD_COUNT_PER_PAGE));
			else{
				tmp.add(content.substring(i));
				break;
			}
			i += WORD_COUNT_PER_PAGE;
		}
		
		return (String[])tmp.toArray(new String[tmp.size()]);	
	}
%>