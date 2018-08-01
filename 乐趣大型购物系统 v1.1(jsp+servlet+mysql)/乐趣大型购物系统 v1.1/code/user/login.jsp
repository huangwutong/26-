<%@ page contentType="text/html;charset=gb2312" %>
<% request.setCharacterEncoding("gb2312"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>欢迎来到乐趣工作室!</title>
</head>
<script language="javascript">
 function judegpwduser()
 {
    if(document.form1.username.value==null||document.form1.username.value=="")
     {
        alert("请输入用户名！");
        document.form1.username.focus();
        return;
     }

    if(document.form1.password.value==null||document.form1.password.value=="")
     {
        alert("请输入密码！");
        document.form1.password.focus();
        return;
     }
    document.form1.submit();
 }
</script>
<body leftmargin="0">
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td width="150"><img src="images/logo.gif" width="150" height="42"></td>
          <td width="500"> <div align="center"><img src="images/bannar.gif" width="458" height="60"></div></td>
          <td width="110"><table width="110" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" valign="middle"> <div align="center"><font size="2">设为首页 
                    </font></div></td>
              </tr>
              <tr> 
                <td height="20" valign="middle"> <div align="center"><font size="2">设为首页 
                    </font></div></td>
              </tr>
              <tr> 
                <td height="20" valign="middle"> <div align="center"><font size="2">设为首页 
                    </font></div></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="8"><img src="images/tmtp.gif" width="2" height="2"></td>
  </tr>
  <tr> 
    <td height="22" valign="middle" bgcolor="#FCCB05"> <div align="center"><font size="2">首页 
        | 数码商城 | 笔记本电脑 | 硬件商城 | 办公设备 | 通信产品 | 音像图书 | 鲜花礼品 | 保健品 | 软件游戏 </font></div></td>
  </tr>
  <tr> 
    <td height="17" bgcolor="#FC9803">&nbsp;</td>
  </tr>
  <tr> 
    <td height="10">&nbsp;</td>
  </tr>
  <tr>
    <td height="10" valign="top"> <table width="400" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFCC00" bordercolordark="#FFFFFF">
        <tr>
          <td height="25" bgcolor="#FFCC00"><font size="2">&nbsp;如果你是乐趣商城的注册用户请您直接登录！</font></td>
        </tr>
<form name="form1" action="log.jsp" method="post">  
<input type="hidden" name="nextpage" value="<%=request.getParameter("nextpage")==null?"../myshop/index.jsp":request.getParameter("nextpage")%>">
<input type="hidden" name="nextpar" value="<%=request.getParameter("nextpar")==null?"":request.getParameter("nextpar")%>">
        <tr>
          <td height="120">
<table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr valign="bottom"> 
                <td width="82" height="29"> <div align="center"><font size="2">用户ID：</font></div></td>
                <td width="165" height="29" valign="bottom"> <font size="2"> 
                  <input name="username" type="text" size="20">
                  </font></td>
                <td width="103" height="29"><font size="2">&nbsp;</font></td>
              </tr>
              <tr> 
                <td width="82" height="35"> <div align="center"><font size="2">密　码：</font></div></td>
                <td width="165" height="35"> <font size="2"> 
                  <input name="password" type="password" size="20">
                  </font></td>
                <td width="103" height="35"><font size="2">（不少于四位）</font></td>
              </tr>
              <tr> 
                <td height="35" colspan="3"><div align="center">
                <a href="javascript:judegpwduser()"><img src="images/login1.gif" width="34" height="20" border="0"></a>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a href="register.jsp"><img src="images/reg.gif" width="34" height="20" border="0"></a> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div></td>
              </tr>
            </table>
          </td>
        </tr>
      </table></td>
  </tr>
  </form>
  <tr>
    <td height="10">&nbsp;</td>
  </tr>
</table>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr bgcolor="#FFCC00"> 
    <td width="760" height="20" bgcolor="#FFCC00"><font size="2">&nbsp;&gt;&gt; 
      合作伙伴</font></td>
  </tr>
  <tr bgcolor="#FFFBEC"> 
    <td height="60"><table width="750" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
          <td><div align="center"><img src="images/2rich.gif" width="88" height="31"></div></td>
        </tr>
        <tr> 
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
          <td><div align="center"></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="10"><hr size="1"></td>
  </tr>
  <tr> 
    <td height="10"><div align="center"><font size="2">公司简介 | 公司简介 | 公司简介 | 公司简介 
        | 公司简介 | 公司简介 | 公司简介 | 公司简介 </font></div></td>
  </tr>
  <tr> 
    <td height="30"> <div align="center"><font size="2">Copyright &copy;乐趣工作室2rich.net 
        客户服务中心信箱：howjoy@howjoy.com </font></div></td>
  </tr>
</table>
</body>
</html>
