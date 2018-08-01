<%@ page language="java" pageEncoding="GB18030"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<jsp:include flush="true" page="/teacher/teachertop.jsp"></jsp:include>
<center>
<img src="../image/ba_goriyo-annai3.gif" width="300" height="30"> 
   <br>
<table width="675" border="0" cellspacing="0" cellpadding="0">
<tr> 
   <td width="675" background="../image/line_banner.gif"><img src="../image2/spacer.gif" width="1" height="2"></td>
</tr>
</table><br>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${message}&nbsp;</font>
<br>
<table width="675"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
 <tr bgcolor="94C9E7" align="center">
      <td>ID号</td>
      <td>科目名称</td>
      <td>时间</td>
      <td>状态</td>      
      <td>创建日期</td>
      <td>总题数</td>
      <td>总分数</td>
      <td>维&nbsp;&nbsp;&nbsp;&nbsp;护</td>
      <td>操&nbsp;&nbsp;&nbsp;&nbsp;作</td>
    </tr>    
    <logic:present name="subjectlist">
 	<logic:iterate name="subjectlist" id="s">
 	<tr bgcolor="ffffff" align="center">
      <td>${s.subjectid}&nbsp;</td>
      <td>${s.name}&nbsp;</td>
      <td>${s.time}&nbsp;</td>
      <td>${s.state==1?"<font color=green>开放</font>":"<font color=red>关闭</font>"}&nbsp;</td>
      <td>${s.sdate}&nbsp;</td>
      <td>${s.totalnum}&nbsp;</td>
      <td>${s.totalscore==null?0:s.totalscore}&nbsp;</td>      
      <td><html:link page="/teacher/subject/showquestion.do?subjectid=${s.subjectid}">增删改题目</html:link></td>
      <td><html:link page="/teacher/subject/update.do?subjectid=${s.subjectid}">修改</html:link>|<html:link page="/teacher/subject/delete.do?subjectid=${s.subjectid}" onclick="return window.confirm('删除科目将删除其中试题和相关成绩,是否真要删除这个科目？')">删除</html:link></td>
    </tr>
	</logic:iterate>
	</logic:present>
    
</table>  	<br>
<div align="right" >
		<html:link page="/teacher/subject/add.do">增加科目</html:link>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<logic:present name="pageutil">
			第${pageutil.pageno}/${pageutil.total}页
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<logic:equal name="pageutil" property="prepageno" value="0">上一页</logic:equal>
			<logic:notEqual name="pageutil" property="prepageno" value="0"><a href="javascript:ggo(${pageutil.prepageno})">上一页</a></logic:notEqual>			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<logic:equal name="pageutil" property="nextpageno" value="0">下一页</logic:equal>
			<logic:notEqual name="pageutil" property="nextpageno" value="0"><a href="javascript:ggo(${pageutil.nextpageno})">下一页</a></logic:notEqual>			
			&nbsp;&nbsp;
		</logic:present>
</div>
</center>
<script>
	function ggo(t){
		document.queryStudentForm.pageno.value=t;
		document.queryStudentForm.submit();
	}
</script>
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>