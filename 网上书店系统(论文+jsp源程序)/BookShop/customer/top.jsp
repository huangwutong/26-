<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error/error.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>主页</title>
<jsp:useBean id="books" class="BookShop.MyDb" scope="page"/><link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<script language="javascript" src="../css/bs.js"></script>
<body topmargin="0" > 
<table border="0" align="center" cellspacing="0"> 
  <tr> 
    <td height="27" >&nbsp;</td> 
    <td height="27" onMouseOut="hidd()">&nbsp;</td>
    <td height="27" colspan="3" >&nbsp;</td>
    <td height="27" onMouseOut="hidd1()">&nbsp;</td>
    <td height="27">&nbsp;</td>
  </tr>
  <tr align="center" valign="middle">
    <td width="125" height="22" valign="bottom" onMouseOut="hidd()"><a href="../index.htm" target="_parent">首页</a></td>
    <td width="125" height="22" valign="bottom"><a href="#" onMouseOver="show()">图书查询</a></td>
    <td width="125" height="22" valign="bottom" onMouseOut="hidd()" ><a href="active.jsp" target="mainFrame">推荐图书</a></td>
    <td width="125" height="22" valign="bottom" ><a href="hotdeal.jsp" target="mainFrame">热点图书</a></td>
    <td width="125" height="22" valign="bottom" onMouseOut="hidd1()"><a href="../shop/trade.jsp?action=''" target="mainFrame">查看购物车</a></td>
    <td width="125" height="22" valign="bottom" ><a href="#" onMouseOver="show1()">读者反馈</a></td>
    <td width="125" height="22" valign="bottom" onMouseOut="hidd1()"><a href="../user/login.jsp" class="notice" target="_parent" >会员登录</a></td>
  </tr>
  <tr align="center" valign="top"> 
    <td height="22" colspan="3" align="center" valign="middle">
	<div id="div" class="hidd"onMouseOver="show()" onMouseOut="hidd()" >
	<a href="books_select.jsp" target="mainFrame" style="font:14">字段查询</a>| 
	<a href="disselect.jsp" target="mainFrame" style="font:14">分类查询</a>| 
	<a href="indselect.jsp?select" target="mainFrame" style="font:14">索引查询</a>
	</div></td> 
    <td align="center" valign="top">&nbsp;</td> 
    <td colspan="3" align="center" valign="top">
	<div id="div1" class="hidd" onMouseOver="show1()" onMouseOut="hidd1()">
	<a href="../read/reader.jsp" class="notice" target="mainFrame" style="font:14">图书评比</a>| 
	<a href="../read/vouch.jsp" class="notice" target="mainFrame" style="font:14">读者推荐</a>
	</div>
	</td>
  </tr> 
</table> 
<hr color="#CCCCCC"> 
</body>
</html>
