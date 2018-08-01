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
      <td>ID��</td>
      <td>��Ŀ����</td>
      <td>ʱ��</td>
      <td>״̬</td>      
      <td>��������</td>
      <td>������</td>
      <td>�ܷ���</td>
      <td>ά&nbsp;&nbsp;&nbsp;&nbsp;��</td>
      <td>��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
    </tr>    
    <logic:present name="subjectlist">
 	<logic:iterate name="subjectlist" id="s">
 	<tr bgcolor="ffffff" align="center">
      <td>${s.subjectid}&nbsp;</td>
      <td>${s.name}&nbsp;</td>
      <td>${s.time}&nbsp;</td>
      <td>${s.state==1?"<font color=green>����</font>":"<font color=red>�ر�</font>"}&nbsp;</td>
      <td>${s.sdate}&nbsp;</td>
      <td>${s.totalnum}&nbsp;</td>
      <td>${s.totalscore==null?0:s.totalscore}&nbsp;</td>      
      <td><html:link page="/teacher/subject/showquestion.do?subjectid=${s.subjectid}">��ɾ����Ŀ</html:link></td>
      <td><html:link page="/teacher/subject/update.do?subjectid=${s.subjectid}">�޸�</html:link>|<html:link page="/teacher/subject/delete.do?subjectid=${s.subjectid}" onclick="return window.confirm('ɾ����Ŀ��ɾ�������������سɼ�,�Ƿ���Ҫɾ�������Ŀ��')">ɾ��</html:link></td>
    </tr>
	</logic:iterate>
	</logic:present>
    
</table>  	<br>
<div align="right" >
		<html:link page="/teacher/subject/add.do">���ӿ�Ŀ</html:link>
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
<script>
	function ggo(t){
		document.queryStudentForm.pageno.value=t;
		document.queryStudentForm.submit();
	}
</script>
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>