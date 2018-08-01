                        <form action="../user/log.jsp" name="form1" method="post">
                         <input type=hidden name="action" value="login">  
                         <input type=hidden name="nextpage" value="../news/index.jsp">                     
                      <table width="165" border="0" align="center" cellpadding="0" cellspacing="0">    
                          <tr valign="bottom"> 
                            <td height="1" colspan="2">&nbsp;</td>
                          </tr>                                         
<%
      if(session.getAttribute("id") == null || session.getAttribute("id") == "")
       {
         %>                 <tr valign="bottom">          
                            <td width="68" height="15">
                            <div align="center"><font size="2">会员名:</font></div></td>
                            <td width="97" height="15"><strong><font size="2"> 
                              </font></strong> <strong><font size="2"> 
                              <input name="username" type="text" size="10">
                              </font></strong></td>
                          </tr>
                          <tr> 
                            <td height="15"> <div align="center"><font size="2">密　码:</font></div></td>
                            <td height="15"><strong><font size="2"> 
                              <input name="password" type="password" size="10">
                              </font></strong></td>
                          </tr>
                          <tr valign="bottom"> 
                            <td height="15" colspan="2"> <div align="center"><strong>
                            <a href="javascript:judegpwduser()"><img src="images/login1.gif" width="34" height="20" border=0></a>&nbsp; 
                                <a href="../user/register.jsp"><img src="images/reg.gif" width="34" height="20" border=0></a></strong></div></td>
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
         <%
       }
      else
       {
         %>
                
                          <tr> 
                            <td height="28"> <div align="center"><font size="2">用户ID:&nbsp;</font></div></td>
                            <td height="28"><strong><font size="2"> 
                             <%=session.getAttribute("id")%>
                              </font></strong></td>
                          </tr>  
                          <tr> 
                            <td height="28"> <div align="center"><font size="2">用户昵称:&nbsp;</font></div></td>
                            <td height="28"><strong><font size="2"> 
                             <!--%=new String(((String)session.getAttribute("nickname")).getBytes("gb2312"),"ISO8859_1")%--><%=((String)session.getAttribute("nickname"))%>
                              </font></strong></td>
                          </tr> 
                                                                   
                         
         <%
       } 
%>                                   
                        </table>
</form>                        