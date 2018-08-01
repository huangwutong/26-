<%@ page language="java" pageEncoding="GB18030" import="com.xdf.exams.bean.*"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<jsp:include flush="true" page="/teacher/teachertop.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/script/calendar/calendar.js"></script>
<script src="<%=request.getContextPath()%>/script/calendar/showdate.js"></script>
<center>
<img src="../image/ba_goriyo-annai6.gif" width="300" height="30"> 
   <br>
<table width="675" border="0" cellspacing="0" cellpadding="0">
<tr> 
   <td width="675" background="../image/line_banner.gif"><img src="../image2/spacer.gif" width="1" height="2"></td>
</tr>
</table><br>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">${message}&nbsp;</font>
<br>
<table width="400"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
 <tr bgcolor="94C9E7" align="center">
      <td width="20%">ID</td>
      <td width="30%">�û���</td>
      <td width="30%">����</td>
      <td width="20%">����</td>      
 </tr>    
    <logic:present name="teacherlist">
 	<logic:iterate name="teacherlist" id="q" indexId="a">
 	<tr bgcolor="ffffff" align="center">
      <td>${q.teacherid}&nbsp;</td>
      <td>${q.username}&nbsp;</td>
      <td>${q.password}&nbsp;</td>
      <td><html:link page="/teacher/admin/update.do?teacherid=${q.teacherid}">�޸�</html:link>|<html:link page="/teacher/admin/delete.do?teacherid=${q.teacherid}" onclick="return window.confirm('�Ƿ�Ҫɾ�������ʦ!')">ɾ��</html:link></td>
    </tr>
	</logic:iterate>
	</logic:present>
</table><br>
<div align="center" >
		<html:link page="/teacher/admin/add.do">���ӽ�ʦ</html:link>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<logic:present name="pageutil">
			��${pageutil.pageno}/${pageutil.total}ҳ
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<logic:equal name="pageutil" property="prepageno" value="0">��һҳ</logic:equal>
			<logic:notEqual name="pageutil" property="prepageno" value="0"><html:link page="/teacher/admin/show.do?pageno=${pageutil.prepageno}">��һҳ</html:link></logic:notEqual>			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<logic:equal name="pageutil" property="nextpageno" value="0">��һҳ</logic:equal>
			<logic:notEqual name="pageutil" property="nextpageno" value="0"><html:link page="/teacher/admin/show.do?pageno=${pageutil.nextpageno}">��һҳ</html:link></logic:notEqual>			
			&nbsp;&nbsp;
		</logic:present>
</div>
</center>
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>