<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*"  import="jinghua.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>���߲���</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
<style type="text/css">
<!--
.style3 {
	font-size: 18pt;
	font-weight: bold;
}
-->
</style>
</head>

<body>


<br>
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    
    <td rowspan="2"><div align="right"><span class="style3">������ȼ�Ӧ�û������߲���ϵͳ</span><img src="images/onlinetest.gif" width="208" height="72"></div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="780" height="25" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#d3add1">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="720" height="22" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><font color="#9999FF"><font color="#74a8d1"><strong>��½</strong></font></font></td>
  </tr>
</table>
<br>
<TABLE width=400 border=1 align="center"
cellSpacing=1 borderColor=#d3add1 id=AutoNumber2 style="BORDER-COLLAPSE: collapse">

<%// String str=response.encodeUrl("/CheckUser.jsp");
String str="CheckUser.jsp";
%>


<FORM language="JavaScript" name="theForm"
  METHOD="post" ACTION="CheckUser.jsp"
>
    <TBODY>
      <TR>
        <TD borderColor=#d3add1 width="100%"
    background=register.files/admin_bg_1.gif bgColor=#d3add1 height=25> <P align=center><B>&nbsp;<FONT color=#ffffff>�û���½</FONT></B></P></TD>
      </TR>
      <TR>
        <TD borderColor=#d3add1 width="100%" bgColor=#fffde8 height=160><p>&nbsp;</p>

        <p>���������������ݣ�
          <select name="logrole">
            <option value="admin">����Ա</option>
            <option value="teacher">�ϡ�ʦ</option>
            <option value="student">ѧ����</option>
          </select>
        </p>
          <p> �����������ˡ����ţ�
            <INPUT type="text" name="logname" maxLength=30 >
          </p>
          <p> �����������ܡ����룺
            <INPUT type=password name="password" maxLength=30>
          </p>
          
          <div align="center"><BR>
          </div></TD>
      </TR>
      <TR>
        <TD width="100%" height=25 align="center" borderColor=#d3add1 bgColor=#fffde8> 
          <table width="200" border="0">
            <tr>
              <td><input name=B3 type=submit class="tbbuttonl" value="�� ��"></td>
              <td>&nbsp;</td>
              <td><input name=B32 type=button class="tbbuttonl" value="ע���¿���"></td>
            </tr>
          </table></TD>
      </TR>
 </FORM>
</TABLE>
<br>
<%--@ include file="bottom.htm"--%>
<p>&nbsp;</p>

</body>
</html>
