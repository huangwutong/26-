<%@ page language="java" pageEncoding="GB18030"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>�¶������߿���ϵͳ</title>
<link type="text/css" href="<%=request.getContextPath()%>/style.css" rel="stylesheet"  />
<html:base/>
</head>

<body marginheight="0" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" text="#666666" >
<div align="center">
<table width="1000" height="481" border="0" cellpadding="0" cellspacing="0" background="image/1.jpg" >
  <tr>
    <td width="33%" height="306">&nbsp;</td>
    <td width="34%">&nbsp;</td>
    <td width="33%">&nbsp;</td>
  </tr>
  <tr>
    <td height="135">&nbsp;</td>
    <td>&nbsp;</td>
	
    <td>
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
     <html:form action="/login" method="post" onsubmit="return checkloginForm(this)">
      <tr>
        <td colspan="2">${message==null?"�������û��������룬ѡ����ݵ�½":message}</td>
      </tr>
      <tr>
        <td width="20%">&nbsp;</td>
        <td width="80%">&nbsp;</td>
      </tr>
      <tr>
        <td>��&nbsp;&nbsp;�ݣ�</td>
        <td>
          <html:radio property="role" value="��" />
          ѧ�� 
          <html:radio property="role" value="��" />
          ��ʦ</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>�û�����</td>
        <td><label>
          <html:text property="username" style="width:120px" />
        </label></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>��&nbsp;&nbsp;�룺</td>
        <td><label>
          <html:password property="password" redisplay="false" style="width:120px"/>
        </label></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input  type="button"  value="ע��" onclick="window.location.href='<%=request.getContextPath()%>/regist.do'"/>
		&nbsp;&nbsp;&nbsp;
		&nbsp;
          <input type="submit"  value="��½" />
        </td>
      </tr>
  </html:form>    
    </table></td>
  </tr>
  <tr>
    <td height="20">&nbsp;</td>
    <td height="20">�����¶�����Ȩ���У�Υ�߱ؾ����绰:0431-85339455</td>
    <td height="20">&nbsp;</td>
  </tr>
</table>
<script>
if(!document.loginForm.role[0].checked&&!document.loginForm.role[1].checked){
	document.loginForm.role[0].checked = true;
}
function checkloginForm(lf){
	if(lf.username.value==""||lf.password.value==""){
		alert("�������û���������!");
		return false;
	}else{
		return true;
	}
}
</script>
</div>
</body>
</html>
