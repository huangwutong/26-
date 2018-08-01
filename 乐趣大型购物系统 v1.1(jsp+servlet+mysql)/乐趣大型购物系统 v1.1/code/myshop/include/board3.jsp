<%
      if(session.getAttribute("id") == null || session.getAttribute("id") == "")
       {
         %>       
<form action="../user/log.jsp" name="form1" method="post">
<input type=hidden name="action" value="login">  
<input type=hidden name="nextpage" value="login">           
        <tr> 
          <td width="150" height="22" background="images/hydl3.jpg"> 
          <div align="center"><font size="2">会员登陆</font></div></td>
        </tr>
        <tr> 
          <td background="images/hydl.jpg"> <div align="center"> 
              <table width="150" border="0" cellspacing="0" cellpadding="0">
                <tr valign="bottom"> 
                  <td width="71" height="28"> <div align="center"><font size="2">会员名:</font></div></td>
                  <td width="79" height="28"><strong><font size="2"> 
                    <input name="username" type="text" size="8">
                    </font></strong></td>
                </tr>
                <tr> 
                  <td height="28"> <div align="center"><font size="2">密　码:</font></div></td>
                  <td height="28"><strong><font size="2"> 
                    <input name="password" type="password" size="8">
                    </font></strong></td>
                </tr>
              </table>
            </div></td>
        </tr>
        <tr> 
          <td height="30" background="images/hydl.jpg"> 
          <div align="center"><strong>
           <a href="javascript:judegpwduser()"><img src="images/login1.gif" width="34" height="20"border=0></a>&nbsp; 
              <a href="../user/register.jsp"><img src="images/reg.gif" width="34" height="20" border=0></a>
              </strong>
              </div>
          </td>
        </tr>
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
        document.form1.username.focus();
        return;
     }
    document.form1.submit();
 }
</script>          
        <tr> 
          <td height="5" background="images/hydl.jpg"> <div align="center"><img src="images/tmtp.gif" width="2" height="2"></div></td>
        </tr>
</form>  
  <%
   }
  else
   {
      %>
        <tr> 
          <td width="150" height="22" background="images/hydl3.jpg"> 
          <div align="center"><font size="2">会员信息：</font></div></td>
        </tr>
        <tr> 
          <td background="images/hydl.jpg"> <div align="center"> 
              <table width="150" border="0" cellspacing="0" cellpadding="0">
                <tr valign="bottom"> 
                  <td width="71" height="28"> <div align="center"><font size="2">会员ID:</font></div></td>
                  <td width="79" height="28"><strong><font size="2"> 
                     <%=session.getAttribute("id")%>
                    </font></strong></td>
                </tr>
                <tr> 
                  <td height="28"> <div align="center"><font size="2">昵    称:</font></div></td>
                  <td height="28"><strong><font size="2"> 
                    <%=((String)session.getAttribute("nickname"))%>
                    </font></strong></td>
                </tr>
              </table>
            </div></td>
        </tr>      
      
      <%
   } 
  %> 