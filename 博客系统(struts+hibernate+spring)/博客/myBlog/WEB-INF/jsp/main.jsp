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
<%@ page import="dlog4j.formbean.LogForm" %>

<dlog:getLoginUser id="loginUser"/>

<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<bean:parameter id="userid" name="userid" value="-1"/>
<bean:parameter id="pageIndex" name="page" value="1"/>
<bean:parameter id="pageBase" name="base" value="0"/>
<bean:parameter id="year" name="log_year" value="-1"/>
<bean:parameter id="month" name="log_month" value="-1"/>
<bean:parameter id="date" name="log_date" value="-1"/>
<bean:parameter id="sort" name="sort" value=""/>
<bean:parameter id="query" name="query" value=""/>
<dlog:logs id="logs" catid="<%=cat_id%>"/>
<dlog:getuser id="queryUser" userid="<%=userid%>"/>
<dlog:category id="categories" catid="cur_cat"/>

<%
	String encoding = (String)application.getAttribute("encoding");
	if(encoding==null)
		encoding = "UTF-8";
	StringBuffer param = new StringBuffer();
	if(!"".equals(query)){
		param.append("&query=");
		param.append(java.net.URLEncoder.encode(query,encoding));
	}
	if(!"".equals(sort)){
		param.append("&sort=");
		param.append(sort);
	}
	if(!"-1".equals(userid)){
		param.append("&userid=");
		param.append(userid);
	}
	if(!"-1".equals(year)){
		param.append("&log_year=");
		param.append(year);
	}
	if(!"-1".equals(month)){
		param.append("&log_month=");
		param.append(month);
	}
	if(!"-1".equals(date)){
		param.append("&log_date=");
		param.append(date);
	}
	if(!"-1".equals(cat_id)){
		param.append("&cat_id=");
		param.append(cat_id);
	}
%>

<logic:notEmpty name="cur_cat">
<script language="javascript">
	document.title += ' [<bean:write name="cur_cat" property="name"/>]';
</script>
</logic:notEmpty>

<dlog:param id="param1" name="SHOW_TOP_INFO" value="0"/>
<logic:equal name="param1" property="value" value="1">
	<jsp:include page="pages/scrolltip.jsp" flush="true"/>
</logic:equal>
<table width='100%' border='0' cellspacing='2' cellpadding='2'>
  	<tr><td><%
    			int iFrom = Integer.parseInt(pageBase)*10+1;
    			int iTo = iFrom + 10 - 1;
    			if(iTo > pageCount.intValue())
    				iTo = pageCount.intValue();
    		%>
   			<logic:notEmpty name="queryUser"><bean:message key="MAIN_USER" bundle="html"/>[<bean:write name="queryUser" property="displayName"/>]</logic:notEmpty><logic:notEmpty name="timeString"><bean:write name="timeString"/></logic:notEmpty><logic:notEmpty name="cur_cat">[<bean:write name="cur_cat" property="name"/>]</logic:notEmpty><logic:notEmpty name="query"><bean:message key="MAIN_SEARCH" bundle="html"/>[<font color=red><bean:write name="query"/></font>]</logic:notEmpty><bean:message key="MAIN_TOTAL_LOG" arg0="<%=String.valueOf(logCount)%>" bundle="html"/><logic:greaterThan name="logCount" value="0"> | <bean:message key="MAIN_PER_PAGE" arg0="<%=String.valueOf(perPage)%>" bundle="html"/> | <bean:message key="MAIN_PAGES" arg0="<%=String.valueOf(curPage)%>" arg1="<%=String.valueOf(pageCount)%>" bundle="html"/>&nbsp;</logic:greaterThan>
   			<dlog:compare num1="logCount" num2="perPage" method="2">
		</td>
		<td align=right>
    		<font class='smalltext'>
    		<dlog:compare num1="pageBase" num2="0" method="2">
    			 <a href='main.jspe?base=<%=(Integer.parseInt(pageBase)-1)%>&page=<%=(iFrom-1)%><%=param%>'>[&lt;&lt;]</a> - 
    		</dlog:compare>
    		<dlog:for id="idx" from="<%=String.valueOf(iFrom)%>" to="<%=String.valueOf(iTo)%>">
    			<dlog:compare num1="curPage" num2="idx" method="1"><a href='main.jspe?base=<%=pageBase%>&page=<bean:write name="idx"/><%=param%>'>[</dlog:compare><bean:write name="idx"/><dlog:compare num1="curPage" num2="idx" method="1">]</a></dlog:compare>
    		</dlog:for>
    		<dlog:compare num1="<%=String.valueOf(((Integer.parseInt(pageBase)+1)*10))%>" num2="pageCount" method="4">	    		
    			 - <a href='main.jspe?base=<%=(Integer.parseInt(pageBase)+1)%>&page=<%=(iTo+1)%><%=param%>'>[>>]</a>
    		</dlog:compare>
    		</font>
    		</dlog:compare>
   		</td> 
    </tr>
   	<tr><td height="1" colspan=2><hr size=1 noshade color="#CCCCCC"></td></tr>
</table>
<logic:iterate id="log" name="logs" indexId="idx">
<bean:define id="cat" name="log" property="category"/>
<table border='0' cellspacing='4' cellpadding='0' width='100%'>
   	<tr><td><table cellspacing='0' cellpadding='0' width='100%'>
    		<tr><td width='2' background="<html:rewrite page="/images/icon_title.gif"/>"></td>
   				<td valign='top'>&nbsp;<b><a href=showlog.jspe?cat_id=<bean:write name="cat_id"/>&log_id=<bean:write name="log" property="id"/>><font class='log_title'><bean:write name="log" property="title" filter="false"/></font></a></b>&nbsp;&nbsp;[ <font class="smalltext"><bean:write name="log" property="logTime" format="yy-M-d"/></font> | <a target='_blank' href='<bean:write name="log" property="authorUrl"/>'><bean:write name="log" property="author"/></a> ]<br>&nbsp;<IMG src='<html:rewrite page="/images"/>/hn2_t_<bean:write name="log" property="weather"/>.gif' /> <img src='<html:rewrite page="/images"/>/hn2_<bean:write name="log" property="weather"/>.gif' align='absmiddle' /> <img src='<html:rewrite page="/images"/>/face<bean:write name="log" property="moodLevel"/>.gif' alt='<bean:message key="MOOD_LEVEL" bundle="html"/>#<bean:write name="log" property="moodLevel"/>' /></font></td>
   				<td align=right valign='top'><a href="showlog.jspe?cat_id=<bean:write name="cat_id"/>&log_id=<bean:write name="log" property="id"/>"><bean:message key="MAIN_READ" bundle="html"/></a>&nbsp;</td>
   			</tr>
   			</table>
   		</td>
   	</tr>
   	<tr><td valign='top'><br/>
   			<dlog:highlight query="<%=query%>" bold="true">
   			<bean:write name="log" property="previewContent" filter="false"/>
			</dlog:highlight>
   		</td>
    </tr>
   	<tr><td align=right>
			<logic:notEmpty name="log" property="otherContent">
   			<div align='right'><a href='showlog.jspe?cat_id=<bean:write name="cat_id"/>&log_id=<bean:write name="log" property="id"/>' class='more'><bean:message key="LOG_DETAIL" bundle="html"/></a></div>
   			</logic:notEmpty>
   		</td>
    </tr>
    <tr><td align='right'>
    	<font class="smalltext">By [<html:link page="/viewuser.jspe" paramId="userid" paramName="log" paramProperty="ownerId"><bean:write name="log" property="ownerName"/></html:link>] in [<html:link page="/main.jspe" paramId="cat_id" paramName="cat" paramProperty="id"><bean:write name="cat" property="name"/></html:link>] at <bean:write name="log" property="logTime" format="yy-M-d H:m"/> | Comment[<bean:write name="log" property="replyCount"/>] | <html:link page="/pages/trackbacks.jspe" paramId="log_id" paramName="log" paramProperty="id" titleKey="TRACKBACK_VIEW" bundle="html">TB</html:link> | <bean:write name="log" property="viewCount"/> Views </font><%if(loginUser.isAdmin()||((LogForm)log).getOwnerId()==loginUser.getId()){%>&nbsp;&nbsp;<html:link page="/editlog.jspe" paramId="log_id" paramName="log" paramProperty="id"><html:img page="/images/icon_edit.gif" border="0" altKey="MAIN_EDIT_LOG" bundle="html" align="absmiddle"/></html:link><%}%></td>
	</tr>
</table> 
<br/><br/>
</logic:iterate>
<dlog:compare num1="logCount" num2="perPage" method="2">
<table width='100%' border='0' cellspacing='2' cellpadding='2'>
   	<tr>
   		<td></td>
   		<td align=right>
   			<dlog:compare num1="logCount" num2="perPage" method="2">
    		<font class='smalltext'>
    		<dlog:compare num1="pageBase" num2="0" method="2">
    			 <a href='main.jspe?base=<%=(Integer.parseInt(pageBase)-1)%>&page=<%=(iFrom-1)%><%=param%>'>[&lt;&lt;]</a> - 
    		</dlog:compare>
    		<dlog:for id="idx" from="<%=String.valueOf(iFrom)%>" to="<%=String.valueOf(iTo)%>">
    			<dlog:compare num1="curPage" num2="idx" method="1"><a href='main.jspe?base=<%=pageBase%>&page=<bean:write name="idx"/><%=param%>'>[</dlog:compare><bean:write name="idx"/><dlog:compare num1="curPage" num2="idx" method="1">]</a></dlog:compare>
    		</dlog:for>
    		<dlog:compare num1="<%=String.valueOf(((Integer.parseInt(pageBase)+1)*10))%>" num2="pageCount" method="4">
    			 - <a href='main.jspe?base=<%=(Integer.parseInt(pageBase)+1)%>&page=<%=(iTo+1)%><%=param%>'>[>>]</a>
    		</dlog:compare>
    		</font>
    		</dlog:compare>
   		</td> 
    </tr>
</table>
</dlog:compare>