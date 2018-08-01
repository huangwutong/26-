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

<dlog:getsite id="site"/>
<bean:parameter id="cat_id" name="cat_id" value="-1"/>
<dlog:logs id="logs" catid="<%=cat_id%>" count="20"/>
<dlog:referer/>

<%
	String url = dlog4j.util.RequestUtils.getBaseURL(request);
%>

<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns="http://purl.org/rss/1.0/">
<channel rdf:about="<%=url%>">
	<title><bean:write name="site" property="displayName"/></title>
	<link><%=url%></link>
	<description><bean:write name="site" property="detail"/></description>
	<image rdf:resource="<%=url%><html:rewrite page="/images/logo.gif"/>" />
</channel>
<logic:iterate id="log" name="logs" indexId="idx">
<item rdf:about="<%=url%><html:rewrite page="/showlog.jspe" paramId="log_id" paramName="log" paramProperty="id"/>">
	<link><%=url%><html:rewrite page="/showlog.jspe" paramId="log_id" paramName="log" paramProperty="id"/></link>
	<title><![CDATA[<bean:write name="log" property="title"/>]]></title>
	<description><![CDATA[<bean:write name="log" property="content" filter="false"/>]]></description>
</item>		
</logic:iterate>
</rdf:RDF>
