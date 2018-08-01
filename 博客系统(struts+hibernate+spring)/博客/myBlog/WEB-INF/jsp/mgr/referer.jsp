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
<%@ page import="java.util.*"%>
<%@ page import="dlog4j.ManagerBase"%>
<%@ page import="net.sf.hibernate.*"%>
<%@ page import="net.sf.hibernate.expression.*"%>
<%@ page import="dlog4j.beans.*"%>


<security:isNotRoleOf role="manager">
	<jsp:include page="../pages/access_deny.jsp" flush="true"/>
</security:isNotRoleOf>
<security:isRoleOf role="manager">

<bean:parameter id="sPageIdx" name="page" value="0"/>
<bean:parameter id="paramRefer" name="refer" value="1"/>
<script language="javascript">
	document.title += ' [<bean:message key="ADMIN_REFERER_TITLE" bundle="html"/>]';
</script>
<jsp:include page="admin_nav_bar.jsp" flush="true">
	<jsp:param name="sel" value="6"/>
</jsp:include>

<%
	int pageIdx = Integer.parseInt(sPageIdx);
	Session ssn = null;
	List logs = null;
	int log_count = 0;
	try{
		ssn = ManagerBase.getSession();
		Criteria crit = ssn.createCriteria(RefererBean.class);
		if("1".equals(paramRefer))
			crit.add(Expression.isNotNull("refererURL"));
		crit.addOrder(Order.desc("visitDate"));
		crit.addOrder(Order.desc("visitTime"));
		crit.setFirstResult(pageIdx * LOG_PER_PAGE);
		crit.setMaxResults(LOG_PER_PAGE);
		logs = crit.list();
		// 
		String hql = "SELECT COUNT(*) FROM "+RefererBean.class.getName()+" AS log";		
		if("1".equals(paramRefer))
			hql += " WHERE log.refererURL IS NOT NULL";
		Query q2 = ssn.createQuery(hql);
		List res = q2.list();
		log_count = (res.size()>0)?((Integer)res.get(0)).intValue():0;
	}finally{
		ManagerBase.closeSession(ssn);
	}
	pageContext.setAttribute("logs",logs);
%>

<table width="100%" border=0>
	<tr>
		<td>
			<logic:notEqual name="paramRefer" value="1"><a href="?page=<%=pageIdx%>&refer=1"><bean:message key="REFERER_REF" bundle="html"/></a></logic:notEqual>
			<logic:equal name="paramRefer" value="1"><a href="?page=<%=pageIdx%>&refer=0"><bean:message key="REFERER_ALL" bundle="html"/></a></logic:equal>
		</td>
		<td align="right">
			<font color="#C0C0C0">
			<%if(pageIdx>0){%><a href="?page=0&refer=<%=paramRefer%>"><%}%><bean:message key="NAVIGATOR_HOME" bundle="html"/>
			<%if(pageIdx>0){%></a><%}%>	
			
			<%if(pageIdx>0){%><a href="?page=<%=(pageIdx-1)%>&refer=<%=paramRefer%>"><%}%><bean:message key="NAVIGATOR_PREVIOUS" bundle="html"/>
			<%if(pageIdx>0){%></a><%}%>
			
			<%if((pageIdx+1)<getPageCount(log_count)){%><a href="?page=<%=(pageIdx+1)%>&refer=<%=paramRefer%>"><%}%><bean:message key="NAVIGATOR_NEXT" bundle="html"/>
			<%if((pageIdx+1)<getPageCount(log_count)){%></a><%}%>

			<%if((pageIdx+1)<getPageCount(log_count)){%><a href="?page=<%=(getPageCount(log_count)-1)%>&refer=<%=paramRefer%>"><%}%><bean:message key="NAVIGATOR_LAST" bundle="html"/>
			<%if((pageIdx+1)<getPageCount(log_count)){%></a><%}%>
			<bean:message key="NAVIGATOR_PAGES_OVERVIEW" arg0="<%=String.valueOf(pageIdx+1)%>" arg1="<%=String.valueOf(getPageCount(log_count))%>" arg2="<%=String.valueOf(LOG_PER_PAGE)%>" arg3="<%=String.valueOf(log_count)%>" bundle="html"/>
		</SPAN>
		</td>
	</tr>
	<td valign="top" colspan="2">
	
  	<table cellSpacing="1" cellPadding="1" width="100%" align="center" bgColor="#aaaaaa" border="0">
  	<tr bgcolor="#A9C9F3">
  		<!--
    	<th><bean:message key="REFERER_DATE" bundle="html"/></th>
    	-->
    	<th><bean:message key="REFERER_TIME" bundle="html"/></th>
    	<th><bean:message key="REFERER_IP" bundle="html"/></th>
    	<th><bean:message key="REFERER_URL" bundle="html"/></th> 
    	<th><bean:message key="REFERER_REQ_URL" bundle="html"/></th> 
  	</tr>
  	<bean:size id="log_size" name="logs"/>
	<% int i=1; %>
  	<logic:iterate id="log" name="logs">
  	<tr bgcolor="<%=((i%2>0)?"#FFFFFF":"#FFFFDD")%>">
		<% i++; %>
  		<!--
    	<td><bean:write name="log" property="visitDate"/></td>
    	-->
    	<td><bean:write name="log" property="visitTime"/></td>
    	<td><bean:write name="log" property="remoteAddr"/></td>
    	<td>
    		<logic:empty name="log" property="refererURL">
			<font color="#CCCCCC"><bean:message key="REFERER_DIRECT" bundle="html"/></font>
			</logic:empty>
    		<logic:notEmpty name="log" property="refererURL">
    		<a href="<bean:write name="log" property="refererURL"/>" target="_blank">    	
			<%=trimURL(((RefererBean)log).getRefererURL())%>
			</a>
			</logic:notEmpty>
		</td>
    	<td><a href="<bean:write name="log" property="requestURL"/>" target="_blank" title="<bean:write name="log" property="userAgent"/>"><%=trimURL2(((RefererBean)log).getRequestURL())%></a></td>  
  	</tr>
  	</logic:iterate>
    </TABLE>
	</td>
</tr>
</table>
</security:isRoleOf>

<%!
	final static int LOG_PER_PAGE = 40;
	
	int getPageCount(int logCount){
		int nPage = logCount / LOG_PER_PAGE;
		if((logCount%LOG_PER_PAGE)>0)
			nPage++;
		return nPage;
	}
	String trimURL(String url){
		try{
			url = new java.net.URL(url).getHost();
		}catch(Exception e){}
		if(url.length()>33)
			url = url.substring(0,30) + "...";
		return url;
	}
	String trimURL2(String url){
		StringBuffer sURL = new StringBuffer();
		try{
			java.net.URL u = new java.net.URL(url);
			sURL.append(u.getPath().substring(1));
			if(u.getQuery()!=null){
				sURL.append('?');
				sURL.append(u.getQuery());
			}
		}catch(Exception e){
			sURL.append(url);
		}
		if(sURL.length()>33)
			return sURL.substring(0,30) + "...";
		return sURL.toString();
	}
%>