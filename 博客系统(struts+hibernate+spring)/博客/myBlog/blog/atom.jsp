<?xml version="1.0" encoding="UTF-8" ?>
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

<feed version="0.3" xmlns="http://purl.org/atom/ns#">
	<title><bean:write name="site" property="displayName"/></title>
	<generator xmlns="" url="http://www.dlogcn.com" version="1.2">DLOG4J</generator>
	<link rel="alternate" type="text/html" href="<%=url%>"/>
	<info><bean:write name="site" property="detail"/></info>
	<modified><bean:write name="site" property="lastTime" format="yyyy-MM-dd HH:mm:ss"/></modified>
	<logic:iterate id="log" name="logs" indexId="idx">
	<entry>
		<title><![CDATA[<bean:write name="log" property="title"/>]]></title>
		<author>
			<name><bean:write name="log" property="author"/></name>
			<url><bean:write name="log" property="authorUrl"/></url>
		</author>
		<link rel="alternate" type="text/html" href="<%=url%><html:rewrite page="/showlog.jspe" paramId="log_id" paramName="log" paramProperty="id"/>"/>
		<id><bean:write name="log" property="id"/></id>
		<issued><bean:write name="log" property="logTime" format="yyyy-MM-dd HH:mm:ss"/></issued>
		<content type="text/html" base="<%=url%><html:rewrite page="/showlog.jspe" paramId="log_id" paramName="log" paramProperty="id"/>">
			<![CDATA[<bean:write name="log" property="content" filter="false"/>]]>
		</content>
	</entry>
	</logic:iterate>
</feed>