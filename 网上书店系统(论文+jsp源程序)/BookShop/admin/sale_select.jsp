<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����״����ѯ</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<jsp:useBean id="time" class="BookShop.MyTime" scope="page"/>
</head>
<body> 
<p>&nbsp;</p> 
<form name="form1" method="post" action="sale_select_save.jsp" onSubmit="return sale_select()"> 
  <table width="392"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
    <caption> 
    <div class="two">����״����ѯ</div> 
    <p></p> 
    </caption> 
    <tr> 
      <td width="85" height="22" align="center" >��ʼʱ�䣺 </td> 
      <td height="22" ><input name="begin" type="text" maxlength="14" value="<%=time.getDay()%>">
      &nbsp;��-��-��</td> 
    </tr> 
    <tr> 
      <td height="22" align="center">��ֹʱ�䣺</td> 
      <td height="22"><input name="end" type="text" maxlength="14" value="<%=time.getDay()%>">
      &nbsp;��-��-��</td> 
    </tr> 
  </table> 
  <p></p> 
  <div align="center"> 
    <input type="submit" name="Submit2" value="��ѯ"> 
&nbsp;&nbsp;&nbsp; 
    <input type="reset" name="Submit" value="����"> 
  </div> 
</form> 
</body>
</html>
