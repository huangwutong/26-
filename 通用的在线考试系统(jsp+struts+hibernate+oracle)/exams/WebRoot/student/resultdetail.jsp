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
<logic:present name="result">
<table width="400"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
 <tr  align="center">
 	  <td bgcolor="94C9E7">姓名</td>
 	  <td bgcolor="ffffff" align="left">${result.student.name}&nbsp;</td>
 </tr> 
 <tr  align="center">
 	  <td bgcolor="94C9E7">科目编号</td>
 	  <td bgcolor="ffffff" align="left">${result.subject.subjectid}&nbsp;</td>
 </tr> 
 <tr  align="center">
 	  <td bgcolor="94C9E7">科目名称</td>
 	  <td bgcolor="ffffff" align="left">${result.subject.name}&nbsp;</td>
 </tr> 
 <tr  align="center">
 	  <td bgcolor="94C9E7">题数</td>
 	  <td bgcolor="ffffff" align="left">${result.subject.totalnum}&nbsp;</td>
 </tr> 
 <tr  align="center">
 	  <td bgcolor="94C9E7">总时间</td>
 	  <td bgcolor="ffffff" align="left">${result.subject.time}&nbsp;</td>
 </tr> 
 <tr  align="center">
 	  <td bgcolor="94C9E7">总分</td>
 	  <td bgcolor="ffffff" align="left">${result.subject.totalscore}&nbsp;</td>
 </tr> 
 <tr  align="center">
 	  <td bgcolor="94C9E7">考试时间</td>
 	  <td bgcolor="ffffff" align="left"><bean:write name="result" property="starttime" format="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
 </tr> 
 <tr  align="center">
 	  <td bgcolor="94C9E7">交卷时间</td>
 	  <td bgcolor="ffffff" align="left"><bean:write name="result" property="endtime" format="yyyy-MM-dd HH:mm:ss"/>&nbsp;</td>
 </tr> 
 <tr  align="center">
 	  <td bgcolor="94C9E7">得分</td>
 	  <td bgcolor="ffffff" align="left">${result.score}&nbsp;</td>
 </tr>  
 </table>
 </logic:present>
 <br>
 <input type="button" value="返回" onclick="window.location.href='<html:rewrite page="/student/result/list.do"/>'">
 </center>  
<jsp:include flush="true" page="/student/studentbottom.jsp"></jsp:include>