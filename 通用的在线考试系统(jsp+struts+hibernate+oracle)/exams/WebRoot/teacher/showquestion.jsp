<%@ page language="java" pageEncoding="GB18030" import="com.xdf.exams.bean.*"%>

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
<div align="left">
<html:link page="/teacher/subject/show.do">全部科目</html:link>&gt;&gt;
<html:link page="/teacher/subject/showquestion.do?subjectid=${subject.subjectid}">${subject.name}</html:link>&nbsp;总题数:${subject.totalnum}&nbsp;总分数:${subject.totalscore==null?0:subject.totalscore}<br>
</div>
<br>
<table width="675"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
 <tr bgcolor="94C9E7" align="center">
      <td>题号</td>
      <td width="">题目内容</td>
      <td>分数</td>
      <td>类型</td>      
      <td>正确答案</td>
      <td>录入日期</td>
      <td>操&nbsp;&nbsp;&nbsp;作</td>
    </tr>    
    <logic:present name="questionlist">
 	<logic:iterate name="questionlist" id="q" indexId="a">
 	<tr bgcolor="ffffff" align="center">
      <td>${a+(pageutil.pageno-1)*pageutil.pagesize+1}&nbsp;</td>
      <td align="left"><%Question qq = (Question)pageContext.getAttribute("q");
         String qs;
      	if(qq.getContent().length()<30)qs=qq.getContent();
      	else qs = qq.getContent().substring(0,27)+"...";
      	pageContext.setAttribute("qs",qs,pageContext.PAGE_SCOPE);
      %><bean:write name="qs" filter="true"/>&nbsp;</td>
      <td>${q.score}&nbsp;</td>
      <td>${q.qtype==0?"单选题":"多选题"}&nbsp;</td>
      <td>${q.rightanswer}&nbsp;</td>
      <td>${q.sdate}&nbsp;</td>   
      <td><html:link page="/teacher/subject/updatequestion.do?questionid=${q.questionid}&subjectid=${subject.subjectid}">修改</html:link>|<html:link page="/teacher/subject/deletequestion.do?questionid=${q.questionid}&subjectid=${subject.subjectid}" onclick="return window.confirm('将删除试题和相关成绩,是否真要删除这个题目？')">删除</html:link></td>
    </tr>
	</logic:iterate>
	</logic:present>
</table><br>
<div align="right" >
		<html:link page="/teacher/subject/addquestion.do?subjectid=${subject.subjectid}">增加试题</html:link>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<logic:present name="pageutil">
			第${pageutil.pageno}/${pageutil.total}页
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<logic:equal name="pageutil" property="prepageno" value="0">上一页</logic:equal>
			<logic:notEqual name="pageutil" property="prepageno" value="0"><html:link page="/teacher/subject/showquestion.do?subjectid=${subject.subjectid}&pageno=${pageutil.prepageno}">上一页</html:link></logic:notEqual>			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<logic:equal name="pageutil" property="nextpageno" value="0">下一页</logic:equal>
			<logic:notEqual name="pageutil" property="nextpageno" value="0"><html:link page="/teacher/subject/showquestion.do?subjectid=${subject.subjectid}&pageno=${pageutil.nextpageno}">下一页</html:link></logic:notEqual>			
			&nbsp;&nbsp;
		</logic:present>
</div>
</center>
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>