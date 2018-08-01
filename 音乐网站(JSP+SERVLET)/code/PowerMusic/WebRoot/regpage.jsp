<%@ page language="java" contentType="text/html;charset=gbk"%>
<jsp:include page="inc/top.jsp"></jsp:include>
<!--顶部结束!-->
<TABLE cellSpacing=0 cellPadding=0 width=770 align=center border=0>
   <TBODY>
     <TR>
		<TD width=3 background=images/bian.gif></TD>
		<TD>
		  <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
				<TR>
				   <TD width=6 background=images/left-shu.gif rowSpan=3></TD>
				   
              <TD background=images/hen.gif height=16></TD>
				   <TD width=6 background=images/right-shu.gif rowSpan=3></TD>
				</TR>
			    <TR>
			       
              <TD height="233"> 
                <TABLE width="100%" height="480" 
					border=0 cellPadding=0 cellSpacing=0 bgColor=#42748d>
                  <TBODY>
                    <TR vAlign=top> 
                      <TD height="40" bgcolor="#3300cc">
									<p>&nbsp;</p>
									<p><a href="index.jsp"><FONT color="#ffffff">动力音乐<FONT color="#000000"
										style="BACKGROUND-COLOR: #ffffff"></FONT></FONT>
										</a></p></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD height="8" bgcolor="#000000"> 
                        <div align="center">
                          <p><font color="#FFFFFF" size="3">注册新用户</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                        <P>&nbsp;</P>
						<SCRIPT Language = "Javascript">
								 //下面的副程序将执行资料检查 
							function isValid()
							{	
								if(regform.username.value == "")
								{	
								  	window.alert("您必须完成帐号的输入!"); 
									regform.username.focus();
								  	return false;
								}
								if(regform.password.value == "")
								{
								  	window.alert("您必须完成密码的输入!");
								  	regform.password.focus();
								  	return false;  //离开函数
								}
								if(regform.confirmpwd.value != regform.password.value)
								{
								  	window.alert("两次输入的密码不一样!");
								  	regform.confirmpwd.focus();
								  	return false;  //离开函数
								}	
								if(!verifyAddress(regform.useremail.value))
								{
									
								　	alert("不是合法的E-Mail 地址，请重新输入！"); 
									regform.useremail.focus();
									return false;
								}
								
								
							 regform.submit(); //送出表单中的资料
							}
								function verifyAddress(obj){ 
							　　　	var email = obj.email.value; 
							　　　	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/; 
							　　　	flag = pattern.test(email); 
							　　　	if(!flag){ 
							　　　
							　　　　return false;} 
							　　} 
							</SCRIPT>			
                        <form name="regform" action="<%=request.getContextPath()%>/Register?action=save" method="post" 
                        	onSubmit="return isValid(this);">
						  <table width="586" height="200" border="0" align="center">
                            <tr>
						<td width="280">用户名</td>
						<TD width="294"><INPUT type="text" name="username"></TD>
						</tr>
						<tr>
						<td>密码</td>
						<TD><INPUT type="password" name="password"></TD>
						</tr>
						<tr>
						<td>确认密码</td>
						<TD><INPUT type="password" name="confirmpwd"></TD>
						</tr>
						<tr>
						<td>E-Mail</td>
						<TD><INPUT type="text" name="useremail"></TD>
						</tr>
						<tr>
						<td>性别</td>
						<TD>
						<SELECT name="usersex">
							<OPTION value=male>男</OPTION>
							<OPTION value=female>女</OPTION>
						</SELECT>
						</TD>
						</tr>
						<tr>
						<td>QQ</td>
						<TD><INPUT type="text" name="userqq"></TD>
						</tr>
						<tr>
						</table>
						  <table align="center">
                            <tr>
						    <td>
							  <input type="submit" value="提交">
							</td>
							<td>
							  <input type="reset" value="重设">
							</td>
						  </tr>
						</table>
                        </form>
                        <P>&nbsp;</P>
					</TD>
                    </TR>
                  </TBODY>
                </TABLE>
					</TD>
				</TR>
				
            <TR> 
              <TD background=images/middle-shu.gif height=60>
              </TD>
			</TR>
			</TBODY>
		 </TABLE>
	  </TD>
		<TD width=3 background=images/bian3.gif></TD>
	</TR>
   </TBODY>
  </TABLE>
  
<jsp:include page="inc/footer.jsp"></jsp:include>


  