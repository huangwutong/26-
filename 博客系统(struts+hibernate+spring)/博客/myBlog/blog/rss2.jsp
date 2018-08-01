<?xml version="1.0" encoding="UTF-8" ?>
<?xml-stylesheet type="text/css" href="../css/rss.css" ?>
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
<%@ page language="java" session="false" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>

<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<dlog:getsite id="site"/>
<dlog:logs id="logs" catid="<%=cat_id%>" count="20"/>
<dlog:referer/>

<%
	String url = dlog4j.util.RequestUtils.getBaseURL(request);	
%>

<rss version="2.0">
<channel>
	<title><bean:write name="site" property="displayName"/></title> 
	<link><%=url%></link> 
	<description><bean:write name="site" property="detail"/></description>
	<language>zh-CN</language>
	<pubDate><bean:write name="site" property="createTime" format="EEE, d MMM yyyy HH:mm:ss Z"/></pubDate>
	<copyright><bean:write name="site" property="displayName"/></copyright>
	<generator>DLOG4J</generator>
   	<logic:iterate id="log" name="logs" indexId="idx">
	<item>
		<link><%=url%>/showlog.jspe?log_id=<bean:write name="log" property="id"/></link>
		<title><![CDATA[<bean:write name="log" property="title"/>]]></title>
		<author><bean:write name="log" property="author"/></author>
		<category><bean:write name="log" property="category.name"/></category>
		<pubDate><bean:write name="log" property="logTime" format="EEE, d MMM yyyy HH:mm:ss Z"/></pubDate>
		<guid><bean:write name="log" property="id"/></guid>
		<description><![CDATA[<bean:write name="log" property="content" filter="false"/>]]></description>
	</item>		
	</logic:iterate>
</channel>
</rss>
