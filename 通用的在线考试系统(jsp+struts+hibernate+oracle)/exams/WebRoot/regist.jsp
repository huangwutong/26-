<%@ page language="java" pageEncoding="GB18030"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<html>
<head>
<title>����ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link type="text/css" href="<%=request.getContextPath()%>/style.css" rel="stylesheet"  />
<html:base/>
<script>
	function checkstudentform(sf){
		var message = "";
		var i = 1;
		if(!isUsername(sf.username.value)){
			message += i+") �û���ֻ������6-30����ĸ�����֡��»���\n";
			i++;
		}
		if(!isUsername(sf.oldpassword.value)){
			message += i+") ����ֻ������6-30����ĸ�����֡��»���\n";
			i++;
		}
		if(sf.oldpassword.value!=sf.newpassword.value){
			message += i+") �������벻һ��\n";
			i++;
		}
		if(sf.name.value==""||sf.name.value.length>15){
			message += i+") ��������Ϊ����С��15��\n";
			i++;
		}
		if(sf.address.value==""||sf.address.value.length>20){
			message += i+") ��ַ����Ϊ����С��20��\n";
			i++;
		}
		if(sf.email.value==""||sf.email.value.length>40){
			message += i+") Email����Ϊ����С��40��ĸ\n";
			i++;
		}			
		if(message!=""){
			alert(message);
			return false;
		}else{
			return true;
		}
											
	}
	//У���û�����ֻ������6-20����ĸ�����֡��»���
	function isUsername(s){
		var patrn=/^(\w){6,30}$/;
		if (!patrn.exec(s)) 
			return false;
		return true;
	}	
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" text="#666666" link="#336699" vlink="#cc6699" alink="#ffcc33" >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td background="image2/bg_top.jpg"><img src="image2/spacer.gif" width="1" height="25"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="image2/spacer.gif" width="10" height="1"></td>
    <td width="510"><img src="image2/obj_sitetitle.gif" width="207" height="29"></td>
    <td>�¶���һ��<br>
      ����������7043��<br>
      TEL 0431-85339455</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td background="image2/obj_bar.gif"><img src="image2/spacer.gif" width="1" height="25"></td>
  </tr>
</table>
  <center>
    <table width="300"  border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#3D7BA3">
&nbsp;&nbsp;&nbsp;&nbsp; <font color="red">${message}&nbsp;</font>
<html:form action="/registdo" method="post" onsubmit="return checkstudentform(this)">
 	<tr>
      <td align="center" bgcolor="94C9E7">�û���</td>
      <td align="left" bgcolor="FFFFFF"><html:text property="username" style="width:100%"/></td>
    </tr>
 	<tr>
      <td align="center" bgcolor="94C9E7">����</td>
      <td align="left" bgcolor="FFFFFF"><html:text property="name"  style="width:100%"/></td>
    </tr>
 	<tr>
      <td align="center" bgcolor="94C9E7">����</td>
      <td align="left" bgcolor="FFFFFF"><html:password property="oldpassword" style="width:100%"  redisplay="false"/></td>
    </tr>
 	<tr>
      <td align="center" bgcolor="94C9E7">����</td>
      <td align="left" bgcolor="FFFFFF"><html:password property="newpassword" style="width:100%"  redisplay="false"/></td>
    </tr>    
 	<tr>
      <td align="center" bgcolor="94C9E7">�Ա�</td>
      <td align="left" bgcolor="FFFFFF"><html:radio property="sex" value="m"/>��&nbsp;
      <html:radio property="sex" value="f"/>Ů&nbsp;</td>
    </tr>      
 	<tr>
      <td align="center" bgcolor="94C9E7">��ַ</td>
      <td align="left" bgcolor="FFFFFF"><html:text property="address" style="width:100%"/></td>
    </tr>    
 	<tr>
      <td align="center" bgcolor="94C9E7">email</td>
      <td align="left" bgcolor="FFFFFF"><html:text property="email" style="width:100%"/></td>
    </tr>   
 	<tr>
      <td align="right" colspan="2" bgcolor="FFFFFF"><input type="button" value="����" onclick="window.location.href='<%=request.getContextPath()%>/'"/>&nbsp;&nbsp;&nbsp;&nbsp;<html:reset value="����"/>&nbsp;&nbsp;&nbsp;&nbsp;<html:submit value="�ύ"/>&nbsp;&nbsp;&nbsp;</td>
    </tr>      
</html:form>   
          	
</table></center>
<script>
if(!document.studentForm.sex[0].checked&&!document.studentForm.sex[1].checked){
	document.studentForm.sex[0].checked = true;
}
</script>
  </body>
</html>
