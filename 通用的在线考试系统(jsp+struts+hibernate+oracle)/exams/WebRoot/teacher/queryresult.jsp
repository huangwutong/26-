<%@ page language="java" pageEncoding="GB18030" import="com.xdf.exams.bean.*"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<jsp:include flush="true" page="/teacher/teachertop.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/script/calendar/calendar.js"></script>
<script src="<%=request.getContextPath()%>/script/calendar/showdate.js"></script>

<center>
<img src="../image/ba_goriyo-annai4.gif" width="300" height="30"> 
   <br>
<table width="675" border="0" cellspacing="0" cellpadding="0">
<tr> 
   <td width="675" background="../image/line_banner.gif"><img src="../image2/spacer.gif" width="1" height="2"></td>
</tr>
</table><br>
<br>
<html:form action="/teacher/result/querydo" method="post">
<table width="300"  border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#3D7BA3">
      <tr>
      	<td align="center" bgcolor="94C9E7">科目</td>
      	<td align="left" bgcolor="ffffff" colspan="2"><html:select property="subjectid">
      		<html:options collection="subjectlist" property="subjectid" labelProperty="name"/>
      	</html:select></td>
      </tr>  
      <tr>
      	<td align="center" bgcolor="94C9E7">用户名</td>
      	<td align="left" bgcolor="ffffff" colspan="2"><html:text property="username"/></td>
      </tr>    
      <tr>
      	<td align="center" bgcolor="94C9E7">姓名</td>
      	<td align="left" bgcolor="ffffff" colspan="2"><html:text property="name" /></td>
      </tr>  
      <tr>
      	<td align="center" bgcolor="94C9E7">开始日期</td> 
      	<td align="left" bgcolor="ffffff" colspan="2"><html:text property="startdate" onclick="fPopUpCalendarDlg(startdate);return false;" readonly="true"/></td>
      </tr>       
      <tr>
      	<td align="center" bgcolor="94C9E7">结束日期</td> 
      	<td align="left" bgcolor="ffffff" colspan="2"><html:text property="enddate" onclick="fPopUpCalendarDlg(enddate);return false;"  readonly="true"/></td>
      </tr>             
</table>  	
<html:submit value="查询" />&nbsp;&nbsp;<html:reset value="重置" />
</html:form>
</center>
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>