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
开始日期:<html:text property="startdate" onclick="fPopUpCalendarDlg(startdate)" size="10" readonly="true"/>&nbsp;&nbsp;&nbsp;
<html:text property="enddate" onclick="fPopUpCalendarDlg(enddate)" size="10" readonly="true"/>&nbsp;&nbsp;&nbsp;
<html:select property="isteacher" >
<html:option value="-1">全部</html:option>
<html:option value="0">学生</html:option>
<html:option value="1">老师</html:option>
</html:select>
<input type="hidden" value="" name="pageno">
&nbsp;&nbsp;&nbsp;
<html:submit value="查询"/>
&nbsp;&nbsp;&nbsp;
<input type="button" value="清除" onclick="this.form.startdate.value='';this.form.enddate.value='';this.form.isteacher.selectedIndex=0"/>
</html:form>

<table width="675"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
 <tr bgcolor="94C9E7" align="center">
      <td width="20%">用户名</td>
      <td width="20%">IP地址</td>
      <td width="15%">老师/学生</td>
      <td width="15%">成功/失败</td>
      <td width="30%">登陆时间</td>
 </tr>    
    <logic:present name="loglist">
 	<logic:iterate name="loglist" id="q" indexId="a">
 	<tr bgcolor="ffffff" align="center">
      <td>${q.username}</td>
      <td>${q.ip}&nbsp;</td>
      <td>${q.isteacher==0?"<font color=green>学生</font>":"<font color=red>老师</font>"}&nbsp;</td>      
      <td>${q.success==0?"<font color=red>失败</font>":"<font color=green>成功</font>"}&nbsp;</td>
      <td><bean:write name="q" property="logtime" format="yyyy-MM-dd HH:mm:ss" />&nbsp;</td>
    </tr>
	</logic:iterate>
	</logic:present>
</table><br>
<div align="right" >
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
		document.queryLogForm.pageno.value=t;
		document.queryLogForm.submit();
	}
</script>
<jsp:include flush="true" page="/teacher/teacherbottom.jsp"></jsp:include>