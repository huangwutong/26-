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
<html:link page="/teacher/subject/show.do">ȫ����Ŀ</html:link>&gt;&gt;
<html:link page="/teacher/subject/showquestion.do?subjectid=${subject.subjectid}">${subject.name}</html:link>&nbsp;������:${subject.totalnum}&nbsp;�ܷ���:${subject.totalscore==null?0:subject.totalscore}<br>
</div>
<br>
<table width="675"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
 <tr bgcolor="94C9E7" align="center">
      <td>���</td>
      <td width="">��Ŀ����</td>
      <td>����</td>
      <td>����</td>      
      <td>��ȷ��</td>
      <td>¼������</td>
      <td>��&nbsp;&nbsp;&nbsp;��</td>
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
      <td>${q.qtype==0?"��ѡ��":"��ѡ��"}&nbsp;</td>
      <td>${q.rightanswer}&nbsp;</td>
      <td>${q.sdate}&nbsp;</td>   
      <td><html:link page="/teacher/subject/updatequestion.do?questionid=${q.questionid}&subjectid=${subject.subjectid}">�޸�</html:link>|<html:link page="/teacher/subject/deletequestion.do?questionid=${q.questionid}&subjectid=${subject.subjectid}" onclick="return window.confirm('��ɾ���������سɼ�,�Ƿ���Ҫɾ�������Ŀ��')">ɾ��</html:link></td>
    </tr>
	</logic:iterate>
	</logic:present>
</table><br>
<div align="right" >
		<html:link page="/teacher/subject/addquestion.do?subjectid=${subject.subjectid}">��������</html:link>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<logic:present name="pageutil">
			��${pageutil.pageno}/${pageutil.total}ҳ
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<logic:equal name="pageutil" property="prepageno" value="0">��һҳ</logic:equal>
			<logic:notEqual name="pageutil" property="prepageno" value="0"><html:link page="/teacher/subject/showquestion.do?subjectid=${subject.subjectid}&pageno=${pageutil.prepageno}">��һҳ</html:link></logic:notEqual>			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<logic:equal name="pageutil" property="nextpageno" value="0">��һҳ</logic:equal>
			<logic:notEqual name="pageutil" property="nextpageno" value="0"><html:link page="/teacher/subject/showquestion.do?subjectid=${subject.subjectid}&pageno=${pageutil.nextpageno}">��һҳ</html:link></logic:notEqual>			
			&nbsp;&nbsp;
		</logic:present>
</div>
</center>
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>