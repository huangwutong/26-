<%@ page language="java" contentType="text/html;charset=gbk"%>
<jsp:include page="/inc/top.jsp"></jsp:include>
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
									<p><a href="index.jsp"><FONT color="#ffffff">首页<FONT color="#000000"
										style="BACKGROUND-COLOR: #ffffff"></FONT></FONT>
										</a></p></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD height="8" bgcolor="#000000"> 
                        <div align="center">
                          <p><font color="#FFFFFF" size="3">管理员登陆</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                        <P>&nbsp;</P>
						<form name="adminloggon" action="<%=request.getContextPath()%>/Login?action=adminlogin" method="post">
						  <table width="300" height="10" border="0" align="center">
                            <tr width="200">
						      <td width="30%" align="right">用户名</td>
						<TD width="100"><INPUT type="text" name="adminname"></TD>
						</tr>
						<tr>
						<td width="60%" align="right">密码</td>
						<TD><INPUT type="password" name="adminpassword"></TD>
						</tr>
                            <tr>
						    <td width="60%" align="right">
							  <input type="submit" name="subadmin" value="提交" >
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
  
<jsp:include page="/inc/footer.jsp"></jsp:include>
