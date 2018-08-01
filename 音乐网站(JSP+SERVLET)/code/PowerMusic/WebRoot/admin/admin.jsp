<%@ page language="java" contentType="text/html;charset=gbk"%>
<%@ include file="/inc/top.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="model.AdminModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageAdmin"%>
<jsp:useBean id="manageadmin" class="control.bean.ManageAdmin" scope="page"></jsp:useBean>
<jsp:useBean id="amodel" class="model.AdminModel" scope="page"></jsp:useBean>
<%--若不是管理员,重定向到首页 --%>
<%
	String adminname = (String)session.getAttribute("adminname");
	if(adminname==null)
		response.sendRedirect(request.getContextPath()+"/index.jsp");
%>
<%!
	int searchstate = 0;
	int totalpages;
    int countperpage=5; 
    int totalcount;
    int currentpage=0;
    int pagecode = 1;
    Vector adminvector;
%>
<%--计算页数 --%>
<%
 	totalcount = manageadmin.getTotalrow();
  	totalpages = totalcount/countperpage;
  	if(totalpages%countperpage>0||totalcount<countperpage){
   		totalpages+=1;
 	}
 	if(request.getParameter("page")==null){
		currentpage=1;
	}else{
		currentpage=Integer.parseInt(request.getParameter("page"));
		if(currentpage>totalpages)
			currentpage=totalpages;
		if(currentpage<1)
		currentpage=1;
	}//将第n页的提取出来
	adminvector = manageadmin.displayQuery(5,currentpage,"* from AdminInfo order by AdminID","AdminID");
%>
<script language="JavaScript" >
	function page_check()
	{
		if(document.adminpage.page.value=="")
		{
			alert("请输入页数");
			document.adminpage.page.focus();
			return false;
		}
		return true;
	}
</script>
<%--更新管理员资料 --%>
<%
	String update = request.getParameter("action");
	if("update".equals(update)){
		String adminid = request.getParameter("adminid");
		String modadminname = request.getParameter("modadminname");
		String modpassword = request.getParameter("modadminpwd");
		int rowaffect = manageadmin.updateAdmin(adminid,modadminname,modpassword);
		if(rowaffect>0){
		%>
		<script language="JavaScript">
			alert("修改成功");
			window.location = "admin.jsp";
		</script>
<%}else{%>
	<script language="JavaScript">
		alert("修改成功");
		window.location = "admin.jsp";
	</script><%}}%>
<%--搜索,添加管理员 --%>
<%
	String search = request.getParameter("action");
	if("search".equals(search)){
		String searchadminname = request.getParameter("searchadminname");
		adminvector = manageadmin.displayQuery(5,currentpage,"* from AdminInfo where AdminName ='"+searchadminname+"'","AdminName");
		searchstate = 1;
	}
	String addadmin = request.getParameter("action");
	if("add".equals(addadmin)){
		String addadminname = request.getParameter("addadminname");
		String addadminpwd = request.getParameter("addadminpwd");
		int rowaffect = manageadmin.addAdmin(addadminname,addadminpwd);
		if(rowaffect>0){
			%>
			<script language="JavaScript">
				alert("添加管理员成功");
			</script>
<%}else{%><script language="JavaScript">
				alert("添加管理员失败");
			</script>
			<%}}%>
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
                          <p><font color="#FFFFFF" size="3">后台管理--管理员信息</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                      <table width="100" height="245" align="left">
						  <tr>
                            <p></p>
                            <td height="50"><a href="<%=request.getContextPath()%>/Login?action=logout">注销</a></td>
                          </tr>
						  <tr>
                            <td height="50"><a href="<%=request.getContextPath()%>/admin/user.jsp">管理用户</a></td>
                          </tr>
                          <tr>
						  <tr>
                            <td height="50"><a href="<%=request.getContextPath()%>/admin/news.jsp">管理新闻</a></td>
                          </tr>
						  <tr>
                            <td height="50"><a href="music.jsp">管理歌曲</a></td>
                          </tr><tr>
                            <td height="50"><a href="guestbook.jsp">管理留言</a></td>
                          </tr>
                        </table> 
					    <table width="40%" height="23" border="0" align="center">
                          <tr> 
                            <td width="42%"><a href="<%=request.getContextPath()%>/admin/user.jsp">用户管理首页</a></td>
                            <td width="30%"><a href="<%=request.getContextPath()%>/admin/user.jsp?action=common">普通用户</a></td>
                            <td width="28%"><a href="admin.jsp?action=common">管理员</a></td>
                          </tr>
                        </table>
						<!--用户管理首页-->
                        <p></p>
                        <p></p>
                        <%--显示待修改管理员的资料 --%>
     					<%	
     						String modify = request.getParameter("action");
     						int position = 0;
     						if(request.getParameter("adminid")!=null)
     						{
     							position = Integer.parseInt(request.getParameter("position"));
     						}
     						if("modify".equals(modify)){
     							amodel.setAdminid(((AdminModel)adminvector.get(position)).getAdminid());
						    	amodel.setAdminname(((AdminModel)adminvector.get(position)).getAdminname());
						    	amodel.setAdminpwd(((AdminModel)adminvector.get(position)).getAdminpwd());
						    	amodel.setRegtime(((AdminModel)adminvector.get(position)).getRegtime());
     					%><FORM name="upadminform" action="admin.jsp?action=update&adminid=<%=amodel.getAdminid()%>" method="post">
     						<TABLE width="40%" border="0" align=center>
     						<TR>
     						<TD width=24%>管理员</TD>
     						<TD width=76%><input type=text name="modadminname" value="<%=amodel.getAdminname()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%>密码</TD>
     						<TD width=76%><input type=text name="modadminpwd" value="<%=amodel.getAdminpwd()%>"></TD>
     						</TR>
     						<TR>
     						<TD width=24%><input type=submit value="修改"></TD>
     						<TD width=76%><input type=reset></TD>
     						</TR>
     						</TABLE>
     						</FORM>
     					<%}%>
     					<%--管理员信息的管理页面 --%>
                        <%
                        	String action = request.getParameter("action");
                       	    if("common".equals(action)||searchstate==1){
                       	%>
                       	  <table width="550" border="0" cellpadding="3" cellspacing="1" bgcolor="#ffffff">
						  <tr bgcolor="#cccccc">
						  	<td align="center" nowrap width="15%"><b>ID</b></td>
							<td align="center" nowrap width="25%"><b>用户名</b></td>
							<td align="center" nowrap width="25%"><b>密码</b></td>
							<td align="center" nowrap width="35%"><b>注册时间</b></td>
							 <% 
						    for(int i=0;i<adminvector.size();i++){
						    	amodel.setAdminid(((AdminModel)adminvector.get(i)).getAdminid());
						    	amodel.setAdminname(((AdminModel)adminvector.get(i)).getAdminname());
						    	amodel.setAdminpwd(((AdminModel)adminvector.get(i)).getAdminpwd());
						    	amodel.setRegtime(((AdminModel)adminvector.get(i)).getRegtime());
						   %><TR bgcolor="#6600CC">
						        <td align="center" nowrap width="15%"><%=amodel.getAdminid()%></td>
						        <td align="center" nowrap width="25%">
						        <a href="admin.jsp?action=modify&adminid=<%=amodel.getAdminid()%>&position=<%=i%>">
						        <%=amodel.getAdminname()%></a></td>
						        <td align="center" nowrap width="25%"><%=amodel.getAdminpwd()%></td>
						        <td align="center" nowrap width="35%"><%=amodel.getRegtime()%></td>
						   </TR>
						 <%}%>
						   </table>
						<FORM name="adminpage" method="post" onSubmit="return page_check();"action="admin.jsp?action=common">
						<TABLE width="36%">
						<tr>
						<td >共有<%out.print(totalpages);%>页,现在是第<%out.print(currentpage);%>页</td>
						</tr>
						<tr>
						<td>
						<a href="<%=request.getContextPath()%>/admin/admin.jsp?action=common&page=<%=currentpage-1%>">上一页</a>
						<a href="<%=request.getContextPath()%>/admin/admin.jsp?action=common&page=<%=currentpage+1%>">下一页 </a>
						<a href="<%=request.getContextPath()%>/admin/admin.jsp?action=common&page=1">首页 </a>
						<a href="<%=request.getContextPath()%>/admin/admin.jsp?action=common&page=<%=totalpages%>">尾页 </a>
						<input name="page" type="text" size="5">页<input type="submit" name="Submit" value="Go">
						</td>
						</tr>
						</TABLE>
						</FORM>
                       	<%}%>
                       	<TABLE align= center>
                       	  <TR>
                       	    <TD>
		                       	<%--搜索管理员--%>
		                        <FORM action="admin.jsp?action=search" method="post">
		                        <table width="40%" border="0" align="right">
		                        <TR><td colspan=2 align="center">搜索管理员</td>
		                        </TR>
		                          <tr> 
		                            <td width="19%">用户名</td>
		                            <td width="81%"><input type="text" name="searchadminname"></td>
		                          </tr>
		                          <tr> 
		                            <td width=19%><input type="submit" value="提交"></td>
									<td width=81%><input type="reset" ></td>
		                          </tr>
		                        </table>
		                        </FORM>
                       	    </TD>
                       	    <TD>
                       	      <FORM action="admin.jsp?action=add" method="post">
		                        <table width="60%" border="0" align="right">
		                        <TR><td colspan=2 align="center">添加管理员</td>
		                        </TR>
		                          <tr> 
		                            <td width="19%">用户名</td>
		                            <td width="81%"><input type="text" name="addadminname"></td>
		                          </tr>
		                          <tr> 
		                            <td width="19%">密码</td>
		                            <td width="81%"><input type="text" name="addadminpwd"></td>
		                          </tr>
		                          <tr> 
		                            <td width=19%><input type="submit" value="添加"></td>
									<td width=81%><input type="reset" ></td>
		                          </tr>
		                        </table>
		                        </FORM>
                       	    </TD>
                       	  </TR>
                       	</TABLE>
                        <p>&nbsp;</p></td>
						  </TR>
						</table>
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

  
  <%@include file="/inc/footer.jsp"%>
