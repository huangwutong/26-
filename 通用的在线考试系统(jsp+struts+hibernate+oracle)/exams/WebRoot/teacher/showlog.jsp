<%@ page language="java" pageEncoding="GB18030" import="com.xdf.exams.bean.*"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<jsp:include flush="true" page="/teacher/teachertop.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/script/calendar/calendar.js"></script>
<script src="<%=request.getContextPath()%>/script/calendar/showdate.js"></script>
<center>
<img src="../image/ba_goriyo-annai5.gif" width="300" height="30"> 
   <br>
<table width="675" border="0" cellspacing="0" cellpadding="0">
<tr> 
   <td width="675" background="../image/line_banner.gif"><img src="../image2/spacer.gif" width="1" height="2"></td>
</tr>
</table>
<br>
<html:form action="/teacher/log/show" method="post">
��ʼ����:<html:text property="startdate" onclick="fPopUpCalendarDlg(startdate)" size="10" readonly="true"/>&nbsp;&nbsp;&nbsp;
<html:text property="enddate" onclick="fPopUpCalendarDlg(enddate)" size="10" readonly="true"/>&nbsp;&nbsp;&nbsp;
<html:select property="isteacher" >
<html:option value="-1">ȫ��</html:option>
<html:option value="0">ѧ��</html:option>
<html:option value="1">��ʦ</html:option>
</html:select>
<input type="hidden" value="" name="pageno">
&nbsp;&nbsp;&nbsp;
<html:submit value="��ѯ"/>
&nbsp;&nbsp;&nbsp;
<input type="button" value="���" onclick="this.form.startdate.value='';this.form.enddate.value='';this.form.isteacher.selectedIndex=0"/>
</html:form>

<table width="675"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
 <tr bgcolor="94C9E7" align="center">
      <td width="20%">�û���</td>
      <td width="20%">IP��ַ</td>
      <td width="15%">��ʦ/ѧ��</td>
      <td width="15%">�ɹ�/ʧ��</td>
      <td width="30%">��½ʱ��</td>
 </tr>    
    <logic:present name="loglist">
 	<logic:iterate name="loglist" id="q" indexId="a">
 	<tr bgcolor="ffffff" align="center">
      <td>${q.username}</td>
      <td>${q.ip}&nbsp;</td>
      <td>${q.isteacher==0?"<font color=green>ѧ��</font>":"<font color=red>��ʦ</font>"}&nbsp;</td>      
      <td>${q.success==0?"<font color=red>ʧ��</font>":"<font color=green>�ɹ�</font>"}&nbsp;</td>
      <td><bean:write name="q" property="logtime" format="yyyy-MM-dd HH:mm:ss" />&nbsp;</td>
    </tr>
	</logic:iterate>
	</logic:present>
</table><br>
<div align="right" >
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
		document.queryLogForm.pageno.value=t;
		document.queryLogForm.submit();
	}
</script>
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>