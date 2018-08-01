<%@ page contentType="text/html; charset=gb2312" errorPage="../error/error.jsp" %>
<%@ include file="../head/out.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>图书查询</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
</head>
<body> 
<p>&nbsp;</p> 
<form name="form1" method="post" action="books_select_save.jsp" > 
  <table width="392"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
    <caption> 
    <div class="two">图书查询</div> 
    <p></p> 
    </caption> 
    <tr> 
      <td width="85" height="22" align="center" >图书编号： </td> 
      <td height="22" ><input name="idbook" type="text" maxlength="14"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">图书名称：</td> 
      <td height="22"><input name="bookname" type="text" maxlength="40"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">图书类别：</td> 
      <td height="22"><input name="category" type="text" maxlength="20"></td>
    </tr> 
    <tr> 
      <td height="22" align="center">供 应 商：</td> 
      <td height="22"><input name="supplier" type="text"  maxlength="20"></td>
    </tr><tr> 
      <td height="22" align="center">作&nbsp;&nbsp;&nbsp;&nbsp;者：</td> 
      <td height="22"><input name="author" type="text" maxlength="20"></td> 
      </tr> 
    <tr> 
      <td height="22" align="center">发&nbsp;&nbsp;布：</td> 
      <td height="22"><input name="active" type="checkbox"  value="1"></td> 
    </tr> 
    <tr> 
      <td height="22" align="center">热点书： </td> 
      <td height="22"><input name="hotdeal" type="checkbox"  value="1"></td> 
    </tr> 
  </table> 
 <p> <div align="center">不输入查询条件则显示所有信息</div>
  </p> 
  <div align="center"> 
    <input type="submit" name="Submit2" value="查询"> 
&nbsp;&nbsp;&nbsp; 
    <input type="reset" name="Submit" value="重置"> 
  </div> 
</form> 
</body>
</html>
