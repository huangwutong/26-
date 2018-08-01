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
<table width="675"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
 <tr bgcolor="94C9E7" align="center">
      <td width="20%">题号</td>
      <td width="30%">正确答案</td>
      <td width="30%">所答答案</td>
      <td width="20%">得分</td>
 </tr>    
    <logic:present name="recordlist">
 	<logic:iterate name="recordlist" id="q" indexId="a">
 	<tr bgcolor="ffffff" align="center">
      <td>${a+1}</td>
      <td>${q.question.rightanswer}&nbsp;</td>
   	  <td>${q.answer}&nbsp;</td>
      <td>${q.question.rightanswer==q.answer?q.question.score:0}&nbsp;</td>   	  
    </tr>
	</logic:iterate>
	</logic:present>
</table>
</center>
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>