<%@ page language="java" contentType="text/html;charset=gbk"%>
<%@ include file="/inc/top.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="model.MessageModel"%>
<%@ page import="java.util.*"%>
<%@ page import="control.bean.ManageGuestBook"%>
<jsp:useBean id="managemessage" class="control.bean.ManageGuestBook" scope="page"></jsp:useBean>
<jsp:useBean id="gmodel" class="model.MessageModel" scope="page"></jsp:useBean>
<!--顶部结束!-->
<%
	String adminname = (String)session.getAttribute("adminname");
	if(adminname==null){
%>
	<script language="JavaScript">
		alert("请先登陆");
	</script>
	<%
		response.sendRedirect(request.getContextPath()+"/index.jsp");
}%>
<%!
	int updatestate = 0;
	int totalpages;
    int countperpage=5; 
    int totalcount;
    int currentpage=0;
    int pagecode = 1;
    Vector guestvector;
%>
<%--计算页数 --%>
<%
 	totalcount = managemessage.getTotalrow();
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
	guestvector = managemessage.displayQuery(5,currentpage,"* from MessageInfo order by MessageID","MessageID");
%>
<script language="JavaScript" >
	function page_check()
	{
		if(document.guestpage.page.value=="")
		{
			alert("请输入页数");
			document.guestpage.page.focus();
			return false;
		}
		return true;
	}
</script>
<%--更新新闻 --%>
<%
	String update = request.getParameter("action");
	int messageid = 0;
	if("update".equals(update)){
		if(request.getParameter("messageid")!=null)
		messageid = Integer.parseInt(request.getParameter("messageid"));
		String modmessagetitle = request.getParameter("modmessagetitle");
		String modmessagearea = request.getParameter("modmessagearea");
		int rowaffect = managemessage.updateMessage(messageid,modmessagetitle,modmessagearea);
		if(rowaffect>0){
		%>
		<script language="JavaScript">
			alert("修改成功");
			window.location = "guestbook.jsp";
		</script>
<%}else{%>
	<script language="JavaScript">
		alert("修改失败");
		window.location = "guestbook.jsp";
	</script>
<%}}%>
<%
	String delete = request.getParameter("action");
	if("delete".equals(delete)){
		if(request.getParameter("messageid")!=null)
			messageid = Integer.parseInt(request.getParameter("messageid"));
			int rowaffect = managemessage.deleteMessage(messageid);
			if(rowaffect>0){
			%>
		<script language="JavaScript">
			alert("删除成功");
			window.location = "guestbook.jsp";
		</script>
<%}else{%>
	<script language="JavaScript">
		alert("删除失败");
		window.location = "guestbook.jsp";
	</script>
<%}}%>
<%
	if(request.getParameter("action")!=null)
		updatestate=1;
%>
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
									<p><a href="<%=request.getContextPath()%>/index.jsp"><FONT color="#ffffff">动力音乐<FONT color="#000000"
										style="BACKGROUND-COLOR: #ffffff"></FONT></FONT>
										</a></p></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD height="8" bgcolor="#000000"> 
                        <div align="center">
                          <p><font color="#FFFFFF" size="3">后台管理--留言管理</font></p>
                          </div></TD>
                    </TR>
                    <TR vAlign=top> 
                      <TD width="62%" height="220">
                      <table width="196" height="245" align="left">
                          <tr>
						  <tr>
                            <p></p>
                            <td width="188" height="50"><a href="<%=request.getContextPath()%>/Login?action=logout">注销</a></td>
                          </tr>
						  <tr>
                            <td height="50"><a href="<%=request.getContextPath()%>/admin/user.jsp">管理用户</a></td>
                          </tr>
                          <tr>
						  <tr>
                            <td height="50"><a href="news.jsp">管理新闻</a></td>
                          </tr>
						  <tr>
                            <td height="50"><a href="music.jsp">管理歌曲</a></td>
                          </tr><tr>
                            <td height="50"><a href="guestbook.jsp">管理留言</a></td>
                          </tr>
                        </table> 
                          <table width="40%" height="23" border="0" align="center">
                          <tr> 
                            <td width="42%"><a href="<%=request.getContextPath()%>/admin/user.jsp">用户管理</a></td>
                            <td width="30%"><a href="<%=request.getContextPath()%>/admin/news.jsp?state=1">添加新闻</a></td>
                            <td width="28%"><a href="<%=request.getContextPath()%>/admin/index.jsp">管理首页</a></td>
                          </tr>
                        </table>
                       <%if(updatestate==0){%>
					    <table width="450" border="0" cellpadding="3" cellspacing="1" bgcolor="#FF00FF">
                          <tr bgcolor="#cccccc">
							<td align="center" nowrap width="25%"><b>标题</b></td>
							<td align="center" nowrap width="25%"><b>发布人</b></td>
							<td align="center" nowrap width="25%"><b>提交时间</b></td>
							<td align="center" nowrap width="25%"><b>操作</b></td>
						  </tr>
					  	<% 
						  		for(int i=0;i<guestvector.size();i++){
						  		gmodel.setMessageID(((MessageModel)guestvector.get(i)).getMessageID());
						    	gmodel.setMessageTitle(((MessageModel)guestvector.get(i)).getMessageTitle());
						    	gmodel.setPromulgator(((MessageModel)guestvector.get(i)).getPromulgator());
						    	gmodel.setSubmitime(((MessageModel)guestvector.get(i)).getSubmitime());
						 %><TR bgcolor="#6600CC">
						 	   <td align="center" nowrap width="25%">
						       <a href="guestbook.jsp?action=modify&messageid=<%=gmodel.getMessageID()%>&position=<%=i%>">
						       <%=gmodel.getMessageTitle()%></a></td>
						       <td align="center" nowrap width="25%"><%=gmodel.getPromulgator()%></td>
						       <td align="center" nowrap width="25%"><%=gmodel.getSubmitime()%></td>
						       <td align="center" nowrap width="25%">
						       <a href="guestbook.jsp?action=delete&messageid=<%=gmodel.getMessageID()%>">
						      		 删除</a></td>
						   	</TR>
						  	<%}%>
						 </table>
						 <FORM name="guestpage" method="post" onSubmit="return page_check();"action="guestbook.jsp">
						<TABLE width="36%" align=right>
						<tr>
						<td >共有<%out.print(totalpages);%>页,现在是第<%out.print(currentpage);%>页</td>
						</tr>
						<tr>
						<td>
						<a href="<%=request.getContextPath()%>/admin/guestbook.jsp?page=<%=currentpage-1%>">上一页</a>
						<a href="<%=request.getContextPath()%>/admin/guestbook.jsp?page=<%=currentpage+1%>">下一页 </a>
						<a href="<%=request.getContextPath()%>/admin/guestbook.jsp?page=1">首页 </a>
						<a href="<%=request.getContextPath()%>/admin/guestbook.jsp?page=<%=totalpages%>">尾页 </a>
						<input name="page" type="text" size="5">页<input type="submit" value="Go">
						</td>
						</tr>
						</TABLE>
						</FORM>
                        <%--显示待查看更新的新闻资料 --%>
                        <%}else{
     						String modify = request.getParameter("action");
     						int position =0;
     						if(request.getParameter("messageid")!=null)
     						{
     							if(request.getParameter("position")!=null)
     							position = Integer.parseInt(request.getParameter("position"));
     						}
     						if("modify".equals(modify)){
     							gmodel.setMessageID(((MessageModel)guestvector.get(position)).getMessageID());
						    	gmodel.setMessageTitle(((MessageModel)guestvector.get(position)).getMessageTitle());
						    	gmodel.setPromulgator(((MessageModel)guestvector.get(position)).getPromulgator());
						    	gmodel.setSubmitime(((MessageModel)guestvector.get(position)).getSubmitime());
						    	gmodel.setMessageContent(((MessageModel)guestvector.get(position)).getMessageContent());
     					%>
     					<FORM action="guestbook.jsp?action=update&messageid=<%=gmodel.getMessageID()%>" method=post>
     					 <table width="550" height="175" border="0" align=center>
                            <tr align="center"> 
                              <td colspan="3"><b>修改留言</b></td>
                          </tr>
                          <tr> 
                              <td width="19%" align="right"><strong>留言标题</strong></td>
                            <td width="81%" colspan="3" align="left">
                             <input type="text" name="modmessagetitle" value="<%=gmodel.getMessageTitle()%>">
                             </td>
                          </tr>
                          <tr align="center"> 
                            <td colspan="3"><strong>留言内容</strong></td>
                          </tr>
                          <tr align="left"> 
                            <td height="41" colspan="3"> 
                            <textarea name="modmessagearea" rows="8" cols="50" wrap="soft"><%=gmodel.getMessageContent()%></textarea> 
                            </td>
                          </tr>
                          <tr align="center"> 
                            <td align="right" width="37%"> 
                              <input type="submit" value="提交">
                            </td>
                            <td align="left"> 
                              <input type="reset">
                            </td>
                          </tr>
                        </table>
                        </FORM>
     					 <%}updatestate=0;}%>
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