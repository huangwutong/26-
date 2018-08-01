<%@ page language="java" pageEncoding="GB18030" import="com.xdf.exams.bean.*"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<jsp:include flush="true" page="/teacher/teachertop.jsp"></jsp:include>
<center>
<img src="../image/ba_goriyo-annai4.gif" width="300" height="30"> 
   <br>
<table width="675" border="0" cellspacing="0" cellpadding="0">
<tr> 
   <td width="675" background="../image/line_banner.gif"><img src="../image2/spacer.gif" width="1" height="2"></td>
</tr>
</table>
<br>
<table width="675"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
 <tr bgcolor="94C9E7" align="center">
      <td><a href="javascript:goo('resultid')">���</a></td>
      <td><a href="javascript:goo('s.subjectid')">��Ŀ</a></td>
      <td><a href="javascript:goo('st.username')">�û���</a></td>
      <td><a href="javascript:goo('st.name')">����</a></td>
      <td><a href="javascript:goo('starttime')">��������</a></td>
      <td><a href="javascript:goo('score')">���Է���</a></td>
      <td>��ϸ��Ϣ</td>
 </tr>    
    <logic:present name="resultlist">
 	<logic:iterate name="resultlist" id="q" indexId="a">
 	<tr bgcolor="ffffff" align="center">
      <td>${a+(pageutil.pageno-1)*pageutil.pagesize+1}&nbsp;</td>
      <td align="left">${q.subject.name}&nbsp;</td>
      <td>${q.student.username}&nbsp;</td>
      <td>${q.student.name}&nbsp;</td>
      <td><bean:write name="q" property="starttime" format="yyyy-MM-dd" />&nbsp;</td>
      <td>${q.score}&nbsp;</td>   
      <td><html:link page="/teacher/result/showdetail.do?resultid=${q.resultid}">��ϸ��Ϣ</html:link></td>
    </tr>
	</logic:iterate>
	</logic:present>
</table><br>
<div align="right" >
		<html:link page="/teacher/result/query.do">����</html:link>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<logic:present name="pageutil">
			��${pageutil.pageno}/${pageutil.total}ҳ
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<logic:equal name="pageutil" property="prepageno" value="0">��һҳ</logic:equal>
			<logic:notEqual name="pageutil" property="prepageno" value="0"><a href="javascript:ggo(${pageutil.prepageno})">��һҳ</a></logic:notEqual>			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<logic:equal name="pageutil" property="nextpageno" value="0">��һҳ</logic:equal>
			<logic:notEqual name="pageutil" property="nextpageno" value="0"><a href="javascript:ggo(${pageutil.nextpageno})">��һҳ</a></logic:notEqual>			
			&nbsp;&nbsp;
		</logic:present>
</div>
</center>
<html:form action="/teacher/result/querydo" method="post">
<html:hidden property="subjectid"/>
<html:hidden property="username"/>
<html:hidden property="name"/>
<html:hidden property="startdate"/>
<html:hidden property="enddate"/>
<html:hidden property="order"/>
<input type="hidden" value="" name="pageno">
</html:form>
<script>
	function ggo(t){
		document.queryResultForm.pageno.value=t;
		document.queryResultForm.submit();
	}
	function goo(tt){
		document.queryResultForm.order.value=tt;
		document.queryResultForm.submit();
	}

</script>
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>