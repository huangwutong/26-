<%@ page language="java" pageEncoding="GB18030"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<jsp:include flush="true" page="/student/studenttop.jsp"></jsp:include>
<br>
<center>
<img src="../image2/ba_goriyo-annai3.gif" width="300" height="30"> 
   <br>
<table width="675" border="0" cellspacing="0" cellpadding="0">
<tr> 
   <td width="675" background="../image2/line_banner.gif"><img src="../image2/spacer.gif" width="1" height="2"></td>
</tr>
</table><br>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${message}&nbsp;</font><br>
<table width="400"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
 <tr bgcolor="94C9E7" align="center">
      <td>ID号</td>
      <td>科目名称</td>
      <td>时间</td>
      <td>创建日期</td>
      <td>总题数</td>
      <td>总分数</td>
      <td>开始考试</td>
    </tr>    
    <logic:present name="subjectlist">
 	<logic:iterate name="subjectlist" id="s">
 	<tr bgcolor="ffffff" align="center">
      <td>${s.subjectid}&nbsp;</td>
      <td>${s.name}&nbsp;</td>
      <td>${s.time}&nbsp;</td>
      <td>${s.sdate}&nbsp;</td>
      <td>${s.totalnum}&nbsp;</td>
      <td>${s.totalscore==null?0:s.totalscore}&nbsp;</td>      
      <td><html:link page="/student/exam/exampre.do?subjectid=${s.subjectid}" onclick="return window.confirm('是否参加《${s.name}》考试？')">参加考试</html:link></td>
    </tr>
	</logic:iterate>
	</logic:present>
</table></center>  
<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>