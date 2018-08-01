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
<%@ page import="dlog4j.SiteStatManager" %>
<%@ page import="dlog4j.formbean.*, dlog4j.beans.*" %>
<%@ page import="java.util.*, java.text.*" %>

<dlog:getsite id="site"/>

<bean:parameter id="year" name="year" value="-1"/>
<bean:parameter id="month" name="month" value="-1"/>

<script language="javascript">
	document.title += ' [<bean:message key="ADMIN_STAT_TITLE" bundle="html"/>]';
</script>
<jsp:include page="mgr/admin_nav_bar.jsp" flush="true">
	<jsp:param name="sel" value="5"/>
</jsp:include>
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="OuterTable">
	<tr>
		<td class="OuterHead">
			<table width="100%"  border="0" cellspacing="0" cellpadding="1">
			<tr>
				<td nowrap="nowrap" style="text-align:left">
					<span id="ItemTitle"><font face="webdings">8</font> <b><bean:message key="STAT_HEAD" bundle="html"/></b></span>
				</td>
			</tr>
			</table>
		</td>
    </tr>
	<tr>
		<td>
			<table width="100%"  border="0" cellpadding="0" cellspacing="1" class="InnerTable">
			<tr>
				<td class="InnerHead" width="15%"><bean:message key="STAT_SITE_NAME" bundle="html"/></td>
				<td class="InnerMain" width="35%" style="padding-left:5pt;"><bean:write name="site" property="displayName"/></td>
				<td class="InnerHead" width="15%"><bean:message key="STAT_SITE_URL" bundle="html"/></td>
				<td class="InnerMain"  width="35%"style="padding-left:5pt;"><bean:write name="site" property="url"/></td>
			</tr>			
			<tr>
				<td class="InnerHead" width="15%"><bean:message key="STAT_SITE_CREATETIME" bundle="html"/></td>
				<td class="InnerMain" width="35%" style="padding-left:5pt;"><bean:write name="site" property="createTime" format="yyyy-MM-dd"/></td>
				<td class="InnerHead" width="15%"><bean:message key="EDITSITE_DESC" bundle="html"/></td>
				<td class="InnerMain" width="35%" style="padding-left:5pt;"><bean:write name="site" property="detail"/></td>
			</tr>
			<%
				int[] userCounts = SiteStatManager.statUsers();
			%>
			<tr>
				<td class="InnerHead" width="15%"><bean:message key="STAT_USER_COUNT" bundle="html"/></td>
				<td class="InnerMain" width="35%" style="padding-left:5pt;"><bean:message key="STAT_USER" arg0="<%=String.valueOf(userCounts[0])%>" bundle="html"/></td>
				<td class="InnerHead" width="15%"><bean:message key="STAT_USER_COUNT_TODAY" bundle="html"/></td>
				<td class="InnerMain" width="35%" style="padding-left:5pt;"><bean:message key="STAT_USER" arg0="<%=String.valueOf(userCounts[1])%>" bundle="html"/></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<table width="100%"  border="0" cellpadding="0" cellspacing="1" class="InnerTable">
			<tr>
				<td class="InnerHead" colspan="2"><b><bean:message key="STAT_VISIT" bundle="html"/></b></td>
				<td class="InnerHead" colspan="2"><b><bean:message key="STAT_LOG_COMMENT" bundle="html"/></b></td>
			</tr>
			<%
				int totalVisit = SiteStatManager.statTotalVisit(0,-1);
				int userVisit = SiteStatManager.statUserVisit(0,-1);
			%>
			<tr>
				<td class="InnerHead" width="15%"><font color="red"><b><bean:message key="STAT_VISIT_TOTAL" bundle="html"/></b></font></td>
				<td class="InnerMain" width="35%" style="padding-left:5pt;"><font color="red"><b><bean:message key="STAT_VISIT_FORMAT" arg0="<%=String.valueOf(userVisit)%>" arg1="<%=String.valueOf(totalVisit)%>" bundle="html"/></b></font></td>
				<td class="InnerHead" width="15%"><bean:message key="STAT_VISIT_TOTAL" bundle="html"/></td>
				<td class="InnerMain" width="35%" style="padding-left:5pt;"><bean:message key="STAT_LOG_REPLY_FORMAT" arg0="<%=String.valueOf(SiteStatManager.statLogs(0,-1))%>" arg1="<%=String.valueOf(SiteStatManager.statReplies(0,-1))%>" bundle="html"/></td>
			</tr>
			<%
				LogForm log = SiteStatManager.getFirstLog();
				if(log!=null)	
					pageContext.setAttribute("firstLog",log);	
				long log_dayc = 0;
				if(log!=null)
					log_dayc = (new Date().getTime()- log.getLogTime().getTime())/(24*60*60*1000) + 1;
					
				RefererBean visit = SiteStatManager.getFirstVisit();	
				pageContext.setAttribute("firstVisit",visit);	
				long visit_dayc = -1;
				if(visit!=null){
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					Date firstD = sdf.parse(visit.getVisitDate()+visit.getVisitTime());
					visit_dayc = (new Date().getTime()- firstD.getTime())/(24*60*60*1000) + 1;
				}
			%>
			<tr>
				<td class="InnerHead"><bean:message key="STAT_BEGIN_DATE" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;"><%if(visit!=null){%><bean:write name="firstVisit" property="visitDate"/><%}%></td>
				<td class="InnerHead"><bean:message key="STAT_BEGIN_DATE" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;"><%if(log!=null){%><bean:write name="firstLog" property="logTime" format="yyyy-MM-dd"/><%}%></td>
			</tr>
			<tr>
				<td class="InnerHead"><bean:message key="STAT_DAYS" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;"><bean:message key="STAT_DAYS_FORMAT" arg0="<%=String.valueOf(visit_dayc)%>" bundle="html"/></td>
				<td class="InnerHead"><bean:message key="STAT_DAYS" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;"><bean:message key="STAT_DAYS_FORMAT" arg0="<%=String.valueOf(log_dayc)%>" bundle="html"/></td>
			</tr>
			<tr>
				<td class="InnerHead"><bean:message key="STAT_AVG" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;">
					<bean:message key="STAT_AVG_FORMAT" arg0="<%=String.valueOf(userVisit/visit_dayc)%>" arg1="<%=String.valueOf(totalVisit/visit_dayc)%>" bundle="html"/>
				</td>
				<td class="InnerHead">&nbsp;</td>
				<td class="InnerMain" style="padding-left:5pt;">&nbsp;</td>
			</tr>
			<%
				String[] values = SiteStatManager.maxVisit();
			%>
			<tr>
				<td class="InnerHead"><bean:message key="STAT_HIGH" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;"><bean:message key="STAT_HIGH_FORMAT" arg0="<%=values[0]%>" arg1="<%=values[1]%>" bundle="html"/></td>
				<td class="InnerHead">&nbsp;</td>
				<td class="InnerMain" style="padding-left:5pt;">&nbsp;</td>
			</tr>
			<tr>
				<td class="InnerHead"><bean:message key="STAT_YESTERDAY_FLOW" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;">
					<bean:message key="STAT_VISIT_FORMAT" arg0="<%=String.valueOf(SiteStatManager.statUserVisit(-1,Calendar.DATE))%>" arg1="<%=String.valueOf(SiteStatManager.statTotalVisit(-1,Calendar.DATE))%>" bundle="html"/>
				</td>
				<td class="InnerHead"><bean:message key="STAT_YESTERDAY" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;">
					<bean:message key="STAT_LOG_REPLY_FORMAT" arg0="<%=String.valueOf(SiteStatManager.statLogs(-1,Calendar.DATE))%>" arg1="<%=String.valueOf(SiteStatManager.statReplies(0,Calendar.DATE))%>" bundle="html"/>
				</td>
			</tr>
			<tr>
				<td class="InnerHead"><font color="red"><b><bean:message key="STAT_TODAY_FLOW" bundle="html"/></b></font></td>
				<td class="InnerMain" style="padding-left:5pt;"><font color="red"><b>
					<bean:message key="STAT_VISIT_FORMAT" arg0="<%=String.valueOf(SiteStatManager.statUserVisit(0,Calendar.DATE))%>" arg1="<%=String.valueOf(SiteStatManager.statTotalVisit(0,Calendar.DATE))%>" bundle="html"/>
				</b></font></td>
				<td class="InnerHead"><bean:message key="STAT_TODAY" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;">
					<bean:message key="STAT_LOG_REPLY_FORMAT" arg0="<%=String.valueOf(SiteStatManager.statLogs(0,Calendar.DATE))%>" arg1="<%=String.valueOf(SiteStatManager.statReplies(0,Calendar.DATE))%>" bundle="html"/>
				</td>
			</tr>
			<tr>
				<td class="InnerHead"><bean:message key="STAT_THIS_MONTH_FLOW" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;">
					<bean:message key="STAT_VISIT_FORMAT" arg0="<%=String.valueOf(SiteStatManager.statUserVisit(0,Calendar.MONTH))%>" arg1="<%=String.valueOf(SiteStatManager.statTotalVisit(0,Calendar.MONTH))%>" bundle="html"/>
				</td>
				</td>
				<td class="InnerHead"><bean:message key="STAT_THIS_MONTH" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;">
					<bean:message key="STAT_LOG_REPLY_FORMAT" arg0="<%=String.valueOf(SiteStatManager.statLogs(0,Calendar.MONTH))%>" arg1="<%=String.valueOf(SiteStatManager.statReplies(0,Calendar.MONTH))%>" bundle="html"/>
				</td>
				</td>
			</tr>
			<tr>
				<td class="InnerHead"><bean:message key="STAT_THIS_YEAR_FLOW" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;">
					<bean:message key="STAT_VISIT_FORMAT" arg0="<%=String.valueOf(SiteStatManager.statUserVisit(0,Calendar.YEAR))%>" arg1="<%=String.valueOf(SiteStatManager.statTotalVisit(0,Calendar.YEAR))%>" bundle="html"/>
				</td>
				<td class="InnerHead"><bean:message key="STAT_THIS_YEAR" bundle="html"/></td>
				<td class="InnerMain" style="padding-left:5pt;">
					<bean:message key="STAT_LOG_REPLY_FORMAT" arg0="<%=String.valueOf(SiteStatManager.statLogs(0,Calendar.YEAR))%>" arg1="<%=String.valueOf(SiteStatManager.statReplies(0,Calendar.YEAR))%>" bundle="html"/>
				</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="OuterFoot"></td>
	</tr>
</table>