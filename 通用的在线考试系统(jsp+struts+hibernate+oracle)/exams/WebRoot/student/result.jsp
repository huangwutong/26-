<%@ page language="java" pageEncoding="GB18030"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<jsp:include flush="true" page="/student/studenttop.jsp"></jsp:include>
<br>
<center>
<img src="../image2/ba_goriyo-annai4.gif" width="300" height="30"> 
   <br>
<table width="675" border="0" cellspacing="0" cellpadding="0">
<tr> 
   <td width="675" background="../image2/line_banner.gif"><img src="../image2/spacer.gif" width="1" height="2"></td>
</tr>
</table><br>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${message}&nbsp;</font><br>
<table width="500"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
 <tr bgcolor="94C9E7" align="center">
 	  <td>科目ID</td>
      <td>科目名称</td>
      <td>总分数</td>
      <td>所得分数</td>
      <td>考试日期</td>
      <td>详细情况</td>
    </tr>    
    <logic:present name="resultlist">
 	<logic:iterate name="resultlist" id="s">
 	<tr bgcolor="ffffff" align="center">
  	  <td>${s.subject.subjectid}&nbsp;</td>
      <td>${s.subject.name}&nbsp;</td>
      <td>${s.subject.totalscore}&nbsp;</td>  
      <td>${s.score}&nbsp;</td>  
      <td><bean:write name="s" property="starttime" format="yyyy-MM-dd"/> &nbsp;</td>  
      <td><html:link page="/student/result/detail.do?resultid=${s.resultid}">详细情况</html:link></td>
    </tr>
	</logic:iterate>
	</logic:present>
</table></center>  
<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>