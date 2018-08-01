<%@ page contentType="text/html;charset=gb2312" %>
<% request.setCharacterEncoding("gb2312"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>欢迎来到乐趣工作室!</title>
<SCRIPT language=JavaScript src="../js/JsInclude.js"></SCRIPT>
</head>
<script language="javascript">
function sub()
 {
      if(document.form1.id.value=="")
       {
           alert("请输入用户ID！");
           document.form1.id.focus();
           return;
       }
      if(document.form1.nickname.value=="")
       {
           alert("请输入昵称！");
           document.form1.nickname.focus();
           return;
       }       
     if(document.form1.pwd.value=="")
       {
           alert("请输入密码！");
           document.form1.pwd.focus();
           return;
       }              
      if(document.form1.pwd.value!=document.form1.configpwd.value)
       {
           alert("输入的用户密码和密码确认不一致，请重新输入！");
           document.form1.pwd.focus();
           return;
       }                     

      if(document.form1.email.value=="")
       {
           alert("请输入您的电子邮箱！");
           document.form1.email.focus();
           return;
       } 
      
      if(!isEmail(document.form1.email.value))                     
       {
           alert("电子邮箱格式不正确！");
           document.form1.email.focus();
           return;       
       }
              
       
      if(document.form1.year.value=="")
       {
         alert("请输入出生年月！");
         document.form1.year.focus();
         return;
       }  
       
      if(!isInteger(document.form1.year.value))
       {
         alert("出生年月日只能是数字！");
         document.form1.year.focus();
         return;
       }        
    document.form1.birthday.value=document.form1.year.value+"-" +document.form1.month.value+"="+document.form1.days.value;
    document.form1.action="reg.jsp";
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
    <td height="5">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" valign="top"><font size="2">※您现在的位置：首页--》用户注册 </font></td>
  </tr>
<form name="form1" method="post">   
<input type="hidden" name="birthday">   
  <tr> 
    <td height="10" valign="top"><table width="760" border="1" cellpadding="0" cellspacing="0" bordercolor="#CD9501" bordercolordark="#FFFFFF">
        <tr> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30">
<div align="center"><font size="2">用户ID:</font></div></td>
          <td width="240" height="30"><font size="2"> &nbsp; 
            <input type="text" name="id">
            </font></td>
          <td width="220" height="30"><div align="center"><font size="2">只能是&quot;数字&quot;、&quot;字母&quot;和下划线&quot;_&quot;</font></div></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
        </tr>
        <tr bgcolor="#FFFBEC"> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30"> 
            <div align="center"><font size="2">昵称:</font></div></td>
          <td width="240" height="30"><font size="2"> &nbsp; 
            <input type="text" name="nickname">
            </font></td>
          <td width="220" height="30"><font size="2">&nbsp;</font></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
        </tr>
        <tr> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30">
<div align="center"><font size="2">用户密码:</font></div></td>
          <td width="240" height="30"><font size="2"> &nbsp; 
            <input type="password" name="pwd">
            </font></td>
          <td width="220" height="30"><font size="2">&nbsp;</font></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
        </tr>
        <tr bgcolor="#FFFBEC"> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30"> 
            <div align="center"><font size="2">密码确认:</font></div></td>
          <td width="240" height="30"><font size="2">&nbsp; 
            <input type="password" name="configpwd">
            </font></td>
          <td width="220" height="30"><font size="2">&nbsp;</font></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
        </tr>
        <tr> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30">
<div align="center"><font size="2">邮件地址:</font></div></td>
          <td width="240" height="30"><font size="2"> &nbsp; 
            <input type="text" name="email">
            </font></td>
          <td width="220" height="30"><font size="2">&nbsp;</font></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
        </tr>
        <tr bgcolor="#FFFBEC"> 
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
          <td width="120" height="30"> 
            <div align="center"><font size="2">出生年月日:</font></div></td>
          <td width="240" height="30"><font size="2">&nbsp; 
            <input name="year" type="text" size="4">
            年 
            <select name="month">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
              <option>7</option>
              <option>8</option>
              <option>9</option>
              <option>10</option>
              <option>11</option>
              <option>12</option>
            </select>
            月 
            <select name="days">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
              <option>7</option>
              <option>8</option>
              <option>9</option>
              <option>10</option>
              <option>11</option>
              <option>12</option>
              <option>13</option>
              <option>14</option>
              <option>15</option>
              <option>16</option>
              <option>17</option>
              <option>18</option>
              <option>19</option>
              <option>20</option>
              <option>21</option>
              <option>22</option>
              <option>23</option>
              <option>24</option>
              <option>25</option>
              <option>26</option>
              <option>27</option>
              <option>28</option>
              <option>29</option>
              <option>30</option>
              <option>31</option>
            </select>
            日 </font> </td>
          <td width="220" height="30"> 
            <div align="center"><font size="2"> 
              <input type="button" name="Submit" onclick="sub()" value="提交">
              </font></div></td>
          <td width="80" height="30"><font size="2">&nbsp;</font></td>
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
