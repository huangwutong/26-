<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%!//处理中文字符串
  public String codeString(String s){
		String str=s;
		try{
			byte b[]=str.getBytes("ISO-8859-1");
		  str=new String(b);
		  return str;
		}
		catch(Exception e){
		return str;
		}
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>

<body>
<table width="89%" height="394" border="0">
  <tr>
  <%String str=codeString(request.getParameter("content"));%>
  <%=str%>
    <td width="78%" height="329" align="left" valign="top"> <form name="form1" method="post" action="">
        <textarea name="HtmlContext"  cols="60" rows="15" id="HtmlContext"><%=str%></textarea>
      </form></td>
    <td width="22%">&nbsp;</td>
  </tr>
  <tr>
    <td height="59">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
